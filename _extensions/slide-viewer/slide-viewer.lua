return {
  ['slide-viewer'] = function(args, kwargs)
    local src = pandoc.utils.stringify(args[1])
    local title = kwargs['title'] or 'Slides'
    local height = kwargs['height'] or '700px'

    -- Generate unique ID for this viewer
    local id = 'viewer-' .. string.gsub(src, '[^%w]', '-')

    local html = string.format([[
<div id="%s" style="max-width: 1000px; margin: 2rem auto;">
  <h3 style="margin-bottom: 1.5rem; color: #2c3e50; text-align: center; font-size: 1.8rem;">%s</h3>

  <!-- PDF Canvas Container -->
  <div style="background: #f8f9fa; padding: 20px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); position: relative;">
    <canvas id="pdf-canvas-%s" style="max-width: 100%%; display: block; margin: 0 auto; box-shadow: 0 2px 10px rgba(0,0,0,0.2); background: white;"></canvas>

    <!-- Navigation Arrows -->
    <button onclick="slideViewer_%s.prevPage()"
      style="position: absolute; left: 10px; top: 50%%; transform: translateY(-50%%); width: 50px; height: 50px; background: rgba(102, 126, 234, 0.9); color: white; border: none; border-radius: 50%%; cursor: pointer; font-size: 24px; box-shadow: 0 2px 10px rgba(0,0,0,0.3); transition: all 0.3s; display: flex; align-items: center; justify-content: center;"
      onmouseover="this.style.background='rgba(102, 126, 234, 1)'; this.style.transform='translateY(-50%%) scale(1.1)';"
      onmouseout="this.style.background='rgba(102, 126, 234, 0.9)'; this.style.transform='translateY(-50%%) scale(1)';"
      title="Previous slide (←)">
      ◀
    </button>

    <button onclick="slideViewer_%s.nextPage()"
      style="position: absolute; right: 10px; top: 50%%; transform: translateY(-50%%); width: 50px; height: 50px; background: rgba(102, 126, 234, 0.9); color: white; border: none; border-radius: 50%%; cursor: pointer; font-size: 24px; box-shadow: 0 2px 10px rgba(0,0,0,0.3); transition: all 0.3s; display: flex; align-items: center; justify-content: center;"
      onmouseover="this.style.background='rgba(102, 126, 234, 1)'; this.style.transform='translateY(-50%%) scale(1.1)';"
      onmouseout="this.style.background='rgba(102, 126, 234, 0.9)'; this.style.transform='translateY(-50%%) scale(1)';"
      title="Next slide (→)">
      ▶
    </button>
  </div>

  <!-- Controls Bottom Bar -->
  <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 1rem; padding: 15px; background: white; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">
    <div style="display: flex; gap: 10px;">
      <button onclick="slideViewer_%s.zoomOut()"
        style="width: 40px; height: 40px; background: #764ba2; color: white; border: none; border-radius: 6px; cursor: pointer; font-size: 18px; font-weight: bold; transition: all 0.2s;"
        onmouseover="this.style.transform='scale(1.1)';"
        onmouseout="this.style.transform='scale(1)';"
        title="Zoom out">
        −
      </button>
      <button onclick="slideViewer_%s.zoomIn()"
        style="width: 40px; height: 40px; background: #764ba2; color: white; border: none; border-radius: 6px; cursor: pointer; font-size: 18px; font-weight: bold; transition: all 0.2s;"
        onmouseover="this.style.transform='scale(1.1)';"
        onmouseout="this.style.transform='scale(1)';"
        title="Zoom in">
        +
      </button>
    </div>

    <div id="page-info-%s" style="padding: 10px 20px; background: linear-gradient(135deg, #667eea 0%%, #764ba2 100%%); color: white; border-radius: 20px; font-weight: 600; font-size: 14px; box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);">
      Page 1 / 1
    </div>

    <a href="%s" download
      style="padding: 10px 20px; background: #28a745; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: 500; text-decoration: none; display: flex; align-items: center; gap: 8px; transition: all 0.2s; box-shadow: 0 2px 8px rgba(40, 167, 69, 0.3);"
      onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 4px 12px rgba(40, 167, 69, 0.4)';"
      onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 8px rgba(40, 167, 69, 0.3)';">
      📥 Download
    </a>
  </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js"></script>
<script>
(function() {
  const pdfjsLib = window['pdfjs-dist/build/pdf'];
  pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';

  const url = '%s';
  const canvas = document.getElementById('pdf-canvas-%s');
  const ctx = canvas.getContext('2d');

  let pdfDoc = null;
  let pageNum = 1;
  let pageRendering = false;
  let pageNumPending = null;
  let scale = 1.5;

  function renderPage(num) {
    pageRendering = true;
    pdfDoc.getPage(num).then(function(page) {
      const viewport = page.getViewport({scale: scale});
      canvas.height = viewport.height;
      canvas.width = viewport.width;

      const renderContext = {
        canvasContext: ctx,
        viewport: viewport
      };

      const renderTask = page.render(renderContext);
      renderTask.promise.then(function() {
        pageRendering = false;
        if (pageNumPending !== null) {
          renderPage(pageNumPending);
          pageNumPending = null;
        }
      });
    });

    document.getElementById('page-info-%s').textContent =
      'Page ' + num + ' / ' + pdfDoc.numPages;
  }

  function queueRenderPage(num) {
    if (pageRendering) {
      pageNumPending = num;
    } else {
      renderPage(num);
    }
  }

  function onPrevPage() {
    if (pageNum <= 1) return;
    pageNum--;
    queueRenderPage(pageNum);
  }

  function onNextPage() {
    if (pageNum >= pdfDoc.numPages) return;
    pageNum++;
    queueRenderPage(pageNum);
  }

  function onZoomIn() {
    scale += 0.25;
    queueRenderPage(pageNum);
  }

  function onZoomOut() {
    if (scale <= 0.5) return;
    scale -= 0.25;
    queueRenderPage(pageNum);
  }

  // Expose functions globally
  window.slideViewer_%s = {
    prevPage: onPrevPage,
    nextPage: onNextPage,
    zoomIn: onZoomIn,
    zoomOut: onZoomOut
  };

  // Load the PDF
  pdfjsLib.getDocument(url).promise.then(function(pdfDoc_) {
    pdfDoc = pdfDoc_;
    renderPage(pageNum);
  }).catch(function(error) {
    console.error('Error loading PDF:', error);
    canvas.parentElement.innerHTML = '<p style="color: red; text-align: center; padding: 40px;">Error loading PDF. Please check the file path.</p>';
  });

  // Keyboard navigation
  document.addEventListener('keydown', function(e) {
    if (e.key === 'ArrowLeft') onPrevPage();
    if (e.key === 'ArrowRight') onNextPage();
  });
})();
</script>
]], id, title, id, id, id, id, id, id, src, src, id, id, id)

    return pandoc.RawBlock('html', html)
  end
}
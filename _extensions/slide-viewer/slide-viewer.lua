return {
  ['slide-viewer'] = function(args, kwargs)
    local src = pandoc.utils.stringify(args[1])
    local title = kwargs['title'] or 'Slides'
    local height = kwargs['height'] or '700px'

    -- Generate unique ID for this viewer
    local id = 'viewer-' .. string.gsub(src, '[^%w]', '-')

    local html = string.format([[
<div id="%s" style="max-width: 1000px; margin: 2rem auto;">
  <h3 style="margin-bottom: 1rem; color: #333; text-align: center;">%s</h3>

  <!-- Controls -->
  <div style="display: flex; justify-content: center; gap: 10px; margin-bottom: 1rem; flex-wrap: wrap;">
    <button onclick="slideViewer_%s.prevPage()" style="padding: 10px 20px; background: #667eea; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: 500; display: flex; align-items: center; gap: 5px;">
      ◀ Previous
    </button>
    <span id="page-info-%s" style="padding: 10px 20px; background: #f0f0f0; border-radius: 6px; font-weight: 500; display: flex; align-items: center;">
      Page 1 / 1
    </span>
    <button onclick="slideViewer_%s.nextPage()" style="padding: 10px 20px; background: #667eea; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: 500; display: flex; align-items: center; gap: 5px;">
      Next ▶
    </button>
    <button onclick="slideViewer_%s.zoomIn()" style="padding: 10px 20px; background: #764ba2; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: 500;">
      🔍+
    </button>
    <button onclick="slideViewer_%s.zoomOut()" style="padding: 10px 20px; background: #764ba2; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: 500;">
      🔍-
    </button>
    <a href="%s" download style="padding: 10px 20px; background: #28a745; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: 500; text-decoration: none; display: flex; align-items: center; gap: 5px;">
      📥 Download
    </a>
  </div>

  <!-- PDF Canvas -->
  <div style="background: #f8f9fa; padding: 20px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); display: flex; justify-content: center; align-items: center; min-height: %s;">
    <canvas id="pdf-canvas-%s" style="max-width: 100%%; box-shadow: 0 2px 10px rgba(0,0,0,0.2); background: white;"></canvas>
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
    canvas.parentElement.innerHTML = '<p style="color: red; text-align: center;">Error loading PDF. Please check the file path.</p>';
  });

  // Keyboard navigation
  document.addEventListener('keydown', function(e) {
    if (e.key === 'ArrowLeft') onPrevPage();
    if (e.key === 'ArrowRight') onNextPage();
  });
})();
</script>
]], id, title, id, id, id, id, id, src, height, id, src, id, id, id, id)

    return pandoc.RawBlock('html', html)
  end
}
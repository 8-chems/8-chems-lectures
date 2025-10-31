return {
  ['slide-viewer'] = function(args, kwargs)
    local src = pandoc.utils.stringify(args[1])
    local title = kwargs['title'] or 'Slides'
    local height = kwargs['height'] or '700px'

    -- Generate unique ID for this viewer (must be valid JS identifier)
    local id = string.gsub(src, '[^%w]', '_')
    id = 'id_' .. id  -- Ensure it starts with a letter

    local html = string.format([[
<div id="viewer-%s" style="max-width: 1100px; margin: 2rem auto;">
  <!-- Spinner Animation -->
  <style>
    @keyframes spin {
      0%% { transform: rotate(0deg); }
      100%% { transform: rotate(360deg); }
    }
  </style>

  <!-- Metadata/Controls Panel -->
  <div style="background: var(--bs-body-bg, #fff); border: 1px solid var(--bs-border-color, #dee2e6); border-radius: 8px; margin-bottom: 1rem; box-shadow: 0 2px 4px rgba(0,0,0,0.4);">
    <div style="padding: 12px 16px; display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--bs-border-color, #dee2e6);">
      <div style="display: flex; align-items: center; gap: 8px;">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"/>
          <line x1="7" y1="7" x2="7.01" y2="7"/>
        </svg>
        <span style="font-weight: 600; font-size: 15px;">%s</span>
      </div>

      <div style="display: flex; gap: 6px; align-items: center;">
        <!-- Zoom Controls -->
        <button onclick="slideViewer_%s.zoomOut()"
          title="Zoom Out"
          style="width: 34px; height: 34px; background: rgba(255, 255, 255, 0.8); color: #000; border: 1px solid var(--bs-border-color, #dee2e6); border-radius: 50%%; cursor: pointer; font-size: 18px; font-weight: bold; box-shadow: 0 1px 3px rgba(0,0,0,0.3); transition: all 0.2s; display: flex; align-items: center; justify-content: center;"
          onmouseover="this.style.background='rgba(255, 255, 255, 1)'; this.style.transform='scale(1.05)';"
          onmouseout="this.style.background='rgba(255, 255, 255, 0.8)'; this.style.transform='scale(1)';">
          −
        </button>

        <button onclick="slideViewer_%s.resetZoom()"
          title="Reset Zoom"
          style="width: 34px; height: 34px; background: rgba(255, 255, 255, 0.8); color: #000; border: 1px solid var(--bs-border-color, #dee2e6); border-radius: 50%%; cursor: pointer; box-shadow: 0 1px 3px rgba(0,0,0,0.3); transition: all 0.2s; display: flex; align-items: center; justify-content: center;"
          onmouseover="this.style.background='rgba(255, 255, 255, 1)'; this.style.transform='scale(1.05)';"
          onmouseout="this.style.background='rgba(255, 255, 255, 0.8)'; this.style.transform='scale(1)';">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <polyline points="23 4 23 10 17 10"/>
            <path d="M20.49 15a9 9 0 1 1-2.12-9.36L23 10"/>
          </svg>
        </button>

        <button onclick="slideViewer_%s.zoomIn()"
          title="Zoom In"
          style="width: 34px; height: 34px; background: rgba(255, 255, 255, 0.8); color: #000; border: 1px solid var(--bs-border-color, #dee2e6); border-radius: 50%%; cursor: pointer; font-size: 18px; font-weight: bold; box-shadow: 0 1px 3px rgba(0,0,0,0.3); transition: all 0.2s; display: flex; align-items: center; justify-content: center;"
          onmouseover="this.style.background='rgba(255, 255, 255, 1)'; this.style.transform='scale(1.05)';"
          onmouseout="this.style.background='rgba(255, 255, 255, 0.8)'; this.style.transform='scale(1)';">
          +
        </button>

        <div style="width: 1px; height: 24px; background: var(--bs-border-color, #dee2e6); margin: 0 4px;"></div>

        <!-- Download Button -->
        <a href="%s" download
          title="Download PDF"
          style="width: 34px; height: 34px; background: rgba(255, 255, 255, 0.8); color: #000; border: 1px solid var(--bs-border-color, #dee2e6); border-radius: 50%%; cursor: pointer; box-shadow: 0 1px 3px rgba(0,0,0,0.3); transition: all 0.2s; display: flex; align-items: center; justify-content: center; text-decoration: none;"
          onmouseover="this.style.background='rgba(255, 255, 255, 1)'; this.style.transform='scale(1.05)';"
          onmouseout="this.style.background='rgba(255, 255, 255, 0.8)'; this.style.transform='scale(1)';">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
            <polyline points="7 10 12 15 17 10"/>
            <line x1="12" y1="15" x2="12" y2="3"/>
          </svg>
        </a>
      </div>
    </div>
  </div>

  <!-- PDF Canvas Container -->
  <div id="pdf-container-%s" style="position: relative; background: var(--bs-secondary-bg, #f8f9fa); border: 1px solid var(--bs-border-color, #dee2e6); border-radius: 8px; padding: 20px; box-shadow: 0 2px 4px rgba(0,0,0,0.4); min-height: %s; display: flex; align-items: center; justify-content: center;">
    <!-- Loading Panel -->
    <div id="loading-panel-%s" style="text-align: center; padding: 60px 20px;">
      <div style="width: 50px; height: 50px; border: 4px solid var(--bs-border-color, #dee2e6); border-top: 4px solid var(--bs-primary, #0d6efd); border-radius: 50%%; margin: 0 auto 20px; animation: spin 1s linear infinite;"></div>
      <p style="font-size: 16px; font-weight: 500; color: var(--bs-body-color, #000); margin: 0;">Loading PDF...</p>
      <p style="font-size: 14px; color: var(--bs-secondary-color, #6c757d); margin-top: 8px;">Please wait</p>
    </div>

    <canvas id="pdf-canvas-%s" style="max-width: 100%%; box-shadow: 0 2px 8px rgba(0,0,0,0.5); background: white; display: none;"></canvas>

    <!-- Left Arrow -->
    <button id="left-arrow-%s" onclick="slideViewer_%s.prevPage()"
      style="position: absolute; left: 20px; top: 50%%; transform: translateY(-50%%); width: 48px; height: 48px; background: var(--bs-body-bg, #fff); color: var(--bs-body-color, #000); border: 2px solid var(--bs-border-color, #dee2e6); border-radius: 4px; cursor: pointer; font-size: 20px; box-shadow: 0 2px 6px rgba(0,0,0,0.4); transition: all 0.2s; display: none; align-items: center; justify-content: center; z-index: 10;"
      onmouseover="this.style.boxShadow='0 4px 12px rgba(0,0,0,0.5)'; this.style.transform='translateY(-50%%) translateX(-3px)';"
      onmouseout="this.style.boxShadow='0 2px 6px rgba(0,0,0,0.4)'; this.style.transform='translateY(-50%%)';"
      title="Previous slide (←)">
      ◀
    </button>

    <!-- Right Arrow -->
    <button id="right-arrow-%s" onclick="slideViewer_%s.nextPage()"
      style="position: absolute; right: 20px; top: 50%%; transform: translateY(-50%%); width: 48px; height: 48px; background: var(--bs-body-bg, #fff); color: var(--bs-body-color, #000); border: 2px solid var(--bs-border-color, #dee2e6); border-radius: 4px; cursor: pointer; font-size: 20px; box-shadow: 0 2px 6px rgba(0,0,0,0.4); transition: all 0.2s; display: none; align-items: center; justify-content: center; z-index: 10;"
      onmouseover="this.style.boxShadow='0 4px 12px rgba(0,0,0,0.5)'; this.style.transform='translateY(-50%%) translateX(3px)';"
      onmouseout="this.style.boxShadow='0 2px 6px rgba(0,0,0,0.4)'; this.style.transform='translateY(-50%%)';"
      title="Next slide (→)">
      ▶
    </button>
  </div>

  <!-- Page Counter -->
  <div style="text-align: center; margin-top: 1rem;">
    <div id="page-info-%s" style="display: inline-block; padding: 8px 20px; background: var(--bs-body-bg, #fff); color: var(--bs-body-color, #000); border: 1px solid var(--bs-border-color, #dee2e6); border-radius: 20px; font-weight: 600; font-size: 14px; box-shadow: 0 1px 3px rgba(0,0,0,0.3);">
      Page 1 / 1
    </div>
  </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js"></script>
<script>
(function() {
  if (typeof window['pdfjs-dist/build/pdf'] === 'undefined') {
    console.error('PDF.js library not loaded');
    return;
  }

  const pdfjsLib = window['pdfjs-dist/build/pdf'];
  pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';

  const url = '%s';
  const canvas = document.getElementById('pdf-canvas-%s');
  const loadingPanel = document.getElementById('loading-panel-%s');
  const leftArrow = document.getElementById('left-arrow-%s');
  const rightArrow = document.getElementById('right-arrow-%s');
  const container = document.getElementById('pdf-container-%s');

  if (!canvas || !loadingPanel || !leftArrow || !rightArrow) {
    console.error('Required elements not found');
    return;
  }

  const ctx = canvas.getContext('2d');
  let containerWidth = container.offsetWidth - 40;

  let pdfDoc = null;
  let pageNum = 1;
  let pageRendering = false;
  let pageNumPending = null;
  let scale = 1.3;

  function hideLoading() {
    loadingPanel.style.display = 'none';
    canvas.style.display = 'block';
    leftArrow.style.display = 'flex';
    rightArrow.style.display = 'flex';
  }

  function showError(message) {
    loadingPanel.innerHTML = '<div style="text-align: center; padding: 40px 20px;"><svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="#dc3545" stroke-width="2" style="margin-bottom: 16px;"><circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/></svg><p style="font-size: 18px; font-weight: 600; color: #dc3545; margin-bottom: 8px;">Failed to load PDF</p><p style="font-size: 14px; color: #6c757d;">' + message + '</p></div>';
  }

  function renderPage(num) {
    pageRendering = true;

    pdfDoc.getPage(num).then(function(page) {
      const viewport = page.getViewport({scale: 1});
      const desiredWidth = containerWidth * scale;
      const actualScale = desiredWidth / viewport.width;
      const scaledViewport = page.getViewport({scale: actualScale});

      canvas.height = scaledViewport.height;
      canvas.width = scaledViewport.width;

      const renderContext = {
        canvasContext: ctx,
        viewport: scaledViewport
      };

      const renderTask = page.render(renderContext);
      renderTask.promise.then(function() {
        pageRendering = false;
        if (pageNumPending !== null) {
          renderPage(pageNumPending);
          pageNumPending = null;
        }
      }).catch(function(err) {
        console.error('Error rendering page:', err);
        pageRendering = false;
      });
    }).catch(function(err) {
      console.error('Error getting page:', err);
      pageRendering = false;
    });

    const pageInfo = document.getElementById('page-info-%s');
    if (pageInfo && pdfDoc) {
      pageInfo.textContent = 'Page ' + num + ' / ' + pdfDoc.numPages;
    }
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
    if (!pdfDoc || pageNum >= pdfDoc.numPages) return;
    pageNum++;
    queueRenderPage(pageNum);
  }

  function onZoomIn() {
    scale = Math.min(scale + 0.2, 2.5);
    queueRenderPage(pageNum);
  }

  function onZoomOut() {
    scale = Math.max(scale - 0.2, 0.5);
    queueRenderPage(pageNum);
  }

  function onResetZoom() {
    scale = 1.3;
    queueRenderPage(pageNum);
  }

  // Expose functions globally
  window.slideViewer_%s = {
    prevPage: onPrevPage,
    nextPage: onNextPage,
    zoomIn: onZoomIn,
    zoomOut: onZoomOut,
    resetZoom: onResetZoom
  };

  // Load PDF
  console.log('Loading PDF from:', url);
  pdfjsLib.getDocument(url).promise.then(function(pdfDoc_) {
    pdfDoc = pdfDoc_;
    console.log('PDF loaded successfully. Total pages:', pdfDoc.numPages);
    hideLoading();
    renderPage(pageNum);
  }).catch(function(error) {
    console.error('Error loading PDF:', error);
    showError(error.message);
  });

  // Keyboard navigation
  document.addEventListener('keydown', function(e) {
    if (e.key === 'ArrowLeft' || e.key === 'Left') onPrevPage();
    if (e.key === 'ArrowRight' || e.key === 'Right') onNextPage();
  });

  // Handle window resize
  let resizeTimeout;
  window.addEventListener('resize', function() {
    clearTimeout(resizeTimeout);
    resizeTimeout = setTimeout(function() {
      containerWidth = container.offsetWidth - 40;
      if (pdfDoc) queueRenderPage(pageNum);
    }, 250);
  });
})();
</script>
]], id, title, id, id, id, src, id, height, id, id, id, id, id, id, id, src, id, id, id, id, id, id, id)

    return pandoc.RawBlock('html', html)
  end
}
return {
  ['slide-viewer'] = function(args, kwargs)
    local src = pandoc.utils.stringify(args[1])
    local title = kwargs['title'] or 'Slides'
    local height = kwargs['height'] or '600px'

    local html = string.format([[
<div class="slide-viewer" style="max-width: 900px; margin: 2rem auto;">
  <h3 style="margin-bottom: 1rem; color: #333;">%s</h3>
  <div style="background: linear-gradient(135deg, #667eea 0%%, #764ba2 100%%); padding: 2px; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.15);">
    <div style="background: white; border-radius: 10px; overflow: hidden;">
      <iframe
        src="https://mozilla.github.io/pdf.js/web/viewer.html?file=%s#pagemode=none"
        width="100%%"
        height="%s"
        style="border: none; display: block;">
      </iframe>
    </div>
  </div>
  <div style="text-align: center; margin-top: 1rem;">
    <a href="%s" download class="download-btn" style="display: inline-block; padding: 0.5rem 1.5rem; background: #667eea; color: white; text-decoration: none; border-radius: 6px; font-weight: 500; transition: all 0.3s;">
      📥 Download Slides
    </a>
  </div>
</div>
]], title, src, height, src)

    return pandoc.RawBlock('html', html)
  end
}
-- filters/warninglang.lua
function Div(el)
  -- On ne traite que les divs avec classe "warninglang"
  if el.classes:includes("warninglang") then
    local filename_relative = quarto.doc.input_file
    local html_text

    if filename_relative:find("/en/") then
      -- version anglaise → lien vers la française
      local link = filename_relative:gsub("/en/", "/")
      html_text =
        "This is the English 🇬🇧 🇺🇸 version of this chapter, " ..
        "to see the French version go " ..
        "<a href=\"" .. link .. "\">there</a>."
    else
      -- version française → lien vers l’anglaise
      local link = filename_relative:gsub("/content/", "/en/content/")
      html_text =
        "Ceci est la version française 🇫🇷 de ce chapitre, " ..
        "pour voir la version anglaise allez " ..
        "<a href=\"" .. link .. "\">ici</a>."
    end

    -- Retourne un bloc callout-note contenant ce texte
    return pandoc.Div(
      { pandoc.Para{ pandoc.RawInline("html", html_text) } },
      pandoc.Attr("", { "callout-note" })
    )
  end
end

-- theme
vim.opt.termguicolors=true
vim.opt.background="light"
-- Available theme value:
-- "ayu", "kanagawa", "deus"
local theme = "ayu"

local function onedark_setup()
  vim.g.style = 'darker'
  vim.g.transparent= true
end

local function ayu_setup()
  require('ayu').setup({
      mirage = true,
      overrides = {},
  })
end

local function deus_setup()
  vim.g.deus_background = "hard"
end

local function kanagawa_setup()
  require('kanagawa').setup({
      undercurl = true,           -- enable undercurls
      commentStyle = "italic",
      functionStyle = "bold",
      keywordStyle = "italic",
      statementStyle = "bold",
      typeStyle = "NONE",
      variablebuiltinStyle = "italic",
      specialReturn = true,       -- special highlight for the return keyword
      specialException = true,    -- special highlight for exception handling keywords
      transparent = false,        -- do not set background color
      colors = {},
      overrides = {},
  })
end

local theme_opt = {
  ["ayu"] = ayu_setup,
  ["deus"] = deus_setup,
  ["kanagawa"] = kanagawa_setup,
  ["onedark"] = onedark_setup,
}

theme_opt[theme]()

vim.cmd("colorscheme "..theme)

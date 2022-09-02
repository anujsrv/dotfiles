vim.opt.background = 'dark'

-- vim.g.gruvbox_material_foreground='mix'
-- vim.g.gruvbox_material_background='soft'

require('gitsigns').setup()

require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  overrides = {}
})

vim.cmd('colorscheme gruvbox')
-- vim.cmd('colorscheme jellybeans')
-- vim.cmd('colorscheme gruvbox-material')

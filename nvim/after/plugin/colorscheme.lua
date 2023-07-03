vim.opt.background = 'dark'

vim.g.gruvbox_material_foreground='material'
vim.g.gruvbox_material_background=''

require('gitsigns').setup()

-- local color = require('nightfox.lib.color')
-- 
-- require("nightfox").setup({
--   groups = {
--     terafox = {
--       -- Identifier = {fg = "palette.red.dim"},
--       TSVariable = {fg = "palette.white.dim"},
--     }
--   }
-- })

-- require("gruvbox").setup({
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = true,
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "soft", -- can be "hard", "soft" or empty string
--   overrides = {
--     Keyword = { link = "GruvboxAquaBold" },
--   }
-- })

-- vim.cmd('colorscheme gruvbox')
-- vim.cmd('colorscheme jellybeans')
vim.cmd('colorscheme gruvbox-material')
-- vim.cmd('colorscheme terafox')
-- vim.cmd('colorscheme kanagawa')

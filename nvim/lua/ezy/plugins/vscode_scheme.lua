-- For dark theme (neovim's default)
vim.o.background = 'dark'

local c = require('vscode.colors')
require('vscode').setup({
    -- Enable transparent background
    -- transparent = true,

    -- Enable italic comment
    italic_comments = true,
-- Disable nvim-tree background color
    disable_nvimtree_bg = false,

    -- Override colors (see ./lua/vscode/colors.lua)

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Comment = {fg = '#6e6e6e'},
    }
})

vim.cmd[[highlight CursorLine guibg=#303030]]
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
vim.cmd([[ highlight NvimTreeCursorLine guibg=#303030]])

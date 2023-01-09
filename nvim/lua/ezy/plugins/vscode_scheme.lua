-- For dark theme (neovim's default)
vim.o.background = 'dark'

local c = require('vscode.colors')
require('vscode').setup({
    -- Enable transparent background
    -- transparent = true,

    -- Enable italic comment
    italic_comments = true,
-- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Comment = {fg = '#6e6e6e'},
        CursorLine  = {bg ='#1a1a1a' },
        -- StatusLineNC =  {fg = '#FF0000', bg = '#FF0000'},
        -- StatusLine=  {fg = '#FF0000', bg = '#FF0000'}
        TabLine = {fg = '#FF0000', bg = '#FF0000'},
        TabLineFill = {fg = '#FF0000', bg = '#FF0000'},
        TabLineSel = {fg = '#FF0000', bg = '#FF0000'},
        Title = {fg = '#FF0000', bg = '#FF0000'}
    }
})



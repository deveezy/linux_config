require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "help", "javascript", "typescript", "c", "cpp", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    custom_captures = {
      -- ["proc_arg"] = "Identifier"
    },


    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


vim.api.nvim_set_hl(0, "@namespace", { fg = "#d7d7d7" })
vim.api.nvim_set_hl(0, "@keyword", { fg = "#569CD6" })
vim.api.nvim_set_hl(0, "@comment", { fg = "#6e6e6e" })
vim.api.nvim_set_hl(0, "@preproc", { fg = "#9c9c9c" })
vim.api.nvim_set_hl(0, "@include", { fg = "#9c9c9c" })
vim.api.nvim_set_hl(0, "@define", { fg = "#9c9c9c" })
-- vim.api.nvim_set_hl(0, "@proc_arg", { fg = "#9c9c9c" })
-- vim.api.nvim_set_hl(0, "@error", { fg = "#25BED0" })
vim.api.nvim_set_hl(0, "@test2", { fg = "#ffff00" })

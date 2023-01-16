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
    enable = false,
    custom_captures = {
    },


    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  nt_cpp_tools = {
    enable = true,
    preview = {
      quit = 'q', -- optional keymapping for quit preview
      accept = '<tab>' -- optional keymapping for accept preview
    },
    -- header_extension = 'hpp', -- optional
    -- source_extension = 'cpp', -- optional
    custom_define_class_function_commands = { -- optional
    TSCppImplWrite = {
      output_handle = require'nvim-treesitter.nt-cpp-tools.output_handlers'.get_add_to_cpp()
    }
    --[[
    <your impl function custom command name> = {
    output_handle = function (str, context) 
    -- string contains the class implementation
    -- do whatever you want to do with it
    end
    }
    ]]
  }
}
}

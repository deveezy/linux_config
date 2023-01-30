local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format.with{filetypes = { "c", "cpp", "cs", "java", "cuda", "h", "hpp", "cxx" }},
        null_ls.builtins.formatting.cmake_format.with{filetypes = {"cmake", "txt"}},
        null_ls.builtins.diagnostics.cmake_lint,
    },
})

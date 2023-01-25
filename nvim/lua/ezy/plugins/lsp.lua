local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.clangd.setup {
   capabilities = capabilities
   --    textDocument = {
   --       semanticHighlightingCapabilities = {
   --          semanticHighlighting = true
   --       }
   --    }
   -- }
} 

-- require("clangd_extensions").setup {
--     server = {
--         -- options to pass to nvim-lspconfig
--         -- i.e. the arguments to require("lspconfig").clangd.setup({})
--     },
--     extensions = {
--         -- defaults:
--         -- Automatically set inlay hints (type hints)
--         autoSetHints = true,
--         -- These apply to the default ClangdSetInlayHints command
--         inlay_hints = {
--             -- Only show inlay hints for the current line
--             only_current_line = false,
--             -- Event which triggers a refersh of the inlay hints.
--             -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
--             -- not that this may cause  higher CPU usage.
--             -- This option is only respected when only_current_line and
--             -- autoSetHints both are true.
--             only_current_line_autocmd = "CursorHold",
--             -- whether to show parameter hints with the inlay hints or not
--             show_parameter_hints = true,
--             -- prefix for parameter hints
--             parameter_hints_prefix = "<- ",
--             -- prefix for all the other hints (type, chaining)
--             other_hints_prefix = "=> ",
--             -- whether to align to the length of the longest line in the file
--             max_len_align = false,
--             -- padding from the left if max_len_align is true
--             max_len_align_padding = 1,
--             -- whether to align to the extreme right or not
--             right_align = false,
--             -- padding from the right if right_align is true
--             right_align_padding = 7,
--             -- The color of the hints
--             highlight = "Comment",
--             -- The highlight group priority for extmark
--             priority = 100,
--         },
--         ast = {
--             -- These are unicode, should be available in any font
--             role_icons = {
--                  type = "🄣",
--                  declaration = "🄓",
--                  expression = "🄔",
--                  statement = ";",
--                  specifier = "🄢",
--                  ["template argument"] = "🆃",
--             },
--             kind_icons = {
--                 Compound = "🄲",
--                 Recovery = "🅁",
--                 TranslationUnit = "🅄",
--                 PackExpansion = "🄿",
--                 TemplateTypeParm = "🅃",
--                 TemplateTemplateParm = "🅃",
--                 TemplateParamObject = "🅃",
--             },
--             --[[ These require codicons (https://github.com/microsoft/vscode-codicons)
--             role_icons = {
--                 type = "",
--                 declaration = "",
--                 expression = "",
--                 specifier = "",
--                 statement = "",
--                 ["template argument"] = "",
--             },
--
--             kind_icons = {
--                 Compound = "",
--                 Recovery = "",
--                 TranslationUnit = "",
--                 PackExpansion = "",
--                 TemplateTypeParm = "",
--                 TemplateTemplateParm = "",
--                 TemplateParamObject = "",
--             }, ]]
--
--             highlights = {
--                 detail = "Comment",
--             },
--         },
--         memory_usage = {
--             border = "none",
--         },
--         symbol_info = {
--             border = "none",
--         },
--     },
-- }


vim.api.nvim_set_hl(0, "@namespace", { fg = "#d7d7d7" })
vim.api.nvim_set_hl(0, "@class", { fg = "#4ec9b0" })
vim.api.nvim_set_hl(0, "@enum", { fg = "#4ec9b0" })
vim.api.nvim_set_hl(0, "@enumMember", { fg = "#adde9c" })
vim.api.nvim_set_hl(0, "@comment", { fg = "#6e6e6e" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#6e6e6e" })
vim.api.nvim_set_hl(0, "@property", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "cPreProc", { fg = "#969798" })
vim.api.nvim_set_hl(0, "cInclude", { fg = "#969798" })
vim.api.nvim_set_hl(0, "cDefine", { fg = "#969798" })
vim.api.nvim_set_hl(0, "Statement", { fg = "#569cd6" })
vim.api.nvim_set_hl(0, "@typeParameter", { fg = "#4ec9b0" })
vim.api.nvim_set_hl(0, "@parameter", { fg = "#969798" })
vim.api.nvim_set_hl(0, "Label", { fg = "#569cd6" })
vim.api.nvim_set_hl(0, "Operator", { fg = "#569cd6" })

vim.api.nvim_set_hl(0, "@variable.fileScope", { fg = "#ffffff" })
-- hi @variable.fileScope guifg=#000000
-- :hi @variable.readonly fg=green

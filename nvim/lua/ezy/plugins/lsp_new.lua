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

setup()

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<CR>"] = function(fallback)
			if cmp.visible() then
				cmp.confirm()
			else
				fallback()
			end
		end,
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local bufopts = { noremap = true, silent = true }
	vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, bufopts)

	local opts = { noremap = true, silent = true }
	show_documentation = function()
		local filetype = vim.bo.filetype
		if vim.tbl_contains({ "vim", "help" }, filetype) then
			vim.cmd("h " .. vim.fn.expand("<cword>"))
		elseif vim.tbl_contains({ "man" }, filetype) then
			vim.cmd("Man " .. vim.fn.expand("<cword>"))
		else
			vim.lsp.buf.hover()
		end
	end

	vim.keymap.set("n", "K", ":lua show_documentation()<CR>")
	vim.keymap.set("n", "gd", vim.lsp.buf.definition)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
	vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "<leader>dl", "<cmd> Telescope diagnostics<CR>")
	vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
	vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	vim.keymap.set("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>")
	vim.keymap.set("n", "<leader>'", "<cmd>ClangdSwitchSourceHeader<CR>")
	vim.keymap.set("n", "gR", vim.lsp.buf.references)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>")
	vim.keymap.set("n", "<leader>m", vim.lsp.buf.format)
end

capabilities.offsetEncoding = { "utf-16" }
local lspconfig = require("lspconfig")
lspconfig.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {},
	flags = {
		debounce_text_changes = 150,
	},
})

lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.hls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.golangci_lint_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		gopls = {
			gofumpt = true,
		},
	},
	flags = {
		debounce_text_changes = 150,
	},
})

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		"rustup",
		"run",
		"stable",
		"rust-analyzer",
	},
})

local configs = require("lspconfig.configs")
local nvim_lsp = require("lspconfig")
if not configs.neocmake then
	configs.neocmake = {
		default_config = {
			cmd = { "neocmakelsp", "--stdio" },
			filetypes = { "cmake" },
			root_dir = function(fname)
				return nvim_lsp.util.find_git_ancestor(fname)
			end,
			single_file_support = true, -- suggested
			on_attach = on_attach, -- on_attach is the on_attach function you defined
		},
	}
	nvim_lsp.neocmake.setup({})
end

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

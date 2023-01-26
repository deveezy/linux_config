vim.g.mapleader = " "
vim.keymap.set("n", "<leader>nh", ":noh<CR>")
vim.keymap.set("n", "<leader>+", "<C-a>")
vim.keymap.set("n", "<leader>-", "<C-x>")

-- handy shortcut for escaping from terminal mode
vim.keymap.set("t", "<Esc>", "<C-Bslash><C-n>")

-- Copy/Paste to/from system clipboard
-- check system clipboard exists ---> :echo has('clipboard')
vim.keymap.set("n", "<c-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.keymap.set("n", "<c-v>", '"+p', {noremap=true, silent=true})

vim.keymap.set("v", "<c-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.keymap.set("v", "<c-v>", '"+P', {noremap=true, silent=true})

vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window veritically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally 
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to prev tab

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

vim.keymap.set("v", "p", '"_dP')

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "x", '"_x')

-- move line
vim.keymap.set("v", "<C-A-j>", ":m'>+<CR>gv=gv")
vim.keymap.set("v", "<C-A-k>", ":m-2<CR>gv=gv")

-- handy shortcuts
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")

-- plugin keymaps:
-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<m-`>", ":NvimTreeToggle<CR>")

-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>") -- find files within current working directory, respects .gitignore
-- find string in current working directory as you type
vim.keymap.set("n", "<leader>fs", ":lua require'telescope.builtin'.live_grep{ only_cwd = true}<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
vim.keymap.set("n", "<leader>b", ":lua require('telescope.builtin').buffers({ sort_mru = true, sort_lastused = true, ignore_current_buffer = true, only_cwd = true})<cr>") -- list open buffers in current neovim instance
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
vim.keymap.set("n", "<leader>pp", "<cmd>Telescope projects<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>")
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")

-- renamer
--[[ vim.keymap.set("n", "<F2>", "<cmd>lua require('renamer').rename({emty = true})<cr>")
vim.keymap.set("i", "<F2>", "<cmd>lua require('renamer').rename({emty = true})<cr>")
vim.keymap.set("v", "<F2>", "<cmd>lua require('renamer').rename({emty = true})<cr>")
 ]]

local bufopts = { noremap=true, silent=true}
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)

-- browser
vim.keymap.set("n", "<m-o>", "<cmd>BrowseBookmarks<cr>")
vim.keymap.set("n", "<m-i>", "<cmd>BrowseInputSearch<cr>")

-- spectre
vim.keymap.set("n", "<leader>S", "<cmd>Spectre<cr>")
vim.keymap.set("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>")

vim.cmd([[
vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
]])

-- search selected text pressing *
vim.cmd([[
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>
]])

-- gitblame
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>") 

-- vim-bbye
vim.keymap.set("n", "<leader>q", "<cmd>Bdelete!<CR>")
vim.keymap.set("n", "Q", "<cmd>:bufdo :Bdelete!<CR>")

vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")

local opts = { noremap = true, silent = true }
show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
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
vim.keymap.set('n', 'gR', vim.lsp.buf.references)
vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<CR>")
vim.keymap.set("n", "<leader>m", "<cmd>Neoformat<CR>") -- code format


-- cmake-tools
vim.keymap.set("n", "cg", "<cmd>CMakeGenerate<cr>")
vim.keymap.set("n", "cb", "<cmd>CMakeBuild<cr>")
vim.keymap.set("n", '<F17>', "<cmd>CMakeRun<cr>")

vim.keymap.set("n", "<F5>", "<cmd>CMakeDebug<cr>")
vim.keymap.set("n", "cs", "<cmd>CMakeStop<cr>")
vim.keymap.set("n", "co", "<cmd>CMakeOpen<cr>")
vim.keymap.set("n", "cx", "<cmd>CMakeClose<cr>")
vim.keymap.set("n", "cc", "<cmd>CMakeClean<cr>")
vim.keymap.set("n", "ct", "<cmd>CMakeSelectBuildType<cr>")

vim.keymap.set('n', '<leader>i', "<cmd>TSCppImplWrite<CR>")
vim.keymap.set('n', '<leader>rf', "<cmd>TSCppRuleOf5<CR>")

vim.keymap.set('n', '<leader>tgb', "<cmd> lua require('vgit').toggle_live_blame()<CR>", {noremap = true})

vim.keymap.set("n", "<leader>cx", "<cmd>cclose<CR>")
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>")

vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>wa<CR>')
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>')

-- debugging
-- vim.keymap.set("n", "<C-F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>")



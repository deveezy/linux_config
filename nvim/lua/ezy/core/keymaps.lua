vim.g.mapleader = " "
vim.keymap.set("n", "<leader>nh", ":noh<CR>")
vim.keymap.set("n", "<leader>+", "<C-a>")
vim.keymap.set("n", "<leader>-", "<C-x>")

-- handy shortcut for escaping from terminal mode
vim.keymap.set("t", "<Esc>", "<C-Bslash><C-n>")

-- Copy/Paste to/from system clipboard
-- check system clipboard exists ---> :echo has('clipboard')
vim.keymap.set("n", "<c-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.keymap.set("n", "<c-v>", '"+P', {noremap=true, silent=true})

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

-- move lines
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
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
vim.keymap.set("n", "<leader>pp", "<cmd>Telescope projects<cr>")

-- renamer
vim.keymap.set("n", "<F2>", "<cmd>lua require('renamer').rename({emty = true})<cr>")
vim.keymap.set("i", "<F2>", "<cmd>lua require('renamer').rename({emty = true})<cr>")
vim.keymap.set("v", "<F2>", "<cmd>lua require('renamer').rename({emty = true})<cr>")

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

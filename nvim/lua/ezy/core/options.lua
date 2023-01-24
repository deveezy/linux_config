local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- basckspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")

opt.showtabline = 2
opt.hidden = true

opt.jumpoptions:append("stack")

vim.cmd[[autocmd FileType * setlocal formatoptions-=cro]]
vim.cmd[[autocmd VimEnter * :clearjumps]]
-- vim.cmd[[au BufEnter * setlocal cursorline]]
-- vim.cmd[[au BufLeave * setlocal nocursorline]]

vim.cmd[[if &filetype == "cpp" || &filetype == "cuda" || &filetype == "c"
  autocmd BufEnter,TextChanged <buffer> lua require 'vim.lsp.buf'.semantic_tokens_full()
endif
]]

opt.updatetime = 300
opt.incsearch = false
opt.signcolumn = 'yes'

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- plugin manager
	use 'wbthomason/packer.nvim'
	-- colorscheme
	use("bluz71/vim-nightfly-guicolors")
  use("tomasiser/vim-code-dark")
	-- window navigation ctrl + {motion}
	use("christoomey/vim-tmux-navigator")
	-- maximizes and restores current window
	use("szw/vim-maximizer") 
	-- surround text
	use("tpope/vim-surround")
	-- replace without corrupting register x.
	use("vim-scripts/ReplaceWithRegister")
	-- unified comments
	use("numToStr/Comment.nvim")

	use("nvim-lua/plenary.nvim")
	-- file explorer
	use("nvim-tree/nvim-tree.lua")
	-- icons in explorer
	use("kyazdani42/nvim-web-devicons")
	-- status line
	use("nvim-lualine/lualine.nvim")
	-- fuzzy finding w/ telescope
  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  -- autocompletion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

  -- snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  -- utility:
  use("windwp/nvim-autopairs")
  use('rmagatti/auto-session')
  use("lukas-reineke/indent-blankline.nvim")
 -- startup
  use ("goolord/alpha-nvim")

  use("rcarriga/nvim-notify")
  use("stevearc/dressing.nvim")
  use("ghillb/cybu.nvim")
  use("lewis6991/impatient.nvim")
  use("lalitmee/browse.nvim")
  use("folke/todo-comments.nvim")

  use("akinsho/toggleterm.nvim")
  use("ahmedkhalf/project.nvim")
  use("windwp/nvim-spectre")
  use("andymass/vim-matchup")
  use("nacro90/numb.nvim")
  use("filipdutescu/renamer.nvim")

  use("RRethy/vim-illuminate")
  use("Shatur/neovim-session-manager")
  use('lewis6991/gitsigns.nvim')
  use("Pocco81/auto-save.nvim")
  -- use("TimUntersberger/neogit")
  use('Mofiqul/vscode.nvim')
  use("akinsho/bufferline.nvim")
  use "moll/vim-bbye"
  use("nanozuki/tabby.nvim")
  use("mg979/vim-visual-multi")
  use("Civitasv/cmake-tools.nvim")

  -- LSP
  use ("neovim/nvim-lspconfig")
  
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)


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
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)


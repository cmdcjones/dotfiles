local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer = require("packer")

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Essentials
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("miversen33/import.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("MunifTanjim/nui.nvim")

	-- Buffers & navigation
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")
	use("nvim-lualine/lualine.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("yamatsum/nvim-cursorline")
	use("brenoprata10/nvim-highlight-colors")
	use("ThePrimeagen/harpoon")

	-- Colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "rose-pine/neovim", as = "rose-pine" })

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-autopairs")
	use("nvim-treesitter/nvim-treesitter-context")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("nvim-telescope/telescope-project.nvim")

	-- CMP
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("onsails/lspkind.nvim")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("b0o/SchemaStore.nvim")
	use("jose-elias-alvarez/typescript.nvim")
	use("simrat39/symbols-outline.nvim")
	use("ray-x/lsp_signature.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("gpanders/editorconfig.nvim")
	use("folke/trouble.nvim")
	use("smiteshp/nvim-navic")
	use("utilyre/barbecue.nvim")
	use("simrat39/rust-tools.nvim")

	use({
		"folke/persistence.nvim",
		event = "BufReadPre",
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

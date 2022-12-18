return require("packer").startup(function(use)
    -- Packer and essentials
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                window = {
                    width = 80,
                    options = {
                        number = true,
                        relativenumber = true,
                    },
                },
                gitsigns = { enabled = true },
                tmux = { enabled = true },
            }
        end
    }


    -- LSP Things
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
      }
  }
    -- Nvim Linter
    use ("mfussenegger/nvim-lint")

    -- Colorscheme
    use("folke/tokyonight.nvim")
    use({"catppuccin/nvim", as = "catppuccin" })
    use({"rose-pine/neovim", as = "rose-pine" })
    
    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    -- GitSigns
    use {
      'lewis6991/gitsigns.nvim',
      -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
    require('gitsigns').setup()

    -- Full-stack Dev
    use 'pangloss/vim-javascript' --JS support
    use 'leafgarland/typescript-vim' --TS support
    use 'maxmellon/vim-jsx-pretty' --JS and JSX syntax
    use 'mattn/emmet-vim'

    -- Treesitter config
    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
      },
    }
end)

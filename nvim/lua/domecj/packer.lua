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

    -- LSP Things
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("nvim-lua/lsp_extensions.nvim")
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    -- Nvim Linter
    use ("mfussenegger/nvim-lint")

    -- Colorscheme
    use("folke/tokyonight.nvim")
    use({"catppuccin/nvim", as = "catppuccin" })
    
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

    -- LSP Config
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end

    local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
    }

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require('lspconfig')

    -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
    local servers = { 'gopls', 'tsserver' }
    for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
    }
    end

    -- luasnip setup
    local luasnip = require 'luasnip'

    -- nvim-cmp setup
    local cmp = require 'cmp'
    cmp.setup {
    snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
    },
    mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    }),
    sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    },
    }

    -- Nvim Lint
    require('lint').linters_by_ft = {
        go = {'golangcilint',}
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
            require("lint").try_lint()
        end,
    })

    -- Treesitter config
    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
      },
    }
end)

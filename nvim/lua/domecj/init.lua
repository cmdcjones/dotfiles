require("domecj.set")
require("domecj.packer")

-- LSP Golang
require'lspconfig'.gopls.setup{
    cmd = { "gopls" },
}

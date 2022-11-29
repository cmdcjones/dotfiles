require("domecj.set")
require("domecj.packer")

-- LSP Golang
require'lspconfig'.golangci_lint_ls.setup{}
require'lspconfig'.gopls.setup{
    cmd = { "gopls" },
}

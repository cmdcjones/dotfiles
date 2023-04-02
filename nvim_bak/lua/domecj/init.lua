require("domecj.set")
require("domecj.packer")

-- LSP Golang
require'lspconfig'.gopls.setup{}

-- LSP Rust
require'lspconfig'.rust_analyzer.setup{}

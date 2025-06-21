-- ╭─────────────────────────────────────────────────────────╮
-- │           Custom LSP Server Setup (via lspconfig)       │
-- │              More options :h vim.lsp.config             │
-- ╰─────────────────────────────────────────────────────────╯

-- List of LSP servers to configure manually
local servers = { "html", "cssls", "ts_ls", "clangd" }

-- New way to setup lsp servers
vim.lsp.enable(servers)

-- read for changing options of lsp servers

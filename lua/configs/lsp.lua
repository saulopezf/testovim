-- ╭─────────────────────────────────────────────────────────╮
-- │           Custom LSP Server Setup (via lspconfig)       │
-- │              More options :h vim.lsp.config             │
-- ╰─────────────────────────────────────────────────────────╯

-- List of LSP servers to configure manually
local servers = { "html", "cssls", "ts_ls", "clangd" }

---@type vim.lsp.Config
local ts_config = {
    init_options = {
        preferences = {
            importModuleSpecifierPreference = "non-relative",
        },
    },
}
vim.lsp.config("ts_ls", ts_config)

-- New way to setup lsp servers
vim.lsp.enable(servers)

-- ╭─────────────────────────────────────────────────────────╮
-- │         Extend mason.nvim with required tools           │
-- ╰─────────────────────────────────────────────────────────╯

return {
    "williamboman/mason.nvim",

    opts = {
        ensure_installed = {
            -- Lua
            "lua-language-server", -- LSP
            "stylua", -- Formatter

            -- Web (JS/TS/HTML/CSS)
            "typescript-language-server",
            "html-lsp",
            "css-lsp",
            "prettier", -- Formatter
            "eslint_d", -- Linter
            "js-debug-adapter", -- DAP

            -- C/C++
            "clangd", -- LSP
            "codelldb", -- DAP
        },
    },
}

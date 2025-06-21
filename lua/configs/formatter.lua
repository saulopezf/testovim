-- ╭─────────────────────────────────────────────────────────╮
-- │               Formatter Config (conform.nvim)           │
-- ╰─────────────────────────────────────────────────────────╯

local conform = require "conform"

conform.setup {
    -- Define formatters per filetype
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier", "eslint_d" },
        typescript = { "prettier", "eslint_d" },
        css = { "prettier" },
        html = { "prettier" },
        -- Add more filetypes as needed
    },

    -- Format on save with LSP fallback
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    },
}

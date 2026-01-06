-- ╭─────────────────────────────────────────────────────────╮
-- │               Formatter Config (conform.nvim)           │
-- ╰─────────────────────────────────────────────────────────╯

local conform = require "conform"

conform.setup {
    -- Define formatters per filetype
    formatters_by_ft = {
        lua = { "stylua" },

        javascript = function(bufnr)
            if conform.get_formatter_info("prettier", bufnr).available then
                return { "prettier" }
            else
                return { "eslint_d" }
            end
        end,

        typescript = function(bufnr)
            if conform.get_formatter_info("prettier", bufnr).available then
                return { "prettier" }
            else
                return { "eslint_d" }
            end
        end,

        javascriptreact = function(bufnr)
            if conform.get_formatter_info("prettier", bufnr).available then
                return { "prettier" }
            else
                return { "eslint_d" }
            end
        end,

        typescriptreact = function(bufnr)
            if conform.get_formatter_info("prettier", bufnr).available then
                return { "prettier" }
            else
                return { "eslint_d" }
            end
        end,

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

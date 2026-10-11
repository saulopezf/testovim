-- ╭─────────────────────────────────────────────────────────╮
-- │        LSP servers (on top of the LazyVim lang extras)  │
-- │   ts (vtsls), go (gopls) and c/c++ (clangd) come from   │
-- │              lua/config/lazy.lua extras                 │
-- ╰─────────────────────────────────────────────────────────╯

local ts_preferences = {
    importModuleSpecifier = "non-relative",
}

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                html = {},
                cssls = {},
                vtsls = {
                    settings = {
                        typescript = { preferences = ts_preferences },
                        javascript = { preferences = ts_preferences },
                    },
                },
                -- oxlint runs through nvim-lint (see linting.lua), avoid duplicated diagnostics
                oxlint = { enabled = false },
                -- oxfmt runs through conform (see formatting.lua)
                oxfmt = { enabled = false },
            },
        },
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │         Extend mason.nvim with required tools           │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                -- Web (JS/TS/HTML/CSS)
                "html-lsp",
                "css-lsp",
                "prettier", -- Formatter
                "oxfmt", -- Formatter
                "eslint_d", -- Linter
                "oxlint", -- Linter
            },
        },
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                 Treesitter parsers                      │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            -- Folding is handled by nvim-ufo (see ufo.lua)
            folds = { enable = false },
            ensure_installed = { "css", "go" },
        },
    },
}

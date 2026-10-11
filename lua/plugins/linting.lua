-- ╭─────────────────────────────────────────────────────────╮
-- │                Linter Config (nvim-lint)                │
-- ╰─────────────────────────────────────────────────────────╯

return {
    "mfussenegger/nvim-lint",
    opts = {
        -- Auto-run linter on common editing events
        events = { "BufEnter", "BufWritePost", "BufReadPost", "InsertLeave" },
        linters_by_ft = {
            javascript = { "eslint_d", "oxlint" },
            typescript = { "eslint_d", "oxlint" },
            javascriptreact = { "eslint_d", "oxlint" },
            typescriptreact = { "eslint_d", "oxlint" },
        },
    },
    keys = {
        {
            "<leader>cL",
            function()
                require("lint").try_lint()
            end,
            desc = "Run Linter",
        },
    },
}

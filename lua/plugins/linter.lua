-- ╭─────────────────────────────────────────────────────────╮
-- │                Linter Plugin Loader (nvim-lint)         │
-- ╰─────────────────────────────────────────────────────────╯

return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        require "configs.linter"
    end,
}

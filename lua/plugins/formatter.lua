-- ╭─────────────────────────────────────────────────────────╮
-- │           Formatter Plugin Loader (conform.nvim)        │
-- ╰─────────────────────────────────────────────────────────╯

return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        require "configs.formatter"
    end,
}

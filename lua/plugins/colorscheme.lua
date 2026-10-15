-- ╭─────────────────────────────────────────────────────────╮
-- │                 Colorscheme (kanagawa)                  │
-- ╰─────────────────────────────────────────────────────────╯

return {
    { "rebelot/kanagawa.nvim", lazy = true },
    -- Themes bundled with LazyVim core, not used
    { "folke/tokyonight.nvim", enabled = false },
    { "catppuccin/nvim", name = "catppuccin", enabled = false },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "kanagawa",
        },
    },
}

-- ╭─────────────────────────────────────────────────────────╮
-- │                 Colorscheme (neovim-ayu)                │
-- ╰─────────────────────────────────────────────────────────╯

return {
    { "Shatur/neovim-ayu", lazy = true },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "ayu-dark",
        },
    },
}

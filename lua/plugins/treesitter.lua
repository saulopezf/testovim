-- ╭─────────────────────────────────────────────────────────╮
-- │                Treesitter auto install                  │
-- ╰─────────────────────────────────────────────────────────╯

return {
    "nvim-treesitter/nvim-treesitter",

    opts = {
        ensure_installed = {
            -- NvChad already installed languages
            -- "lua",
            -- "luadoc",
            -- "printf",
            -- "vim",
            -- "vimdoc",

            "html",
            "css",
            "javascript",
            "typescript",
            "json",
            "bash",
            "markdown",
            "yaml",
            "tsx",
        },
    },
}

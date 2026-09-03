-- ╭─────────────────────────────────────────────────────────╮
-- │                Treesitter auto install                  │
-- ╰─────────────────────────────────────────────────────────╯

return {
    "nvim-treesitter/nvim-treesitter",

    -- Fix para windows
    branch = "master",
    commit = nil,

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
            "go"
        },
    },
}

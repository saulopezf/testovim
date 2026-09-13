-- ╭─────────────────────────────────────────────────────────╮
-- │         Extend telescope.nvim with live-grep-args       │
-- ╰─────────────────────────────────────────────────────────╯

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-live-grep-args.nvim",
        },
    },
}

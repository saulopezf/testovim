-- ╭─────────────────────────────────────────────────────────╮
-- │         Extend telescope.nvim with live-grep-args       │
-- ╰─────────────────────────────────────────────────────────╯

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                config = function()
                    LazyVim.on_load("telescope.nvim", function()
                        require("telescope").load_extension "live_grep_args"
                    end)
                end,
            },
        },
        keys = {
            { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
            {
                "<leader>fq",
                function()
                    require("telescope").extensions.live_grep_args.live_grep_args()
                end,
                desc = "Live Grep Args",
            },
        },
    },
}

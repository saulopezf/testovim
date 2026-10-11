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
        -- NvChad style <leader>f mappings (LazyVim <leader>s* ones are kept)
        keys = {
            { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Resume" },
            { "<leader>fo", LazyVim.pick "oldfiles", desc = "Recent" },
            { "<leader>fw", LazyVim.pick "live_grep", desc = "Grep (Root Dir)" },
            { "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer Lines" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
            {
                "<leader>fa",
                "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
                desc = "Find All Files",
            },
            { "<leader>ma", "<cmd>Telescope marks<cr>", desc = "Marks" },
            {
                "<leader>fm",
                function()
                    LazyVim.format { force = true }
                end,
                desc = "Format File",
            },
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

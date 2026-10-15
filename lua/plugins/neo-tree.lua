-- ╭─────────────────────────────────────────────────────────╮
-- │        File explorer (neo-tree, editor.neo-tree extra)  │
-- ╰─────────────────────────────────────────────────────────╯

return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        {
            "<C-n>",
            function()
                require("neo-tree.command").execute { toggle = true, dir = LazyVim.root() }
            end,
            desc = "Explorer NeoTree (Root Dir)",
        },
        {
            "<leader>e",
            function()
                -- Open and jump to the explorer, never close it (use <C-n> to toggle)
                require("neo-tree.command").execute { action = "focus", dir = LazyVim.root() }
            end,
            desc = "Focus Explorer NeoTree (Root Dir)",
        },
    },
    opts = {
        window = {
            width = 30,
        },
        filesystem = {
            -- Show dotfiles and gitignored files dimmed instead of hiding them
            filtered_items = {
                visible = true,
            },
        },
    },
}

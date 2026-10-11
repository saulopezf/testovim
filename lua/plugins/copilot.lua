-- ╭────────────────────────────────────────────────────────────╮
-- │          Code completion (copilot.lua, ai.copilot extra)   │
-- │   Inline ghost text: vim.g.ai_cmp = false (options.lua)    │
-- ╰────────────────────────────────────────────────────────────╯

return {
    {
        "zbirenbaum/copilot.lua",
        opts = {
            suggestion = {
                keymap = {
                    accept = "<C-a>",
                },
            },
            filetypes = {
                ["*"] = true, -- Enable for all filetypes by default
                markdown = false, -- Disable for markdown
                gitcommit = false, -- Disable for Git commit messages
                text = false, -- Disable for plain text files
                help = false, -- Disable in help buffers
            },
        },
        keys = {
            { "<leader>a", "", desc = "+ai" },
            { "<leader>at", "<cmd>Copilot toggle<cr>", desc = "Toggle Copilot" },
        },
    },
}

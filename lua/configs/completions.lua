-- ╭─────────────────────────────────────────────────────────╮
-- │               Completion Config (Copilot)               │
-- ╰─────────────────────────────────────────────────────────╯

vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
    ["*"] = true, -- Enable for all filetypes by default
    markdown = false, -- Disable for markdown
    gitcommit = false, -- Disable for Git commit messages
    text = false, -- Disable for plain text files
    help = false, -- Disable in help buffers
}

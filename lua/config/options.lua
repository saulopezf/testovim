-- ╭─────────────────────────────────────────────────────────╮
-- │     Options loaded before lazy.nvim startup             │
-- │  Defaults: lazyvim/config/options.lua (LazyVim repo)    │
-- ╰─────────────────────────────────────────────────────────╯

-- Copilot as inline ghost text instead of a completion source
vim.g.ai_cmp = false

-- ╭─────────────────────────────────────────────────────────╮
-- │                    Floating windows                     │
-- ╰─────────────────────────────────────────────────────────╯
vim.opt.winborder = "rounded"

-- ╭─────────────────────────────────────────────────────────╮
-- │                     Indentation                         │
-- ╰─────────────────────────────────────────────────────────╯
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4 -- Number of spaces for a <Tab>
vim.opt.softtabstop = 4 -- Number of spaces for editing operations
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.relativenumber = true -- Show relative line numbers

-- ╭─────────────────────────────────────────────────────────╮
-- │                Folding (handled by nvim-ufo)            │
-- ╰─────────────────────────────────────────────────────────╯
vim.opt.foldcolumn = "0" -- No fold column shown
vim.opt.foldlevel = 99 -- Max fold depth (avoid hiding anything)
vim.opt.foldlevelstart = 99 -- Start unfolded
vim.opt.foldenable = true -- Enable code folding

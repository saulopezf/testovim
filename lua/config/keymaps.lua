-- ╭─────────────────────────────────────────────────────────╮
-- │     Keymaps loaded on the VeryLazy event                │
-- │  Defaults: lazyvim/config/keymaps.lua (LazyVim repo)    │
-- │  Plugin keymaps live in each lua/plugins/*.lua spec     │
-- ╰─────────────────────────────────────────────────────────╯

local map = vim.keymap.set

-- ╭─────────────────────────────────────────────────────────╮
-- │                   General Mappings                      │
-- ╰─────────────────────────────────────────────────────────╯
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Move lines up/down (<A-j>/<A-k> already provided by LazyVim)
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move line down (arrow)" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move line up (arrow)" })

-- Resize windows (overrides LazyVim's direction for up/down)
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Resize window left" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Resize window right" })
map("n", "<C-Up>", "<cmd>resize -2<cr>", { desc = "Resize window up" })
map("n", "<C-Down>", "<cmd>resize +2<cr>", { desc = "Resize window down" })

-- Paste without yanking
map("v", "<C-p>", '"_dP', { desc = "Paste without yanking" })

-- ╭─────────────────────────────────────────────────────────╮
-- │                      Git (Gitsigns)                     │
-- ╰─────────────────────────────────────────────────────────╯
map("n", "<leader>ghl", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle Line Blame" })

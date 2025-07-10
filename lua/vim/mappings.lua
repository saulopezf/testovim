-- ╭─────────────────────────────────────────────────────────╮
-- │                  Load NvChad Mappings                   │
-- ╰─────────────────────────────────────────────────────────╯
require "nvchad.mappings"

local map = vim.keymap.set
local delete_map = vim.keymap.del

-- ╭─────────────────────────────────────────────────────────╮
-- │             Mappings I want to delete/change            │
-- ╰─────────────────────────────────────────────────────────╯
pcall(delete_map, "n", "<leader>cm")
pcall(delete_map, "n", "<leader>gt")

-- ╭─────────────────────────────────────────────────────────╮
-- │                   General Mappings                      │
-- ╰─────────────────────────────────────────────────────────╯
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Move lines up/down
map("n", "<A-j>", ":m .+1<CR>", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>", { desc = "Move line up" })
map("n", "<A-Down>", ":m .+1<CR>", { desc = "Move line down (arrow)" })
map("n", "<A-Up>", ":m .-2<CR>", { desc = "Move line up (arrow)" })

-- Lint file
map("n", "<leader>l", function()
    require("lint").try_lint()
end, { desc = "Run linter" })

map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window left" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window right" })
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window up" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window down" })

-- Paste without yanking
map("v", "<C-p>", '"_dP', { desc = "Paste without yanking" })

-- ╭─────────────────────────────────────────────────────────╮
-- │                   Telescope Mappings                    │
-- ╰─────────────────────────────────────────────────────────╯
local telescope = require "telescope"
local tbuiltin = require "telescope.builtin"

map("n", "<leader>fd", tbuiltin.diagnostics, { desc = "telescope diagnostics" })

map("n", "<leader>fq", function()
    telescope.extensions.live_grep_args.live_grep_args()
end, { desc = "telescope live grep args" })

map("n", "<leader>fr", tbuiltin.resume, {
    desc = "telescope resume last search",
    noremap = true,
    silent = true,
})

map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git Commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git Status" })

-- ╭─────────────────────────────────────────────────────────╮
-- │                      Git (Gitsigns)                     │
-- ╰─────────────────────────────────────────────────────────╯
map("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>", {
    desc = "Git toggle line blame",
})

-- ╭─────────────────────────────────────────────────────────╮
-- │                      Debugger (DAP)                     │
-- ╰─────────────────────────────────────────────────────────╯
local dap = require "dap"
local dapui = require "dapui"

map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
map("n", "<leader>dc", dap.continue, { desc = "DAP continue" })
map("n", "<leader>dO", dap.step_out, { desc = "DAP step out" })
map("n", "<leader>do", dap.step_over, { desc = "DAP step over" })
map("n", "<leader>di", dap.step_into, { desc = "DAP step into" })

map("n", "<leader>dt", dapui.toggle, { desc = "DAP UI toggle" })
map("n", "<leader>dk", dapui.eval, { desc = "DAP eval hover" })

-- ╭─────────────────────────────────────────────────────────╮
-- │                    Folding (nvim-ufo)                   │
-- ╰─────────────────────────────────────────────────────────╯
local ufo = require "ufo"

map("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
map("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
map("n", "zK", function()
    local winid = ufo.peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end, { desc = "Peek fold or hover" })

-- ╭─────────────────────────────────────────────────────────╮
-- │                        Copilot                          │
-- ╰─────────────────────────────────────────────────────────╯
map("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable Copilot" })
map("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable Copilot" })
map("i", "<C-a>", 'copilot#Accept("<CR>")', {
    expr = true,
    silent = true,
    script = true,
    replace_keycodes = false, -- Important for proper key handling
    desc = "Accept Copilot suggestion",
})

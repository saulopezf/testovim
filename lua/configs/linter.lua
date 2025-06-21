-- ╭─────────────────────────────────────────────────────────╮
-- │                Linter Config (nvim-lint)                │
-- ╰─────────────────────────────────────────────────────────╯

local lint = require "lint"

-- Associate filetypes with linters
lint.linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
}

-- Auto-run linter on common editing events
local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
        lint.try_lint()
    end,
})

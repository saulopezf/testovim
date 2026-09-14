-- ╭─────────────────────────────────────────────────────────╮
-- │               Formatter Config (conform.nvim)           │
-- ╰─────────────────────────────────────────────────────────╯

local conform = require "conform"

-- Use prettier from the local project if available, otherwise fallback to oxfmt
local function use_project_prettier(bufnr)
    local cwd = vim.fn.getcwd()
    local prettier_local = cwd .. "/node_modules/.bin/prettier"
    if vim.fn.executable(prettier_local) == 1 then
        return { "prettier" }
    elseif conform.get_formatter_info("oxfmt", bufnr).available then
        return { "oxfmt" }
    else
        return {}
    end
end

conform.setup {
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = use_project_prettier,
        typescript = use_project_prettier,
        javascriptreact = use_project_prettier,
        typescriptreact = use_project_prettier,
        css = use_project_prettier,
        html = use_project_prettier,
    },

    -- Format on save with LSP fallback
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    },
}

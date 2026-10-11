-- ╭─────────────────────────────────────────────────────────╮
-- │               Formatter Config (conform.nvim)           │
-- │   Format on save is handled by LazyVim (:LazyFormat,    │
-- │            <leader>uf to toggle autoformat)             │
-- ╰─────────────────────────────────────────────────────────╯

-- Use prettier from the local project if available, otherwise fallback to oxfmt
local function use_project_prettier(bufnr)
    local cwd = vim.fn.getcwd()
    local prettier_local = cwd .. "/node_modules/.bin/prettier"
    if vim.fn.executable(prettier_local) == 1 then
        return { "prettier" }
    elseif require("conform").get_formatter_info("oxfmt", bufnr).available then
        return { "oxfmt" }
    else
        return {}
    end
end

return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            javascript = use_project_prettier,
            typescript = use_project_prettier,
            javascriptreact = use_project_prettier,
            typescriptreact = use_project_prettier,
            css = use_project_prettier,
            html = use_project_prettier,
        },
    },
}

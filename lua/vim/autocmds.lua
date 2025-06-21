require "nvchad.autocmds"

-- Workaround for telescope floating window on nvim v0.11.2
-- Delete it when telescope/plenary fix it
vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopeFindPre",
    callback = function()
        vim.opt_local.winborder = "none"
        vim.api.nvim_create_autocmd("WinLeave", {
            once = true,
            callback = function()
                vim.opt_local.winborder = "rounded"
            end,
        })
    end,
})

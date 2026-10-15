-- ╭─────────────────────────────────────────────────────────╮
-- │                  Bootstrap Lazy.nvim                    │
-- ╰─────────────────────────────────────────────────────────╯
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- ╭─────────────────────────────────────────────────────────╮
-- │                    Plugin Setup                         │
-- ╰─────────────────────────────────────────────────────────╯
require("lazy").setup {
    spec = {
        -- LazyVim core
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },

        -- LazyVim extras (declared here instead of lazyvim.json)
        { import = "lazyvim.plugins.extras.editor.telescope" },
        { import = "lazyvim.plugins.extras.editor.neo-tree" },
        { import = "lazyvim.plugins.extras.ai.copilot" },
        { import = "lazyvim.plugins.extras.dap.core" },
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.lang.json" },
        { import = "lazyvim.plugins.extras.lang.go" },
        { import = "lazyvim.plugins.extras.lang.clangd" },

        -- Personal plugins and overrides
        { import = "plugins" },
    },
    defaults = {
        lazy = false,
        version = false, -- always use the latest git commit
    },
    install = { colorscheme = { "kanagawa", "habamax" } },
    checker = { enabled = true, notify = false },
    ui = {
        icons = {
            ft = "", -- File type
            lazy = "󰂠 ", -- Lazy-loaded plugin
            loaded = "", -- Plugin successfully loaded
            not_loaded = "", -- Plugin not loaded
        },
    },
    performance = {
        rtp = {
            -- Disable unnecessary default Vim plugins
            disabled_plugins = {
                "gzip",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
}

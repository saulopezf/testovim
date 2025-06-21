-- ╭─────────────────────────────────────────────────────────╮
-- │                    Global Variables                     │
-- ╰─────────────────────────────────────────────────────────╯
require "vim.globals"

-- ╭─────────────────────────────────────────────────────────╮
-- │                  Bootstrap Lazy.nvim                    │
-- ╰─────────────────────────────────────────────────────────╯
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- ╭─────────────────────────────────────────────────────────╮
-- │                    Plugin Setup                         │
-- ╰─────────────────────────────────────────────────────────╯
local lazy_config = require "configs.lazy"
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },
    { import = "plugins" },
}, lazy_config)

-- ╭─────────────────────────────────────────────────────────╮
-- │               Theme & Statusline Setup                  │
-- ╰─────────────────────────────────────────────────────────╯
vim.schedule(function()
    dofile(vim.g.base46_cache .. "defaults")
    dofile(vim.g.base46_cache .. "statusline")
end)

-- ╭─────────────────────────────────────────────────────────╮
-- │                    Basic Vim Settings                   │
-- ╰─────────────────────────────────────────────────────────╯
require "vim.options"
require "vim.autocmds"

-- ╭─────────────────────────────────────────────────────────╮
-- │                    Key Mappings                         │
-- ╰─────────────────────────────────────────────────────────╯
vim.schedule(function()
    require "vim.mappings"
end)

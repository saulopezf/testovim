-- ╭────────────────────────────────────────────────────────────╮
-- │                   Lazy.nvim Global Settings                │
-- │   Controls defaults, UI appearance, and performance opts   │
-- ╰────────────────────────────────────────────────────────────╯

return {
    -- Default settings applied to all plugins
    defaults = { lazy = true },

    -- Colorscheme(s) to try during installation
    install = {
        colorscheme = { "nvchad" },
    },

    -- UI customizations
    ui = {
        icons = {
            ft = "", -- File type
            lazy = "󰂠 ", -- Lazy-loaded plugin
            loaded = "", -- Plugin successfully loaded
            not_loaded = "", -- Plugin not loaded
        },
    },

    -- Performance optimizations
    performance = {
        rtp = {
            -- Disable unnecessary default Vim plugins
            disabled_plugins = {
                "2html_plugin",
                "tohtml",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "matchit",
                "tar",
                "tarPlugin",
                "rrhelper",
                "spellfile_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
                "tutor",
                "rplugin",
                "syntax",
                "synmenu",
                "optwin",
                "compiler",
                "bugreport",
                "ftplugin",
            },
        },
    },
}

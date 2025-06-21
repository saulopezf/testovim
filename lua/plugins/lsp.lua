-- ╭─────────────────────────────────────────────────────────╮
-- │              LSP Configuration with lspconfig           │
-- ╰─────────────────────────────────────────────────────────╯

return {
    "neovim/nvim-lspconfig",

    config = function()
        -- Load default NvChad LSP configs
        require("nvchad.configs.lspconfig").defaults()

        -- Load user-defined LSP config
        require "configs.lsp"
    end,
}

-- ╭────────────────────────────────────────────────────────────╮
-- │                    Folding Plugin (nvim-ufo)               │
-- ╰────────────────────────────────────────────────────────────╯

return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
        require "configs.folder"
    end,
}

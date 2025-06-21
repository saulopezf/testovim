-- ╭─────────────────────────────────────────────────────────╮
-- │               NvChad Configuration Override             │
-- │    Must follow the structure of: nvconfig.lua (UI v3)   │
-- │ https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua │
-- ╰─────────────────────────────────────────────────────────╯

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "ayu_dark",
}

M.ui = {
    telescope = {
        style = "bordered", -- "bordered" | "float"
    },
}

return M

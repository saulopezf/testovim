-- ╭────────────────────────────────────────────────────────────╮
-- │                      DAP UI Setup                          │
-- │       Automatically open/close UI with DAP events          │
-- ╰────────────────────────────────────────────────────────────╯

local dap = require "dap"
local dapui = require "dapui"

-- Initialize dap-ui with default configuration
dapui.setup()

-- Open UI when DAP session starts
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

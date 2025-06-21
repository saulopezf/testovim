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

-- Close UI when DAP session ends
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

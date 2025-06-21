-- ╭────────────────────────────────────────────────────────────╮
-- │                Debugger Setup for nvim                     │
-- │        Using DAP (Debug Adapter Protocol) to debug         │
-- │                                                            │
-- │                Using nvim-dap-ui for UI                    │
-- │                                                            │
-- │                More info: :help dap.txt                    │
-- ╰────────────────────────────────────────────────────────────╯

-- Directory separator variable to know if we are in Windows
local is_windows_hell = package.config:sub(1, 1) == "\\"

return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        config = function()
            require "configs.debugger.nvim-dap"
        end,
        dependencies = {
            -- ╭─────────────────────────────────────────────────────────╮
            -- │                        DAP UI                           │
            -- ╰─────────────────────────────────────────────────────────╯
            {
                "rcarriga/nvim-dap-ui",
                dependencies = { "nvim-neotest/nvim-nio" },
                config = function()
                    require "configs.debugger.nvim-dap-ui"
                end,
            },

            -- ╭─────────────────────────────────────────────────────────╮
            -- │                 DEFAULT ADAPTER CONFIG                  │
            -- │                    Mason integration                    │
            -- ╰─────────────────────────────────────────────────────────╯
            {
                "jay-babu/mason-nvim-dap.nvim",
                config = function()
                    require "configs.debugger.mason-nvim-dap"
                end,
            },

            -- ╭─────────────────────────────────────────────────────────╮
            -- │                  JS/TS ADAPTER CONFIG                   │
            -- ╰─────────────────────────────────────────────────────────╯
            -- DAP for Javascript/Typescript
            {
                "microsoft/vscode-js-debug",
                build = is_windows_hell
                        and "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && (if exist out rmdir out /s /q) && mkdir out && xcopy dist out /s /e /h /y"
                    or "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
                version = "1.*",
            },
        },
    },
}

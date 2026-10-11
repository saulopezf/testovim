-- ╭────────────────────────────────────────────────────────────╮
-- │                Debugger Setup for nvim                     │
-- │   Base: LazyVim extras dap.core + lang.typescript/clangd   │
-- │   (adapters pwa-node/pwa-chrome/codelldb, dap-ui, mason)   │
-- │                                                            │
-- │                More info: :help dap.txt                    │
-- ╰────────────────────────────────────────────────────────────╯

local js_languages = {
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
    "vue",
}

-- Extra JS/TS configurations appended to the LazyVim ones (Launch file / Attach)
local js_configurations = {
    {
        -- Launch Chrome to debug a frontend web app
        type = "pwa-chrome",
        request = "launch",
        name = "Launch & Debug Chrome",
        url = function()
            local co = coroutine.running()
            return coroutine.create(function()
                vim.ui.input({
                    prompt = "Enter URL: ",
                    default = "http://localhost:3000",
                }, function(url)
                    if url and url ~= "" then
                        coroutine.resume(co, url)
                    end
                end)
            end)
        end,
        webRoot = "${workspaceFolder}",
        protocol = "inspector",
        sourceMaps = true,
        userDataDir = false,
    },
    {
        type = "pwa-node",
        request = "launch",
        name = "Debug Jest current file",
        runtimeExecutable = "npm",
        runtimeArgs = {
            "run",
            "test",
            "--",
            "${file}",
            "--runInBand",
        },
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        sourceMaps = true,
        resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
        },
        skipFiles = {
            "<node_internals>/**",
            "**/node_modules/**",
        },
    },
    {
        -- Just a separator for launch.json configs
        name = "----- ↓ launch.json configs ↓ -----",
        type = "",
        request = "launch",
    },
}

-- C/C++: compile the given source with debug info and launch it
local cpp_launch = {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
        -- Prompt user for source file path
        local path_to_src = vim.fn.input("Path to source: ", vim.fn.getcwd() .. "/", "file")
        local path_to_debug_exe = vim.fn.getcwd() .. "/debug.exe"
        local cmd = "clang++ --debug " .. path_to_src .. " -o " .. path_to_debug_exe
        local output = os.execute(cmd)

        -- Exit if compilation fails
        if output ~= 0 then
            error("\nError compiling debugger executable. CMD:\n" .. cmd)
        end

        return path_to_debug_exe
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
}

return {
    -- Sign icons for the various DAP states
    {
        "LazyVim/LazyVim",
        opts = {
            icons = {
                dap = {
                    Stopped = { "", "DapStoppedLine", "DapStoppedLine" },
                    Breakpoint = "🔴",
                    BreakpointCondition = "🔵",
                    BreakpointRejected = "⚫",
                    LogPoint = "",
                },
            },
        },
    },

    {
        "mfussenegger/nvim-dap",
        -- stylua: ignore
        keys = {
            -- Keep step over/out as in the NvChad config (LazyVim swaps them)
            { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
            { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
        },
        opts = function()
            local dap = require "dap"

            -- dap.set_log_level "TRACE" -- Uncomment to enable DAP logging

            -- Highlight for the stopped line
            vim.api.nvim_set_hl(0, "DapStoppedLine", { ctermbg = 0, bg = "#31353f" })

            for _, language in ipairs(js_languages) do
                dap.configurations[language] = dap.configurations[language] or {}
                vim.list_extend(dap.configurations[language], js_configurations)
            end

            -- Replace the LazyVim "Launch file" (asks for an executable), keep "Attach to process"
            dap.configurations.cpp = dap.configurations.cpp or {}
            dap.configurations.cpp[1] = cpp_launch
        end,
    },
}

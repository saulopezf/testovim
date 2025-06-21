-- ╭────────────────────────────────────────────────────────────╮
-- │                Core DAP Configuration (JS/C++)             │
-- │            Add here language specific configurations       │
-- ╰────────────────────────────────────────────────────────────╯

local dap = require "dap"

-- dap.set_log_level "TRACE" -- Uncomment to enable DAP logging

-- Highlight for the stopped line
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, bg = "#31353f" })

-- Sign definitions for various DAP states
vim.fn.sign_define("DapBreakpoint", { text = "🔴" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🔵" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⚫" })
vim.fn.sign_define("DapLogPoint", { text = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

-- ╭──────────────────────────────────────────╮
-- │        js-debug-adapter injection        │
-- ╰──────────────────────────────────────────╯

--- Gets a path to a package in the Mason registry.
--- Prefer this to `get_package`, since the package might not always be
--- available yet and trigger errors.
---@param pkg string
---@param path? string
local function get_pkg_path(pkg, path)
    pcall(require, "mason")
    local root = vim.env.MASON or (vim.fn.stdpath "data" .. "/mason")
    path = path or ""
    local ret = root .. "/packages/" .. pkg .. "/" .. path
    return ret
end

require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        args = {
            get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
            "${port}",
        },
    },
}

-- ╭──────────────────────────────────────────╮
-- │          JavaScript / TypeScript         │
-- ╰──────────────────────────────────────────╯

local js_languages = {
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
    "vue",
}

for _, language in ipairs(js_languages) do
    dap.configurations[language] = {
        {
            -- Debug a standalone Node.js file
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
        },
        {
            -- Attach to a running Node.js process (must be started with --inspect)
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
        },
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
            webRoot = vim.fn.getcwd(),
            protocol = "inspector",
            sourceMaps = true,
            userDataDir = false,
        },
        {
            -- Just a separator for launch.json configs
            name = "----- ↓ launch.json configs ↓ -----",
            type = "",
            request = "launch",
        },
    }
end

-- ╭──────────────────────────────────────────╮
-- │                C / C++                   │
-- ╰──────────────────────────────────────────╯

dap.configurations.cpp = {
    {
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
    },
}

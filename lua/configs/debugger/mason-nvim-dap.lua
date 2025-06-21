-- ╭────────────────────────────────────────────────────────────╮
-- │        Mason DAP: automatic configuration of debuggers     │
-- │    Loads default setup for all DAPs supported via Mason    │
-- ╰────────────────────────────────────────────────────────────╯

local mason_nvim_dap = require "mason-nvim-dap"

mason_nvim_dap.setup {
    handlers = {
        -- Default setup for all installed DAPs via Mason
        function(config)
            mason_nvim_dap.default_setup(config)
        end,

        -- You can add custom setup for specific debuggers here
    },
}

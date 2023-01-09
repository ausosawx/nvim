local M = {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            config = function()
                require("dapui").setup()
            end,
        },
        {
            "theHamsta/nvim-dap-virtual-text",
            config = function()
                require("nvim-dap-virtual-text").setup({})
            end,
        },
    },
}

function M.init()
    -- nvim-dap-ui
    vim.keymap.set("n", "<leader>du", function()
        require("dapui").toggle()
    end, { desc = "Toggle debug ui" })
    vim.keymap.set("n", "<leader>de", function()
        require("dapui").eval(vim.fn.input("Enter debug expression: "))
    end, { desc = "Execute debug expressions" })

    vim.keymap.set("n", "<leader>db", function()
        require("dap").toggle_breakpoint()
    end, { desc = "Mark or delete breakpoints" })
    vim.keymap.set("n", "<leader>dc", function()
        require("dap").clear_breakpoints()
    end, { desc = "Clear breakpoints in the current buffer" })
    vim.keymap.set("n", "<F5>", function()
        require("dap").continue()
    end, { desc = "Enable debugging or jump to the next breakpoint" })
    vim.keymap.set("n", "<F6>", function()
        require("dap").step_into()
    end, { desc = "Step into" })
    vim.keymap.set("n", "<F7>", function()
        require("dap").step_over()
    end, { desc = "Step over" })
    vim.keymap.set("n", "<F8>", function()
        require("dap").step_out()
    end, { desc = "Step out" })
    vim.keymap.set("n", "<F9>", function()
        require("dap").run_last()
    end, { desc = "Rerun debug" })
    vim.keymap.set("n", "<F10>", function()
        require("dap").terminate()
    end, { desc = "Close debug" })
end

function M.config()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Automatically start dapui when debugging starts
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
    end
    -- Automatically close dapui and repl windows when debugging is closed
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
        dap.repl.close()
    end
    -- Automatically close dapui and repl windows when debugging is closed
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
        dap.repl.close()
    end

    -- We need to override nvim-dap's default highlight groups, AFTER requiring nvim-dap for catppuccin.
    vim.api.nvim_set_hl(0, "DapStopped", { fg = "#ABE9B3" })

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "ﳁ", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })

    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
            args = { "--port", "${port}" },
        },
    }

    dap.configurations.cpp = {
        {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = true,
        },
    }

    dap.configurations.c = dap.configurations.cpp

    dap.adapters.python = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python3",
        args = { "-m", "debugpy.adapter" },
    }

    dap.configurations.python = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            pythonPath = "python3",
        },
    }
end

return M

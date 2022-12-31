local M = {
    "folke/noice.nvim",
    event = "VeryLazy",
}

function M.config()
    require("noice").setup(
        {
            lsp = {
                signature = {
                    enabled = false
                }
            },
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
                view_search = "cmdline_popup_search",
                opts = { buf_options = { filetype = "vim" } },
            },
            messages = {
                enabled = false,
            },
            popupmenu = {
                enabled = false,
                backend = "cmp",
            },
            history = {
                view = "split",
                opts = { enter = true },
                filter = { event = "msg_show", ["not"] = { kind = { "search_count", "echo" } } },
            },
            notify = {
                enabled = false,
            },
            lsp_progress = {
                view = "mini"
            },
            throttle = 1000 / 30,
            views = {
                mini = {
                    position = {
                        row = "96%"
                    },
                },
                cmdline_popup = {
                    position = {
                        row = 5,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 8,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = 10,
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                    },
                },
            }
        }
    )
end

return M

local M = {
    "hoob3rt/lualine.nvim",
    event = "VeryLazy",
}

function M.config()
    -- rely gitsigns.nvim
    local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
            return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
            }
        end
    end

    local mini_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    }
    local simple_sections = {
        lualine_a = { "mode" },
        lualine_b = { "filetype" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    }
    local outline = {
        sections = mini_sections,
        filetypes = { "lspsagaoutline" },
    }
    local dapui_scopes = {
        sections = simple_sections,
        filetypes = { "dapui_scopes" },
    }

    local dapui_breakpoints = {
        sections = simple_sections,
        filetypes = { "dapui_breakpoints" },
    }

    local dapui_stacks = {
        sections = simple_sections,
        filetypes = { "dapui_stacks" },
    }

    local dapui_watches = {
        sections = simple_sections,
        filetypes = { "dapui_watches" },
    }

    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = "catppuccin",
            disabled_filetypes = {},
            component_separators = "|",
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                { "branch" },
                { "diff", source = diff_source },
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = { fg = "#ff9e64" },
                },
            },
            lualine_x = {
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    symbols = { error = " ", warn = " ", info = " " },
                },
            },
            lualine_y = {
                { "filetype", colored = true, icon_only = true },
                { "encoding" },
                {
                    "fileformat",
                    icons_enabled = true,

                    symbols = {
                        unix = "",
                        dos = "",
                        mac = "",
                    },
                },
            },
            lualine_z = { "progress", "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {
            "quickfix",
            "nvim-tree",
            "toggleterm",
            "aerial",
            outline,
            dapui_scopes,
            dapui_breakpoints,
            dapui_stacks,
            dapui_watches,
        },
    })
end

return M

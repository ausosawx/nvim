local M = {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
}

function M.config()
    local opts = {
        options = {
            themable = true,
            show_close_icon = true,
            -- ordinal
            numbers = "none",
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            diagnostics = "nvim_lsp",
            separator_style = "thin",
            indicator = { icon = "▎", style = "icon" },
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
                {
                    filetype = "aerial",
                    text = "Outline Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
                {
                    filetype = "spectre_panel",
                    text = "Project Blurry Search",
                    highlight = "Directory",
                    text_align = "center",
                },
                {
                    filetype = "toggleterm",
                    text = "Integrated Terminal",
                    highlight = "Directory",
                    text_align = "center",
                },
            },

            diagnostics_indicator = function(count)
                return "(" .. count .. ")"
            end,
        },
    }

    if vim.g.colors_name == "catppuccin" then
        local cp = require("catppuccin.palettes").get_palette()
        cp.none = "NONE" -- Special setting for complete transparent fg/bg.

        local catppuccin_hl_overwrite = {
            highlights = require("catppuccin.groups.integrations.bufferline").get({
                styles = { "italic", "bold" },
                custom = {
                    mocha = {
                        -- Warnings
                        warning = { fg = cp.yellow },
                        warning_visible = { fg = cp.yellow },
                        warning_selected = { fg = cp.yellow },
                        warning_diagnostic = { fg = cp.yellow },
                        warning_diagnostic_visible = { fg = cp.yellow },
                        warning_diagnostic_selected = { fg = cp.yellow },
                        -- Infos
                        info = { fg = cp.sky },
                        info_visible = { fg = cp.sky },
                        info_selected = { fg = cp.sky },
                        info_diagnostic = { fg = cp.sky },
                        info_diagnostic_visible = { fg = cp.sky },
                        info_diagnostic_selected = { fg = cp.sky },
                        -- Hint
                        hint = { fg = cp.rosewater },
                        hint_visible = { fg = cp.rosewater },
                        hint_selected = { fg = cp.rosewater },
                        hint_diagnostic = { fg = cp.rosewater },
                        hint_diagnostic_visible = { fg = cp.rosewater },
                        hint_diagnostic_selected = { fg = cp.rosewater },
                    },
                },
            }),
        }

        opts = vim.tbl_deep_extend("force", opts, catppuccin_hl_overwrite)
    end

    require("bufferline").setup(opts)
end

return M

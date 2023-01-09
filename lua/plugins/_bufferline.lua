local M = {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
}

function M.init()
    vim.keymap.set("n", "<c-q>", "<cmd>bdelete!<cr>", { desc = "Close current buffer" })
    vim.keymap.set("n", "<leader>h", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go to left buffer" })
    vim.keymap.set("n", "<leader>l", "<cmd>BufferLineCycleNext<cr>", { desc = "Go to right buffer" })
    vim.keymap.set("n", "<c-e>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move current buffer to left" })
    vim.keymap.set("n", "<c-y>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move current buffer to right" })
    vim.keymap.set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "Create new buffer" })
    vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close all left buffers" })
    vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Close all right buffers" })
    vim.keymap.set("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Go to buffer 1" })
    vim.keymap.set("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Go to buffer 2" })
    vim.keymap.set("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Go to buffer 3" })
    vim.keymap.set("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Go to buffer 4" })
    vim.keymap.set("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Go to buffer 5" })
    vim.keymap.set("n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Go to buffer 6" })
    vim.keymap.set("n", "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Go to buffer 7" })
    vim.keymap.set("n", "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Go to buffer 8" })
    vim.keymap.set("n", "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Go to buffer 9" })
    vim.keymap.set("n", "<leader>bo", function()
        vim.cmd("BufferLineCloseLeft")
        vim.cmd("BufferLineCloseRight")
    end, { desc = "Close all other buffers" })
    vim.keymap.set("n", "<leader>ba", function()
        vim.cmd("BufferLineCloseLeft")
        vim.cmd("BufferLineCloseRight")
        vim.cmd("bdelete!")
    end, { desc = "Close all buffers" })
    vim.keymap.set("n", "<leader>bt", "<cmd>BufferLinePick<cr>", { desc = "Go to buffer *" })
    vim.keymap.set("n", "<leader>bs", "<cmd>BufferLineSortByExtension<cr>", {
        desc = "Buffers sort (by extension)",
    })
end

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

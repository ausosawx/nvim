local M = {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    event = "VeryLazy",
    dependencies = {
        -- Sets vim.ui.select to telescope
        { "nvim-telescope/telescope-ui-select.nvim" },
        -- c port of fzf for telescope
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
}

function M.init()
    vim.keymap.set("n", "<leader>ff", function()
        require("telescope.builtin").find_files()
    end, { desc = "Find files in the current workspace" })
    vim.keymap.set("n", "<leader>fg", function()
        require("telescope.builtin").live_grep()
    end, { desc = "Find string in the current workspace" })
    vim.keymap.set("n", "<leader>fo", function()
        require("telescope.builtin").oldfiles()
    end, { desc = "Find telescope history" })
    vim.keymap.set("n", "<leader>fh", function()
        require("telescope.builtin").resume()
    end, { desc = "Find last lookup" })
    vim.keymap.set("n", "<leader>ft", function()
        require("telescope.builtin").help_tags()
    end, { desc = "Find all help document tags" })
    vim.keymap.set("n", "<leader>fm", function()
        require("telescope.builtin").marks()
    end, { desc = "Find marks in the current workspace" })
    vim.keymap.set("n", "<leader>fi", function()
        require("telescope.builtin").highlights()
    end, { desc = "Find all neovim highlights" })
    vim.keymap.set("n", "<leader>fb", function()
        require("telescope.builtin").buffers()
    end, { desc = "Find all buffers" })
    vim.keymap.set("n", "<leader>f/", function()
        require("telescope.builtin").search_history()
    end, { desc = "Find all search history" })
    vim.keymap.set("n", "<leader>f:", function()
        require("telescope.builtin").command_history()
    end, { desc = "Find all command history" })
    vim.keymap.set("n", "<leader>fs", function()
        require("telescope.builtin").colorscheme()
    end, { desc = "list all colorschems" })
end

function M.config()
    require("telescope").setup({
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            entry_prefix = " ",
            multi_icon = " ",
            color_devicons = true,
            file_ignore_patterns = { "node_modules" },
            layout_strategy = "bottom_pane",
            layout_config = {
                bottom_pane = {
                    height = 15,
                    preview_cutoff = 100,
                    prompt_position = "bottom",
                },
            },
        },
        pickers = {
            buffers = {
                mappings = {
                    i = {
                        ["<c-d>"] = "delete_buffer",
                    },
                    n = {
                        ["dd"] = "delete_buffer",
                    },
                },
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({
                    width = 0.8,
                    previewer = false,
                    prompt_title = false,
                    borderchars = {
                        { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                        prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                        results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    },
                }),
            },
        },
    })

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("yank_history")
end

return M

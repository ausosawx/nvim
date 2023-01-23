local M = {
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "VeryLazy",
}

function M.init()
    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { desc = "Show code action" })
    vim.keymap.set("n", "<leader>cn", "<cmd>Lspsaga rename<cr>", { desc = "Variable renaming" })
    vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<cr>", { desc = "Show help information" })
    vim.keymap.set("n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Jump to prev diagnostic" })
    vim.keymap.set("n", "]g", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Jump to next diagnostic" })
    vim.keymap.set("n", "<leader>3", "<cmd>Lspsaga outline<CR>", { desc = "Open outline" })
    vim.keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "Show line diagnostics" })
    vim.keymap.set("n", "go", "<cmd>Lspsaga show_cursor_diagnostics<cr>", { desc = "Show cursor diagnostics" })
    vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<cr>", { desc = "Go to definitions" })
    vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
    vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
    vim.keymap.set("n", "[e", function()
        require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, { desc = "Only jump to prev error" })
    vim.keymap.set("n", "]e", function()
        require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, { desc = "Only jump to next error" })
    -- vim.keymap.set(
    --     "n",
    --     "gq",
    --     "<cmd>Lspsaga lsp_finder<cr>",
    --     { desc = "find the symbol definition implement reference" }
    -- )
end

function M.config()
    local function set_sidebar_icons()
        -- Set icons for sidebar.
        local diagnostic_icons = {
            Error = " ",
            Warn = " ",
            Info = " ",
            Hint = " ",
        }
        for type, icon in pairs(diagnostic_icons) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl })
        end
    end

    local function get_palette()
        if vim.g.colors_name == "catppuccin" then
            -- If the colorscheme is catppuccin then use the palette.
            return require("catppuccin.palettes").get_palette()
        else
            -- Default behavior: return lspsaga's default palette.
            local palette = require("lspsaga.lspkind").colors
            palette.peach = palette.orange
            palette.flamingo = palette.orange
            palette.rosewater = palette.yellow
            palette.mauve = palette.violet
            palette.sapphire = palette.blue
            palette.maroon = palette.orange

            return palette
        end
    end

    set_sidebar_icons()

    local colors = get_palette()

    require("lspsaga").setup({
        scroll_preview = {
            scroll_down = "<C-p>",
            scroll_up = "<C-b>",
        },
        ui = {
            diagnostic = { " ", " ", "  ", " " },
            kind = {
                File = { " ", colors.rosewater },
                Module = { " ", colors.blue },
                Namespace = { " ", colors.blue },
                Package = { " ", colors.blue },
                Class = { "ﴯ ", colors.yellow },
                Method = { " ", colors.blue },
                Property = { "ﰠ ", colors.teal },
                Field = { " ", colors.teal },
                Constructor = { " ", colors.sapphire },
                Enum = { " ", colors.yellow },
                Interface = { " ", colors.yellow },
                Function = { " ", colors.blue },
                Variable = { " ", colors.peach },
                Constant = { " ", colors.peach },
                String = { " ", colors.green },
                Number = { " ", colors.peach },
                Boolean = { " ", colors.peach },
                Array = { " ", colors.peach },
                Object = { " ", colors.yellow },
                Key = { " ", colors.red },
                Null = { "ﳠ ", colors.yellow },
                EnumMember = { " ", colors.teal },
                Struct = { " ", colors.yellow },
                Event = { " ", colors.yellow },
                Operator = { " ", colors.sky },
                TypeParameter = { " ", colors.maroon },
                -- ccls-specific icons.
                TypeAlias = { " ", colors.green },
                Parameter = { " ", colors.blue },
                StaticMethod = { "ﴂ ", colors.peach },
                Macro = { " ", colors.red },
            },
        },
    })
end

return M

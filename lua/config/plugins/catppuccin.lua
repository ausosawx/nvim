local M =
{
    "catppuccin/nvim",
    name = "catppuccin"
}

function M.config()
    vim.g.catppuccin_flavour = "mocha" -- Set flavour

    require("catppuccin").setup({
        dim_inactive = {
            enabled = false,
            -- Dim inactive splits/windows/buffers.
            shade = "dark",
            percentage = 0.15,
        },
        transparent_background = false,
        term_colors = true,
        styles = {
            comments = { "italic" },
            properties = { "italic" },
            functions = { "italic", "bold" },
            keywords = { "italic" },
            operators = { "bold" },
            conditionals = { "bold" },
            loops = { "bold" },
            booleans = { "bold", "italic" },
            numbers = {},
            types = {},
            strings = {},
            variables = {},
        },
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
            },
            lsp_saga = true,
            fidget = false,
            illuminate = true,
            gitsigns = true,
            telescope = true,
            aerial = true,
            nvimtree = true,
            which_key = true,
            indent_blankline = { enabled = true, colored_indent_levels = false },
            markdown = true,
            ts_rainbow = true,
            hop = true,
            cmp = true,
            dap = { enabled = true, enable_ui = true },
            notify = true,
            lightspeed = false,
            treesitter_context = false,
            symbols_outline = false,
            coc_nvim = false,
            leap = false,
            neotree = { enabled = false, show_root = true, transparent_panel = false },
            telekasten = false,
            mini = false,
            vimwiki = false,
            beacon = false,
            overseer = false,
            lsp_trouble = false,
            pounce = false,
            gitgutter = false,
            dashboard = false,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
        },
    })
end

return M

return {
    -- as dependencies
    { "nvim-lua/plenary.nvim" },
    -- provide same icons as well as colors for each icon
    { "kyazdani42/nvim-web-devicons" },
    -- nvim lua API
    { "folke/neodev.nvim", event = "VeryLazy" },
    -- snippets for LuaSnip
    { "rafamadriz/friendly-snippets", event = "VeryLazy" },
    { "honza/vim-snippets", event = "VeryLazy" },
    -- highlight, navigate, and operate on sets of matching text
    { "andymass/vim-matchup", event = "VeryLazy" },
    -- color highlighte
    { "norcalli/nvim-colorizer.lua", event = "VeryLazy" },
    -- multicursors operation
    { "mg979/vim-visual-multi", keys = "<c-n>" },
    -- surround selections
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        version = "*",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        keys = "<c-<F5>>",
        build = "cd app && npm install",
    },
    -- highlight and search for todo comments
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        init = function()
            vim.keymap.set({ "n" }, "<leader>fd", function()
                require("telescope").extensions["todo-comments"].todo()
            end, { desc = "Find todo tag in the current workspace" })
            -- code
        end,
        config = function()
            require("todo-comments").setup()
        end,
    },
    -- show function signature
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        config = function()
            require("lsp_signature").setup({
                extra_trigger_chars = { "(" },
                toggle_key = "<c-/>",
            })
        end,
    },
}

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
    -- search
    { "windwp/nvim-spectre", event = "VeryLazy" },
    -- highlight, navigate, and operate on sets of matching text
    { "andymass/vim-matchup", event = "VeryLazy" },
    -- color highlighte
    { "norcalli/nvim-colorizer.lua", event = "VeryLazy" },
    -- multicursors operation
    { "mg979/vim-visual-multi", keys = "<c-n>" },
    -- neovim easy motion
    {
        "phaazon/hop.nvim",
        branch = "v2",
        cmd = { "HopWord", "HopLine", "HopChar1", "HopChar1CurrentLine" },
        config = function()
            require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
        end,
    },
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
    -- highlight on matched information
    {
        "kevinhwang91/nvim-hlslens",
        event = "VeryLazy",
        config = function()
            require("hlslens").setup({
                -- automatically clear search results
                calm_down = true,
                -- set to the nearest match to add a shot
                nearest_only = true,
            })
        end,
    },
    -- integration with build systems such as cmake
    {
        "Shatur/neovim-tasks",
        ft = { "c", "cpp", "hpp", "cmake" },
        config = function()
            require("tasks").setup({
                default_params = {
                    cmake = {
                        dap_name = "codelldb",
                    },
                },
            })
        end,
    },
    -- highlight and search for todo comments
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
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

return {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "kyazdani42/nvim-web-devicons" },
    { "rafamadriz/friendly-snippets", event = "VeryLazy" },
    { "honza/vim-snippets", event = "VeryLazy" },
    { "williamboman/mason-lspconfig.nvim", event = "VeryLazy" },
    { "MunifTanjim/nui.nvim", event = "VeryLazy" },
    { "folke/neodev.nvim", event = "VeryLazy" },
    { "windwp/nvim-spectre", event = "VeryLazy" },
    { "andymass/vim-matchup", event = "VeryLazy" },
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
    { "norcalli/nvim-colorizer.lua", event = "VeryLazy" },
    { "mg979/vim-visual-multi", keys = "<c-n>" },
    {
        "nvim-orgmode/orgmode",
        event = "VeryLazy",
        config = function()
            require("orgmode").setup_ts_grammar()
            require("orgmode").setup({
                org_agenda_files = { "~/Data/org/*" },
                org_default_notes_file = "~/Data/code/org/refile.org",
            })
        end,
    },
    {
        "phaazon/hop.nvim",
        branch = "v2",
        cmd = { "HopWord", "HopLine", "HopChar1", "HopChar1CurrentLine" },
        config = function()
            require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
        end,
    },
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
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        config = function()
            require("todo-comments").setup()
        end,
    },
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

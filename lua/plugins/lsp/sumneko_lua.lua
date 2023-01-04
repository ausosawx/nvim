return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    single_file_support = true,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            completion = {
                callSnippet = "Replace",
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            format = {
                enable = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

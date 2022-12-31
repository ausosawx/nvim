return {
    single_file_support = true,
    filetypes = { "json", "jsonc" },
    cmd = { "vscode-json-language-server", "--stdio" },
    init_options = {
        provideFormatter = true,
    },
}

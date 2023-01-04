return {
    filetypes = { "python" },
    single_file_support = true,
    cmd = { "pylsp" },
    settings = {
        pylsp = {
            configurationSources = { "pylint" },
            plugins = {
                pycodestyle = {
                    enabled = false,
                    ignore = { "W391" },
                    maxLineLength = 100,
                },
                autopep8 = {
                    enabled = false,
                },
                pyflakes = {
                    enabled = false,
                },
                pylint = {
                    enabled = true,
                    executable = vim.fn.stdpath("data") .. "/mason/bin/pylint",
                    args = {
                        "--rcfile=" .. vim.fn.stdpath("config") .. "/lint/pylintrc",
                    },
                },
            },
        },
    },
}

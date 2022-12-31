local util = require("lspconfig.util")

return {
    filetypes = { 'sh', "zsh" },
    single_file_support = true,
    cmd = { "bash-language-server", "start" },
}

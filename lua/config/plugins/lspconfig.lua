local M = {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
}

function M.config()
    require("neodev").setup()
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    local configurations_dir_path = "config/plugins/lsp/"

    vim.diagnostic.config({
        signs = true,
        underline = true,
        severity_sort = false,
        update_in_insert = false,
        float = { source = "always" },
        virtual_text = { prefix = "●", source = "always" },
    })

    for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
        local require_path = string.format("%s%s", configurations_dir_path, server_name)

        local ok, settings = pcall(require, require_path)

        if not ok then
            settings = {}
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()

        settings.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        lspconfig[server_name].setup(settings)
    end
end

return M

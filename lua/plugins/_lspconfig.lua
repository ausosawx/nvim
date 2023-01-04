local M = {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = "williamboman/mason-lspconfig.nvim",
}

function M.config()
    local dev_ok, neodev = pcall(require, "folke/neodev.nvim")
    if dev_ok then
        neodev.setup()
    end

    local mason_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not mason_ok then
        vim.notify("mason-lspconfig not ok", "ERROR", { title = "lspconfig.lua" })
        return
    end
    local lspconfig = require("lspconfig")

    local configurations_dir_path = "plugins/lsp/"

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

        local path_ok, settings = pcall(require, require_path)

        if not path_ok then
            vim.notify("check for server path", "ERROR", { title = "lspconfig.lua" })
            settings = {}
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()

        local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        if cmp_ok then
            settings.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
        else
            vim.notify("cmp not ok", "ERROR", { title = "lspconfig.lua" })
        end
        lspconfig[server_name].setup(settings)
    end
end

return M

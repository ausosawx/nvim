local M = {
    "williamboman/mason.nvim",
    event = "VeryLazy",
}

function M.config()
    require("mason").setup({
        max_concurrent_installers = 20,
        ui = {
            border = "single",
            icons = {
                package_installed = "",
                package_pending = "",
                package_uninstalled = "",
            },
        },
    })

    local mason_registry = require("mason-registry")
    local installer_resources = {
        -- lsp
        "python-lsp-server",
        "json-lsp",
        "lua-language-server",
        "bash-language-server",
        "clangd",

        -- dap
        "debugpy",
        "codelldb",

        -- formatter
        "shfmt",
        "cmakelang",
        "stylua",

        -- lint
        "markdownlint",
        "pylint",
    }

    local new_installed_resources = {}
    local bool_table = {}
    local uninstalled_resources = {}
    local installed_resources = mason_registry.get_installed_package_names()

    for _, resource_name in ipairs(installer_resources) do
        if not mason_registry.is_installed(resource_name) then
            local ok, resource = pcall(mason_registry.get_package, resource_name)
            if ok then
                resource:install()
                table.insert(new_installed_resources, resource_name)
            else
                vim.notify(string.format("Invalid resource name %s", resource_name), "ERROR", { title = "Mason" })
            end
        else
            bool_table[resource_name] = true
        end
    end

    for _, resource_name in ipairs(installed_resources) do
        if not bool_table[resource_name] then
            local _, resource = pcall(mason_registry.get_package, resource_name)
            resource:uninstall()
            table.insert(uninstalled_resources, resource_name)
        end
    end

    if not vim.tbl_isempty(new_installed_resources) then
        vim.notify(
            string.format("Install resource: \n - %s", table.concat(new_installed_resources, "\n - ")),
            "INFO",
            { title = "Mason" }
        )
    end

    if not vim.tbl_isempty(uninstalled_resources) then
        vim.notify(
            string.format("Uninstall resource: \n - %s", table.concat(uninstalled_resources, "\n - ")),
            "INFO",
            { title = "Mason" }
        )
    end
end

return M

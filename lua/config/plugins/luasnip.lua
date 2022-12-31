local M = {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
}

function M.ft_edit()
    require("luasnip.loaders").edit_snippet_files({
        format = function(path, _)
            path = path:gsub(vim.pesc(vim.fn.stdpath("data") .. "/lazy"), "$PLUGINS")
            if vim.env.HOME then
                path = path:gsub(vim.pesc(vim.env.HOME .. "/.dotfiles/nvim"), "$CONFIG")
            end
            path = path:gsub(vim.pesc(vim.fn.getcwd()), "$CWD")
            return path
        end,
        edit = function(file)
            vim.cmd("tabnew " .. file)
        end,
    })
end

function M.config()
    -- vim.o.runtimepath = vim.o.runtimepath .. "," .. os.getenv("HOME") .. "/.config/nvim/my-snippets/,"
    require("luasnip").config.setup({
        history = true,
        update_events = "InsertLeave",
        enable_autosnippets = true,
        delete_check_events = "TextChanged,InsertLeave",
    })
    require("luasnip.loaders.from_lua").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()

    vim.cmd([[command! LuaSnipEdit :lua require("config.plugins.luasnip").ft_edit()]])
end

return M

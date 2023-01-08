local M = {
    "neoclide/coc.nvim",
    branch = "release",
    event = { "InsertEnter", "CmdlineEnter" },
}

function M.config()
    vim.g.coc_global_extensions = { "coc-json", "coc-clangd", "coc-sumneko-lua", "coc-julia" }

    local keyset = vim.keymap.set
    -- Autocomplete
    function _G.check_back_space()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
    end

    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
    keyset(
        "i",
        "<TAB>",
        'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
        opts
    )
    keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

    keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

    -- Use <c-j> to trigger snippets
    -- keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
    -- Use <c-space> to trigger completion
    keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

    vim.api.nvim_create_user_command("Format", ":call CocActionAsync('format')", { nargs = 0 })

    keyset("n", "<leader>cf", ":Format<cr>", { silent = true })
end

return M

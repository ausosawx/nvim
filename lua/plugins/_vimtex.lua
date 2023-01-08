local M = {
    "lervag/vimtex",
    lazy = false,
}

function M.config()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_doc_handlers = { "vimtex#doc#handlers#texdoc" }
end

return M

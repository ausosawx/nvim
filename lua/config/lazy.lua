-- bootstrap from github
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "git@github.com:folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

-- load lazy
require("lazy").setup({
    spec = { import = "plugins" },
    defaults = { lazy = true },
    checker = { enabled = true },
    install = {
        colorscheme = { "catppuccin", "habamax" },
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

vim.keymap.set({ "n" }, "<leader>ph", ":Lazy home<cr>", { desc = "Lazy home" })
vim.keymap.set({ "n" }, "<leader>ps", ":Lazy sync<cr>", { desc = "Plugins sync" })
vim.keymap.set({ "n" }, "<leader>pc", ":Lazy clean<cr>", { desc = "Plugins clean" })
vim.keymap.set({ "n" }, "<leader>pC", ":Lazy clear<cr>", { desc = "Cache clean" })
vim.keymap.set({ "n" }, "<leader>pu", ":Lazy update<cr>", { desc = "Plugins update" })

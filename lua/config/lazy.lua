local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.extras.lang.typescript" },
    { import = "plugins.extras.lang.json" },
    { import = "plugins.extras.ui.mini-animate" },
  },
  defaults = { lazy = true },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true },
  diff = {
    cmd = "terminal_git",
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    custom_keys = {
      ["<localleader>d"] = function(plugin)
        dd(plugin)
      end,
    },
  },
  debug = false,
})

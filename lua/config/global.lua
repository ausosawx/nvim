local fn = vim.fn

-- Disable builtin fzf
vim.g.loaded_fzf = 1

-- Do not plugins which are related to checking files inside compressed files
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

-- disable vimball which is used for vim plugins
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1

-- Do not use buultin matchit.vim and matchparen.vim, vim-match instead
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

-- Do not load tohtml.vim
vim.g.loaded_2html_plugin = 1

-- Do not load netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

-- Do not load tutor plugin
vim.g.loaded_tutor_mode_plugin = 1

-- Disable sql omni completion, it is broken
vim.g.loaded_sql_completion = 1

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.did_install_default_menus = 1 -- do not load menu

-- Enable highlighting for lua HERE doc inside vim script
vim.g.vimsyn_embed = "l"

-- Custom mapping <leader>
vim.g.mapleader = " "

-- where is python3 executable
vim.g.python3_host_prog = fn.exepath("python3")

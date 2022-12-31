# README

![](https://img.shields.io/badge/neovim-0.8-green?style=plastic&logo=Neovim)

## Announcement

- Most of the content is copied from [ayamir](https://github.com/ayamir/nvimdots)
- I make some changes to satisfy my own needs
- I add a lot of explanatory content to make it more explicit

## Introduction

This is a `neovim-git` and `wayland` based configuration.

So you must install `neovim-git` (`archlinuxcn` recommended) or newer edition.

## Dependencies
```bash
-- for much use
paru -S tar curl git wget gzip unzip
paru -S nodejs npm
paru -S rustup
rustup default stable

-- python
paru -S python-pynvim

-- lazygit
paru -S lazygit

-- c
paru -S llvm clang libc++

-- patched font
paru -S nerd-fonts-source-code-pro

-- for nvim-spectre to search and replace
paru -S ripgrep sed

-- for clipboard
paru -S wl-clipboard(wayland)
paru -S xsel(X11)

-- for shell formatter
paru -S go

-- for shell lsp check
paru -S shellcheck

-- for neovim-tasks to find the correct CMakeLists.txt
paru -S ctags
```

## Keybindings
👉 Almost all key mappings, including some keys that come with nvim, can be accessed through `which-key` plugin.So if you just forget, type the `prefix` and then explicit descriptions will come up.

### Basic
| Shortcut          | Action                                                    |
|-------------------|-----------------------------------------------------------|
| `<leader><esc>`   | Store and quit neovim                                     |
| `jj`              | Escape editor insert mode                                 |
| `<esc>`           | Escape terminal insert mode                               |
| `<esc>`           | Clear search highlights                                   |
| `<c-u>`           | Move 1/4 screen up                                        |
| `<c-d>`           | Move 1/4 screen down                                      |
| `<m-k>`           | Reduce horizontal split screen size                       |
| `<m-j>`           | Increase horizontal split screen size                     |
| `<m-h>`           | Reduce vertical split screen size                         |
| `<m-l>`           | Increase vertical split screen size                       |
| `<leader>sc`      | Enable or disable spell checking                          |
| `H`               | Move to the first character at the beginning of the line  |
| `L`               | Move to the last character at the end of the line         |
| `<m-w>`           | Jump to next word in insert mode                          |
| `<m-b>`           | Jump to previous word in insert mode                      |
| `<m-k>`           | Move cursor up in insert mode                             |
| `<m-j>`           | Move cursor down in insert mode                           |
| `<m-h>`           | Move cursor left in insert mode                           |
| `<m-l>`           | Move cursor right in insert mode                          |
| `<c-F5>`          | Quick compile according to the filetype                   |
| `<c-h>`           | turn to left window                                       |
| `<c-j>`           | turn to down window                                       |
| `<c-k>`           | turn to up window                                         |
| `<c-l>`           | turn to right window                                      |


### Plugins

#### [packer](https://github.com/wbthomason/packer.nvim)
| Shortcut          | Action                                  |
|-------------------|-----------------------------------------|
| `<leader>ps`      | Update all plugins and then compile     |
| `<leader>pC`      | Remove all no need or disabled plugins  |
| `<leader>pc`      | Perform PackerCompile                   |

#### [nvim-notify](https://github.com/rcarriga/nvim-notify)
| Shortcut          | Action                |
|-------------------|-----------------------|
| `<leader>fn`      | Find notices History  |

#### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- **{i, s, c} mode**

| shortcut          | action                                            |
|-------------------|---------------------------------------------------|
| `<tab>`           | confirm the selected or the fisrt                 |
| `<cr>`            | confirm the selected                              |
| `<ctrl>p`         | select the previous item                          |
| `<ctrl>n`         | select the next item                              |
| `<ctrl>b`         | scroll the docs up                                |
| `<ctrl>f`         | scroll the docs down                              |
| `<ctrl>u`         | select the previous item between 4 gaps           |
| `<ctrl>d`         | select the next item between 4 gaps               |
| `<ctrl>k`         | toggle the pop-up window                          |

#### [nvim-dap](https://github.com/mfussenegger/nvim-dap)
| Shortcut          | Action                                            |
|-------------------|---------------------------------------------------|
| `<leader>db`      | Mark or delete breakpoints                        |
| `<leader>dc`      | Clear breakpoints in the current buffer           |
| `<F5>`            | Enable debugging or jump to the next breakpoint   |
| `<F6>`            | Step into                                         |
| `<F7>`            | Step over                                         |
| `<F8>`            | Step out                                          |
| `<F9>`            | Rerun debug                                       |
| `<F10>`           | Close debug                                       |

#### [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
| Shortcut          | Action                                            |
|-------------------|---------------------------------------------------|
| `<leader>du`      | Toggle debug ui                                   |
| `<leader>de`      | Execute debug expressions                         |

#### [comment](https://github.com/numToStr/Comment.nvim)
- **Normal**

| Shortcut              | Action                                                                |
|-----------------------|-----------------------------------------------------------------------|
| `gcc`                 | Toggles the current line using linewise comment                       |
| `gbc`                 | Toggles the current line using blockwise comment                      |
| `[count]gcc`          | Toggles the number of line given as a prefix-count using linewise     |
| `[count]gbc`          | Toggles the number of line given as a prefix-count using blockwise    |
| `gc[count]{motion}`   | (Op-pending) Toggles the region using linewise comment                |
| `gb[count]{motion}`   | (Op-pending) Toggles the region using blockwise comment               |
| `gco`                 | Insert comment to the next line and enters INSERT mode                |
| `gcO`                 | Insert comment to the previous line and enters INSERT mode            |
| `gcA`                 | Insert comment to end of the current line and enters INSERT mode      |

- **Visual**

| Shortcut          | Action                                        |
|-------------------|-----------------------------------------------|
| `gc`              | Toggles the region using linewise comment     |
| `gb`              | Toggles the region using blockwise comment    |

#### [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- **Insert**

| Shortcut          | Action                                |
|-------------------|---------------------------------------|
| `<ctrl>h`         | delete a pair                         |
| `<ctrl>w`         | delete a pair if possible             |

#### [nvim-surround](https://github.com/kylechui/nvim-surround)

#### [vim-visual-multi](https://github.com/mg979/vim-visual-multi)

#### [hop](https://github.com/phaazon/hop.nvim)
| Shortcut          | Action                                      |
|-------------------|---------------------------------------------|
| `ss`              | Jump to word head                           |
| `sl`              | Jump to line                                |
| `sf`              | Jump to search char on buffer               |
| `sc`              | Jump to search char on current line         |

💡The plugins works in `Normal` `Visual` and `Select` mode 

#### [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)
| Shortcut          | Action                                      |
|-------------------|---------------------------------------------|
| `n`               | Skip to next search result                                    |
| `N`               | Jump to previous search result                                |
| `*`               | Jump to the next word at the current cursor                   |
| `#`               | Jump to the prev word at the current cursor                   |
| `g*`              | Jump to the next word at the current cursor (forbidden range) |
| `g#`              | Jump to the prev word at the current cursor (forbidden range) |

#### [yanky.nvim](https://github.com/gbprod/yanky.nvim)
| Shortcut          | Action                                      |
|-------------------|---------------------------------------------|
| `<leader>fy`      | Find Clipboard History                      |
| `<leader>cy`      | Clear Clipboard History                     |

#### [telescope](https://github.com/nvim-telescope/telescope.nvim)
| Shortcut          | Action                                  |
|-------------------|-----------------------------------------|
| `<leader>ff`      | Find files in the current workspace     |
| `<leader>fg`      | Find string in the current workspace    |
| `<leader>fo`      | Find telescope history                  |
| `<leader>fh`      | Find last lookup                        |
| `<leader>ft`      | Find all help document tags             |
| `<leader>fm`      | Find marks in the current workspace     |
| `<leader>fi`      | Find all neovim highlights              |
| `<leader>fb`      | Find all buffers                        |
| `<leader>f/`      | Find all search history                 |
| `<leader>f:`      | Find all command history                |
| `<leader>fs`      | list all colorschems                    |

💡When you search `buffers`,in the `telescope` ui, in the `Insert` mode, you can type `<ctrl>d` to delete one `buffer`.In the `Normal` mode, you can type `dd` to do so.

#### [todo-comments](https://github.com/folke/todo-comments.nvim)
| Shortcut          | Action                                  |
|-------------------|-----------------------------------------|
| `<leader>fd`      | Find todo tag in the current workspace  |

#### [aerial](https://github.com/stevearc/aerial.nvim)
| Shortcut          | Action                                                |
|-------------------|-------------------------------------------------------|
| `<leader>2`       | Open Outilne Explorer                                 |
| `[[`              | Move up one level                                     |
| `]]`              | Move down one level                                   |

#### [lsp_signature](https://github.com/ray-x/lsp_signature.nvim)
| Shortcut          | Action                                                |
|-------------------|-------------------------------------------------------|
| `<c-/>`           | Toggle lsp_signature help                             |

#### [lspsaga](https://github.com/glepnir/lspsaga.nvim)
| Shortcut          | Action                                            |
|-------------------|---------------------------------------------------|
| `<leader>ca`      | Show code action                                  |
| `<leader>cn`      | Variable renaming                                 |
| `<leader>o`       | Open outline                                      |
| `gh`              | Show help information                             |
| `[g`              | Jump to prev diagnostic                           |
| `]g`              | Jump to next diagnostic                           |
| `[e`              | Only jump to prev error                           |
| `]e`              | Only jump to next error                           |
| `gl`              | Show line diagnostics                             |
| `go`              | Show cursor diagnostics                           |
| `gd`              | Go to definitions                                 |
| `gq`              | find the symbol definition implement references   |

#### [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
| Shortcut          | Action                        |
|-------------------|-------------------------------|
| `<leader>cf`      | Format buffers                |
| `gs`              | Find all document symbols     |
| `gr`              | Go to references              |
| `gI`              | Go to implementations         |
| `gD`              | Go to type definitions        |
| `gO`              | Show Workspace Diagnostics    |

#### [neovim-tasks](https://github.com/Shatur/neovim-tasks)
| Shortcut          | Action                                                |
|-------------------|-------------------------------------------------------|
| `<leader>cc`      | cmake configure       |
| `<leader>cr`      | cmake run             |
| `<leader>cd`      | nvim-dap debug        |
| `<leader>ct`      | select target         |


#### [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
| Shortcut          | Action                                                |
|-------------------|-------------------------------------------------------|
| `<leader>gl`      | Toggle current line blame                             |
| `<leader>gh`      | Preview current hunk                                  |
| `<leader>gH`      | Show current block blame                              |
| `<leader>gd`      | Open deff view                                        |
| `<leader>gD`      | Show deleted lines                                    |
| `<leader>gr`      | Reset current hunk                                    |
| `<leader>gR`      | Reset current buffer                                  |
| `[c`              | Jump to the prev hunk                                 |
| `]c`              | Jump to the next hunk                                 |

#### [bufferline](https://github.com/akinsho/bufferline.nvim)
| Shortcut          | Action                                      |
|-------------------|---------------------------------------------|
| `<ctrl>q`         | Close current buffer forcefully             |
| `<ctrl>h`         | Go to left buffer                           |
| `<ctrl>l`         | Go to right buffer                          |
| `<ctrl>e`         | Move current buffer to left                 |
| `<ctrl>y`         | Move current buffer to right                |
| `<leader>bn`      | Create new bufferline                       |
| `<leader>bl`      | Close all left buffers                      |
| `<leader>br`      | Close all right buffers                     |
| `<leader>bo`      | Close all other buffers                     |
| `<leader>ba`      | Close all buffers                           |
| `<leader>bt`      | Go to buffer *                              |
| `<leader>bs`      | Buffers sort (by extension)                 |
| `<leader>b[n]`    | Go to the `n_rd` buffer                     |

#### [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
| Shortcut          | Action                                                                            |
|-------------------|-----------------------------------------------------------------------------------|
| `<leader>rp`      | Replace characters in all files in the current workspace                          |
| `<leader>rf`      | Replace all characters in the current file                                        |
| `<leader>rwf`     | Replace the character under the cursor in the current file                        |
| `<leader>rwp`     | Replace the character under the cursor in all files under the current workspace   |

#### [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
| Shortcut          | Action                                  |
|-------------------|-----------------------------------------|
| `<leader>1`       | Open file explorer                      |
| `<leader>fc`      | Find the current file and open it       |

💡type `?` in `nvim-tree` for help

#### [toggleterm](https://github.com/akinsho/toggleterm.nvim)
| Shortcut          | Action                                      |
|-------------------|---------------------------------------------|
| `[n]<leader>tt`   | Toggle `n_rd` bottom                        |
| `<leader>tf`      | Toggle floating terminal                    |
| `<leader>tv`      | Toggle vertical terminal                    |
| `<leader>tg`      | Toggle lazygit terminal                     |
| `<leader>ta`      | Toggle all terminal                         |

💡`[]` is a optional.`<leader>tt` takes effect but only open and close the same one.

## TODO
- [ ] all the TODO marks need to be figured out.
- [ ] sumarize all the daily use keybindings.

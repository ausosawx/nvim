# README

![](https://img.shields.io/badge/neovim-0.9-green?style=plastic&logo=Neovim)

## Announcement

- The repo is forked from [folke/dot](https://github.com/folke/dot/tree/master/nvim)
- I make some changes to satisfy my own needs

## Requirements

- **neovim >= 0.9.0**

```bash
paru -S neovim-git(from archlinuxcn)
```

- **dependencies**

```bash
-- for much use
paru -S nodejs npm

-- python
paru -S python-pynvim

-- lazygit
paru -S lazygit

-- patched font
paru -S nerd-fonts-source-code-pro

-- for nvim-spectre to search and replace
paru -S ripgrep fd

-- for clipboard
paru -S wl-clipboard(wayland)
paru -S xsel(X11)

-- for shell formatter
paru -S go
```

- **checkhealth**

`:checkhealth` to recheck

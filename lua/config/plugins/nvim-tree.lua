local M = {
    "kyazdani42/nvim-tree.lua",
    event = "VeryLazy",
}

function M.config()
    require("nvim-tree").setup({
        hijack_cursor = true,
        sync_root_with_cwd = false,
        reload_on_bufenter = true,
        update_focused_file = {
            enable = true,
            update_root = true,
        },
        view = {
            side = "left",
            width = 30,
            hide_root_folder = false,
            signcolumn = "yes",
            mappings = {
                list = {
                    { key = "?", action = "toggle_help" },
                },
            },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        actions = {
            use_system_clipboard = true,
            -- Change the working directory when only changing directories in the tree
            change_dir = {
                enable = false,
                global = false,
                restrict_above_cwd = false,
            },
            open_file = {
                resize_window = true,
                window_picker = {
                    enable = true,
                },
            },
        },
        filters = {
            dotfiles = false,
            custom = { "node_modules", "\\.cache", "__pycache__" },
            exclude = {},
        },
        renderer = {
            add_trailing = false,
            highlight_git = true,
            highlight_opened_files = "icon",
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    git = {
                        unstaged = "",
                        staged = "",
                        unmerged = "",
                        renamed = "凜",
                        untracked = "",
                        deleted = "",
                        ignored = "",
                    },
                    folder = {
                        arrow_open = "",
                        arrow_closed = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                },
            },
        },
    })
end

return M

local M = {
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "VeryLazy",
}

function M.config()
    --Show symbols in winbar
    local function get_file_name(include_path)
        local file_name = require("lspsaga.symbolwinbar").get_file_name({})
        if vim.fn.bufname("%") == "" then
            return ""
        end
        if include_path == false then
            return file_name
        end
        -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
        local sep = vim.loop.os_uname().sysname == "Windows" and "\\" or "/"
        local path_list = vim.split(string.gsub(vim.fn.expand("%:~:.:h"), "%%", ""), sep)
        local file_path = ""
        for _, cur in ipairs(path_list) do
            file_path = (cur == "." or cur == "~") and ""
                or file_path .. cur .. " " .. "%#LspSagaWinbarSep#>%*" .. " %*"
        end
        return file_path .. file_name
    end

    local function config_winbar_or_statusline()
        local exclude = {
            ["teminal"] = true,
            ["toggleterm"] = true,
            ["prompt"] = true,
            ["NvimTree"] = true,
            ["help"] = true,
        } -- Ignore float windows and exclude filetype
        if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
            vim.wo.winbar = ""
        else
            local ok, lspsaga = pcall(require, "lspsaga.symbolwinbar")
            local sym
            if ok then
                sym = lspsaga.get_symbol_node()
            end
            local win_val = ""
            win_val = get_file_name(true) -- set to true to include path
            if sym ~= nil then
                win_val = win_val .. sym
            end
            vim.wo.winbar = win_val
        end
    end

    local events = { "BufEnter", "BufWinEnter", "CursorMoved" }

    vim.api.nvim_create_autocmd(events, {
        pattern = "*",
        callback = function()
            config_winbar_or_statusline()
        end,
    })

    vim.api.nvim_create_autocmd("User", {
        pattern = "LspsagaUpdateSymbol",
        callback = function()
            config_winbar_or_statusline()
        end,
    })

    local function set_sidebar_icons()
        -- Set icons for sidebar.
        local diagnostic_icons = {
            Error = " ",
            Warn = " ",
            Info = " ",
            Hint = " ",
        }
        for type, icon in pairs(diagnostic_icons) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl })
        end
    end

    local function get_palette()
        if vim.g.colors_name == "catppuccin" then
            -- If the colorscheme is catppuccin then use the palette.
            return require("catppuccin.palettes").get_palette()
        else
            -- Default behavior: return lspsaga's default palette.
            local palette = require("lspsaga.lspkind").colors
            palette.peach = palette.orange
            palette.flamingo = palette.orange
            palette.rosewater = palette.yellow
            palette.mauve = palette.violet
            palette.sapphire = palette.blue
            palette.maroon = palette.orange

            return palette
        end
    end

    set_sidebar_icons()

    local colors = get_palette()

    require("lspsaga").init_lsp_saga({
        diagnostic_header = { " ", " ", "  ", " " },
        custom_kind = {
            File = { " ", colors.rosewater },
            Module = { " ", colors.blue },
            Namespace = { " ", colors.blue },
            Package = { " ", colors.blue },
            Class = { "ﴯ ", colors.yellow },
            Method = { " ", colors.blue },
            Property = { "ﰠ ", colors.teal },
            Field = { " ", colors.teal },
            Constructor = { " ", colors.sapphire },
            Enum = { " ", colors.yellow },
            Interface = { " ", colors.yellow },
            Function = { " ", colors.blue },
            Variable = { " ", colors.peach },
            Constant = { " ", colors.peach },
            String = { " ", colors.green },
            Number = { " ", colors.peach },
            Boolean = { " ", colors.peach },
            Array = { " ", colors.peach },
            Object = { " ", colors.yellow },
            Key = { " ", colors.red },
            Null = { "ﳠ ", colors.yellow },
            EnumMember = { " ", colors.teal },
            Struct = { " ", colors.yellow },
            Event = { " ", colors.yellow },
            Operator = { " ", colors.sky },
            TypeParameter = { " ", colors.maroon },
            -- ccls-specific icons.
            TypeAlias = { " ", colors.green },
            Parameter = { " ", colors.blue },
            StaticMethod = { "ﴂ ", colors.peach },
            Macro = { " ", colors.red },
        },
        symbol_in_winbar = {
            in_custom = true,
            enable = true,
        },
    })
end

return M

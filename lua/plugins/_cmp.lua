local M = {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "lukas-reineke/cmp-under-comparator",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "f3fora/cmp-spell",
        "hrsh7th/cmp-buffer",
        "kdheepak/cmp-latex-symbols",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
    },
}

function M.config()
    local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local border = function(hl)
        return {
            { "╭", hl },
            { "─", hl },
            { "╮", hl },
            { "│", hl },
            { "╯", hl },
            { "─", hl },
            { "╰", hl },
            { "│", hl },
        }
    end

    local cmp = require("cmp")
    local compare = require("cmp.config.compare")
    local luasnip_ok, luasnip = pcall(require, "luasnip")
    if not luasnip_ok then
        vim.notify("LuaSnip not ok for cmp", "ERROR", { title = "cmp.lua" })
    end

    -- Insert `(` after select function or method item
    -- require nvim-autopairs
    local pairs_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
    if not pairs_ok then
        vim.notify("Autopairs not ok for cmp", "ERROR", { title = "cmp.lua" })
    end
    local handlers = require("nvim-autopairs.completion.handlers")
    if pairs_ok then
        cmp.event:on(
            "confirm_done",
            cmp_autopairs.on_confirm_done({
                filetypes = {
                    -- "*" is an alias to all filetypes
                    ["*"] = {
                        ["("] = {
                            kind = {
                                cmp.lsp.CompletionItemKind.Function,
                                cmp.lsp.CompletionItemKind.Method,
                            },
                            handler = handlers["*"],
                        },
                    },
                    -- Disable for tex
                    tex = false,
                },
            })
        )
    end

    cmp.setup({
        window = {
            completion = {
                border = border("CmpBorder"),
                winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
            },
            documentation = {
                border = border("CmpDocBorder"),
            },
        },
        sorting = {
            comparators = {
                compare.offset,
                compare.exact,
                compare.score,
                require("cmp-under-comparator").under,
                compare.kind,
                compare.sort_text,
                compare.length,
                compare.order,
            },
        },
        formatting = {
            format = function(entry, vim_item)
                local lspkind_icons = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "",
                    Variable = "",
                    Class = "ﴯ",
                    Interface = "",
                    Module = "",
                    Property = "ﰠ",
                    Unit = "",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                }
                -- load lspkind icons
                vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)

                vim_item.menu = ({
                    buffer = "[BUF]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[LUA]",
                    path = "[PATH]",
                    luasnip = "[LUASNIP]",
                    spell = "[SPELL]",
                    latex_symbols = "[LATEX]",
                })[entry.source.name]

                return vim_item
            end,
        },
        -- You can set mappings if you want
        mapping = {
            ["<cr>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "s" }),
            ["<c-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
            ["<c-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
            ["<c-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "s", "c" }),
            ["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s", "c" }),
            ["<c-k>"] = cmp.mapping(cmp.mapping.close(), { "i", "s", "c" }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip_ok and luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s", "c" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip_ok and luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s", "c" }),
        },
        snippet = {
            expand = function(args)
                if luasnip_ok then
                    require("luasnip").lsp_expand(args.body)
                end
            end,
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "luasnip" },
            { name = "path" },
            { name = "spell" },
            { name = "orgmode" },
            { name = "buffer" },
            { name = "latex_symbols" },
        }),
    })

    -- define completion in cmd mode
    cmp.setup.cmdline({ "/", "?" }, {
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
            { name = "path" },
            { name = "cmdline" },
        }),
    })
end

return M

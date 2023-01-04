local function nvim_load_mapping(key_group)
    for _, key_map in ipairs(key_group) do
        key_map.options.desc = key_map.description
        vim.keymap.set(key_map.mode, key_map.lhs, key_map.rhs, key_map.options)
    end
end

local plugin_map = {}

plugin_map = {
    -- vim-notify
    {
        mode = { "n" },
        lhs = "<leader>fn",
        rhs = ":Notifications<cr>",
        options = { silent = true },
        description = "Find notices history",
    },

    -- nvim-dap-ui
    {
        mode = { "n" },
        lhs = "<leader>du",
        rhs = function()
            require("dapui").toggle()
        end,
        options = { silent = true },
        description = "Toggle debug ui",
    },
    {
        mode = { "n" },
        lhs = "<leader>de",
        rhs = function()
            require("dapui").eval(vim.fn.input("Enter debug expression: "))
        end,
        options = { silent = true },
        description = "Execute debug expressions",
    },

    -- nvim-dap
    {
        mode = { "n" },
        lhs = "<leader>db",
        rhs = function()
            require("dap").toggle_breakpoint()
        end,
        options = { silent = true },
        description = "Mark or delete breakpoints",
    },
    {
        mode = { "n" },
        lhs = "<leader>dc",
        rhs = function()
            require("dap").clear_breakpoints()
        end,
        options = { silent = true },
        description = "Clear breakpoints in the current buffer",
    },
    {
        mode = { "n" },
        lhs = "<F5>",
        rhs = function()
            require("dap").continue()
        end,
        options = { silent = true },
        description = "Enable debugging or jump to the next breakpoint",
    },
    {
        mode = { "n" },
        lhs = "<F6>",
        rhs = function()
            require("dap").step_into()
        end,
        options = { silent = true },
        description = "Step into",
    },
    {
        mode = { "n" },
        lhs = "<F7>",
        rhs = function()
            require("dap").step_over()
        end,
        options = { silent = true },
        description = "Step over",
    },
    {
        mode = { "n" },
        lhs = "<F8>",
        rhs = function()
            require("dap").step_out()
        end,
        options = { silent = true },
        description = "Step out",
    },
    {
        mode = { "n" },
        lhs = "<F9>",
        rhs = function()
            require("dap").run_last()
        end,
        options = { silent = true },
        description = "Rerun debug",
    },
    {
        mode = { "n" },
        lhs = "<F10>",
        rhs = function()
            require("dap").terminate()
        end,
        options = { silent = true },
        description = "Close debug",
    },

    -- hop
    {
        mode = { "n", "v" },
        lhs = "ss",
        rhs = "<cmd>HopWord<cr>",
        options = { silent = true },
        description = "Jump to word head",
    },
    {
        mode = { "n", "v" },
        lhs = "sl",
        rhs = "<cmd>HopLine<cr>",
        options = { silent = true },
        description = "Jump to line",
    },
    {
        mode = { "n", "v" },
        lhs = "sf",
        rhs = "<cmd>HopChar1<cr>",
        options = { silent = true },
        description = "Jump to search char on buffer",
    },
    {
        mode = { "n", "v" },
        lhs = "sc",
        rhs = "<cmd>HopChar1CurrentLine<cr>",
        options = { silent = true },
        description = "Jump to search char on current line",
    },

    -- nvim-hlslens
    {
        mode = { "n" },
        lhs = "n",
        rhs = function()
            vim.cmd("normal! " .. vim.v.count1 .. "n")
            require("hlslens").start()
        end,
        options = { silent = true },
        description = "Skip to next search result",
    },
    {
        mode = { "n" },
        lhs = "N",
        rhs = function()
            vim.cmd("normal! " .. vim.v.count1 .. "n")
            require("hlslens").start()
        end,
        options = { silent = true },
        description = "Jump to previous search result",
    },
    {
        mode = { "n" },
        lhs = "*",
        rhs = function()
            vim.cmd("normal! " .. vim.v.count1 .. "n")
            require("hlslens").start()
        end,
        options = { silent = true },
        description = "Jump to the next word at the current cursor",
    },
    {
        mode = { "n" },
        lhs = "#",
        rhs = function()
            vim.cmd("normal! " .. vim.v.count1 .. "n")
            require("hlslens").start()
        end,
        options = { silent = true },
        description = "Jump to the prev word at the current cursor",
    },
    {
        mode = { "n" },
        lhs = "g*",
        rhs = function()
            vim.cmd("normal! " .. vim.v.count1 .. "n")
            require("hlslens").start()
        end,
        options = { silent = true },
        description = "Jump to the next word at the current cursor (forbidden range)",
    },
    {
        mode = { "n" },
        lhs = "g#",
        rhs = function()
            vim.cmd("normal! " .. vim.v.count1 .. "n")
            require("hlslens").start()
        end,
        options = { silent = true },
        description = "Jump to the prev word at the current cursor (forbidden range)",
    },

    -- yanky
    {
        mode = { "n" },
        lhs = "<leader>fy",
        rhs = ":Telescope yank_history<cr>",
        options = { silent = true },
        description = "Find Clipboard History",
    },
    {
        mode = { "n" },
        lhs = "<leader>cy",
        rhs = ":YankyClearHistory<cr>",
        options = { silent = true },
        description = "Clear Clipboard History",
    },

    -- telescope
    {
        mode = { "n" },
        lhs = "<leader>ff",
        rhs = function()
            require("telescope.builtin").find_files()
        end,
        options = { silent = true },
        description = "Find files in the current workspace",
    },
    {
        mode = { "n" },
        lhs = "<leader>fg",
        rhs = function()
            require("telescope.builtin").live_grep()
        end,
        options = { silent = true },
        description = "Find string in the current workspace",
    },
    {
        mode = { "n" },
        lhs = "<leader>fo",
        rhs = function()
            require("telescope.builtin").oldfiles()
        end,
        options = { silent = true },
        description = "Find telescope history",
    },
    {
        mode = { "n" },
        lhs = "<leader>fh",
        rhs = function()
            require("telescope.builtin").resume()
        end,
        options = { silent = true },
        description = "Find last lookup",
    },
    {
        mode = { "n" },
        lhs = "<leader>ft",
        rhs = function()
            require("telescope.builtin").help_tags()
        end,
        options = { silent = true },
        description = "Find all help document tags",
    },
    {
        mode = { "n" },
        lhs = "<leader>fm",
        rhs = function()
            require("telescope.builtin").marks()
        end,
        options = { silent = true },
        description = "Find marks in the current workspace",
    },
    {
        mode = { "n" },
        lhs = "<leader>fi",
        rhs = function()
            require("telescope.builtin").highlights()
        end,
        options = { silent = true },
        description = "Find all neovim highlights",
    },
    {
        mode = { "n" },
        lhs = "<leader>fb",
        rhs = function()
            require("telescope.builtin").buffers()
        end,
        options = { silent = true },
        description = "Find all buffers",
    },
    {
        mode = { "n" },
        lhs = "<leader>f/",
        rhs = function()
            require("telescope.builtin").search_history()
        end,
        options = { silent = true },
        description = "Find all search history",
    },
    {
        mode = { "n" },
        lhs = "<leader>f:",
        rhs = function()
            require("telescope.builtin").command_history()
        end,
        options = { silent = true },
        description = "Find all command history",
    },
    {
        mode = { "n" },
        lhs = "<leader>fs",
        rhs = function()
            require("telescope.builtin").colorscheme()
        end,
        options = { silent = true },
        description = "list all colorschems",
    },

    -- todo-comments
    {
        mode = { "n" },
        lhs = "<leader>fd",
        rhs = function()
            require("telescope").extensions["todo-comments"].todo()
        end,
        options = { silent = true },
        description = "Find todo tag in the current workspace",
    },

    -- aerial
    {
        mode = { "n" },
        lhs = "<leader>2",
        rhs = "<cmd>AerialToggle<cr>",
        options = { silent = true },
        description = "Open Outilne Explorer",
    },
    {
        mode = { "n" },
        lhs = "[[",
        rhs = function()
            require("aerial").prev_up()
        end,
        options = { silent = true },
        description = "Move up one level",
    },
    {
        mode = { "n" },
        lhs = "]]",
        rhs = function()
            require("aerial").next_up()
        end,
        options = { silent = true },
        description = "Move down one level",
    },

    -- lspsaga
    {
        mode = { "n" },
        lhs = "<leader>ca",
        rhs = "<cmd>Lspsaga code_action<cr>",
        options = { silent = true },
        description = "Show code action",
    },
    {
        mode = { "n" },
        lhs = "<leader>cn",
        rhs = "<cmd>Lspsaga rename<cr>",
        options = { silent = true },
        description = "Variable renaming",
    },
    {
        mode = { "n" },
        lhs = "gh",
        rhs = "<cmd>Lspsaga hover_doc<cr>",
        options = { silent = true },
        description = "Show help information",
    },
    {
        mode = { "n" },
        lhs = "[g",
        rhs = "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        options = { silent = true },
        description = "Jump to prev diagnostic",
    },
    {
        mode = { "n" },
        lhs = "]g",
        rhs = "<cmd>Lspsaga diagnostic_jump_next<cr>",
        options = { silent = true },
        description = "Jump to next diagnostic",
    },
    {
        mode = { "n" },
        lhs = "[e",
        rhs = function()
            require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
        options = { silent = true },
        description = "Only jump to prev error",
    },
    {
        mode = { "n" },
        lhs = "]e",
        rhs = function()
            require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
        options = { silent = true },
        description = "Only jump to next error",
    },
    {
        mode = { "n" },
        lhs = "<leader>3",
        rhs = "<cmd>Lspsaga outline<CR>",
        options = { silent = true },
        description = "Open outline",
    },
    {
        mode = { "n" },
        lhs = "gl",
        rhs = "<cmd>Lspsaga show_line_diagnostics<cr>",
        options = { silent = true },
        description = "Show line diagnostics",
    },
    {
        mode = { "n" },
        lhs = "go",
        rhs = "<cmd>Lspsaga show_cursor_diagnostics<cr>",
        options = { silent = true },
        description = "Show cursor diagnostics",
    },
    {
        mode = { "n" },
        lhs = "gd",
        rhs = "<cmd>Lspsaga peek_definition<cr>",
        options = { silent = true },
        description = "Go to definitions",
    },
    {
        mode = { "n" },
        lhs = "gq",
        rhs = "<cmd>Lspsaga lsp_finder<cr>",
        options = { silent = true },
        description = "find the symbol definition implement reference",
    },

    -- nvim-lspconfig
    {
        mode = { "n" },
        lhs = "<leader>cf",
        rhs = vim.lsp.buf.format,
        options = { silent = true },
        description = "Format buffer",
    },
    {
        mode = { "n" },
        lhs = "gs",
        rhs = function()
            require("telescope.builtin").lsp_document_symbols()
        end,
        options = { silent = true },
        description = "Find all document symbols",
    },
    {
        mode = { "n" },
        lhs = "gr",
        rhs = function()
            require("telescope.builtin").lsp_references()
        end,
        options = { silent = true },
        description = "Go to references",
    },
    {
        mode = { "n" },
        lhs = "gi",
        rhs = function()
            require("telescope.builtin").lsp_implementations()
        end,
        options = { silent = true },
        description = "Go to implementations",
    },
    {
        mode = { "n" },
        lhs = "gD",
        rhs = function()
            require("telescope.builtin").lsp_type_definitions()
        end,
        options = { silent = true },
        description = "Go to type definitions",
    },
    {
        mode = { "n" },
        lhs = "gO",
        rhs = function()
            require("telescope.builtin").diagnostics()
        end,
        options = { silent = true },
        description = "Show Workspace Diagnostics",
    },

    -- neogen
    {
        mode = { "n" },
        lhs = "<leader>n",
        rhs = function()
            vim.ui.select({ "func", "file", "class", "type" }, _, function(choice)
                require("neogen").generate({ type = choice })
            end)
        end,
        options = { silent = true },
        description = "Create annotations",
    },

    -- LuaSnip
    {
        mode = { "n" },
        lhs = "<leader>se",
        rhs = "<cmd>LuaSnipEdit<cr>",
        options = { silent = true },
        description = "Edit User Snippets",
    },

    -- gitsigns
    {
        mode = { "n" },
        lhs = "<leader>gl",
        rhs = "<cmd>Gitsigns toggle_current_line_blame<cr>",
        options = { silent = true },
        description = "Toggle current line blame",
    },
    {
        mode = { "n" },
        lhs = "<leader>gh",
        rhs = "<cmd>lua require'gitsigns'.preview_hunk()<cr>",
        options = { silent = true },
        description = "Preview current hunk",
    },
    {
        mode = { "n" },
        lhs = "<leader>gH",
        rhs = "<cmd>lua require'gitsigns'.blame_line{full=true}<cr>",
        options = { silent = true },
        description = "Show current block blame",
    },
    {
        mode = { "n" },
        lhs = "<leader>gd",
        rhs = "<cmd>Gitsigns diffthis<cr>",
        options = { silent = true },
        description = "Open deff view",
    },
    {
        mode = { "n" },
        lhs = "<leader>gD",
        rhs = "<cmd>Gitsigns toggle_deleted<cr>",
        options = { silent = true },
        description = "Show deleted lines",
    },
    {
        mode = { "n", "v" },
        lhs = "<leader>gr",
        rhs = "<cmd>Gitsigns reset_hunk<cr>",
        options = { silent = true },
        description = "Reset current hunk",
    },
    {
        mode = { "n" },
        lhs = "<leader>gR",
        rhs = "<cmd>Gitsigns reset_buffer<cr>",
        options = { silent = true },
        description = "Reset current buffer",
    },
    {
        mode = { "n" },
        lhs = "[c",
        rhs = function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(function()
                require("gitsigns").prev_hunk()
            end)
            return "<Ignore>"
        end,
        options = { silent = true, expr = true },
        description = "Jump to the prev hunk",
    },
    {
        mode = { "n" },
        lhs = "]c",
        rhs = function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(function()
                require("gitsigns").next_hunk()
            end)
            return "<Ignore>"
        end,
        options = { silent = true, expr = true },
        description = "Jump to the next hunk",
    },

    -- bufferline
    {
        mode = { "n" },
        lhs = "<c-q>",
        rhs = "<cmd>bdelete!<cr>",
        options = { silent = true },
        description = "Close current buffer",
    },
    {
        mode = { "n" },
        lhs = "<leader>h",
        rhs = "<cmd>BufferLineCyclePrev<cr>",
        options = { silent = true },
        description = "Go to left buffer",
    },
    {
        mode = { "n" },
        lhs = "<leader>l",
        rhs = "<cmd>BufferLineCycleNext<cr>",
        options = { silent = true },
        description = "Go to right buffer",
    },
    {
        mode = { "n" },
        lhs = "<c-e>",
        rhs = "<cmd>BufferLineMovePrev<cr>",
        options = { silent = true },
        description = "Move current buffer to left",
    },
    {
        mode = { "n" },
        lhs = "<c-y>",
        rhs = "<cmd>BufferLineMoveNext<cr>",
        options = { silent = true },
        description = "Move current buffer to right",
    },
    {
        mode = { "n" },
        lhs = "<leader>bn",
        rhs = "<cmd>enew<cr>",
        options = { silent = true },
        description = "Create new buffer",
    },
    {
        mode = { "n" },
        lhs = "<leader>bl",
        rhs = "<cmd>BufferLineCloseLeft<cr>",
        options = { silent = true },
        description = "Close all left buffers",
    },
    {
        mode = { "n" },
        lhs = "<leader>br",
        rhs = "<cmd>BufferLineCloseRight<cr>",
        options = { silent = true },
        description = "Close all right buffers",
    },
    {
        mode = { "n" },
        lhs = "<leader>bo",
        rhs = function()
            vim.cmd("BufferLineCloseLeft")
            vim.cmd("BufferLineCloseRight")
        end,
        options = { silent = true },
        description = "Close all other buffers",
    },
    {
        mode = { "n" },
        lhs = "<leader>ba",
        rhs = function()
            vim.cmd("BufferLineCloseLeft")
            vim.cmd("BufferLineCloseRight")
            vim.cmd("bdelete!")
        end,
        options = { silent = true },
        description = "Close all buffers",
    },
    {
        mode = { "n" },
        lhs = "<leader>bt",
        rhs = "<cmd>BufferLinePick<cr>",
        options = { silent = true },
        description = "Go to buffer *",
    },
    {
        mode = { "n" },
        lhs = "<leader>bs",
        rhs = "<cmd>BufferLineSortByExtension<cr>",
        options = { silent = true },
        description = "Buffers sort (by extension)",
    },
    {
        mode = { "n" },
        lhs = "<leader>b1",
        rhs = "<cmd>BufferLineGoToBuffer 1<cr>",
        options = { silent = true },
        description = "Go to buffer 1",
    },
    {
        mode = { "n" },
        lhs = "<leader>b2",
        rhs = "<cmd>BufferLineGoToBuffer 2<cr>",
        options = { silent = true },
        description = "Go to buffer 2",
    },
    {
        mode = { "n" },
        lhs = "<leader>b3",
        rhs = "<cmd>BufferLineGoToBuffer 3<cr>",
        options = { silent = true },
        description = "Go to buffer 3",
    },
    {
        mode = { "n" },
        lhs = "<leader>b4",
        rhs = "<cmd>BufferLineGoToBuffer 4<cr>",
        options = { silent = true },
        description = "Go to buffer 4",
    },
    {
        mode = { "n" },
        lhs = "<leader>b5",
        rhs = "<cmd>BufferLineGoToBuffer 5<cr>",
        options = { silent = true },
        description = "Go to buffer 5",
    },
    {
        mode = { "n" },
        lhs = "<leader>b6",
        rhs = "<cmd>BufferLineGoToBuffer 6<cr>",
        options = { silent = true },
        description = "Go to buffer 6",
    },
    {
        mode = { "n" },
        lhs = "<leader>b7",
        rhs = "<cmd>BufferLineGoToBuffer 7<cr>",
        options = { silent = true },
        description = "Go to buffer 7",
    },
    {
        mode = { "n" },
        lhs = "<leader>b8",
        rhs = "<cmd>BufferLineGoToBuffer 8<cr>",
        options = { silent = true },
        description = "Go to buffer 8",
    },
    {
        mode = { "n" },
        lhs = "<leader>b9",
        rhs = "<cmd>BufferLineGoToBuffer 9<cr>",
        options = { silent = true },
        description = "Go to buffer 9",
    },

    -- nvim-spectre
    {
        mode = { "n" },
        lhs = "<leader>rp",
        rhs = function()
            require("spectre").open()
        end,
        options = { silent = true },
        description = "Replace characters in all files in the current workspace",
    },
    {
        mode = { "n" },
        lhs = "<leader>rf",
        rhs = function()
            require("spectre").open_file_search()
        end,
        options = { silent = true },
        description = "Replace all characters in the current file",
    },
    {
        mode = { "n" },
        lhs = "<leader>rwf",
        rhs = function()
            require("spectre").open_visual({
                select_word = true,
                path = vim.fn.fnameescape(vim.fn.expand("%:p:.")),
            })
        end,
        options = { silent = true },
        description = "Replace the character under the cursor in the current file",
    },
    {
        mode = { "n" },
        lhs = "<leader>rwp",
        rhs = function()
            require("spectre").open_visual({ select_word = true })
        end,
        options = { silent = true },
        description = "Replace the character under the cursor in all files under the current workspace",
    },

    -- nvim-tree
    {
        mode = { "n" },
        lhs = "<leader>1",
        rhs = function()
            vim.cmd("NvimTreeToggle")
        end,
        options = { silent = true },
        description = "Open File Explorer",
    },
    {
        mode = { "n" },
        lhs = "<leader>fc",
        rhs = function()
            vim.cmd("NvimTreeFindFile")
        end,
        options = { silent = true },
        description = "Find the current file and open it in file explorer",
    },

    -- toggleterm
    {
        mode = { "n" },
        lhs = "<leader>tt",
        rhs = ":ToggleTerm<cr>",
        options = { silent = true },
        description = "Toggle bottom or vertical terminal",
    },
    {
        mode = { "n" },
        lhs = "<leader>tv",
        rhs = ":ToggleTerm direction=vertical<cr>",
        options = { silent = true },
        description = "Toggle vertical terminal",
    },
    {
        mode = { "n" },
        lhs = "<leader>tf",
        rhs = ":ToggleTerm direction=float<cr>",
        options = { silent = true },
        description = "Toggle float terminal",
    },
    {
        mode = { "n" },
        lhs = "<leader>tg",
        rhs = ":lua toggle_lazygit()<cr>",
        options = { silent = true },
        description = "Toggle lazygit",
    },
    {
        mode = { "n" },
        lhs = "<leader>ta",
        rhs = ":ToggleTermToggleAll<cr>",
        options = { silent = true },
        description = "Toggle all terminal",
    },

    -- lazy.nvim
    {
        mode = { "n" },
        lhs = "<leader>ph",
        rhs = ":Lazy home<cr>",
        options = { silent = true },
        description = "Lazy home",
    },
    {
        mode = { "n" },
        lhs = "<leader>ps",
        rhs = ":Lazy sync<cr>",
        options = { silent = true },
        description = "Plugins sync",
    },
    {
        mode = { "n" },
        lhs = "<leader>pc",
        rhs = ":Lazy clean<cr>",
        options = { silent = true },
        description = "Plugins clean",
    },
    {
        mode = { "n" },
        lhs = "<leader>pC",
        rhs = ":Lazy clear<cr>",
        options = { silent = true },
        description = "Cache clean",
    },
    {
        mode = { "n" },
        lhs = "<leader>pu",
        rhs = ":Lazy update<cr>",
        options = { silent = true },
        description = "Plugins update",
    },

    -- neovim-tasks
    {
        mode = { "n" },
        lhs = "<leader>cc",
        rhs = ":Task start cmake configure<cr>",
        options = { silent = true },
        description = "cmake configure",
    },
    {
        mode = { "n" },
        lhs = "<leader>ct",
        rhs = ":Task set_module_param cmake target<cr>",
        options = { silent = true },
        description = "select target",
    },
    {
        mode = { "n" },
        lhs = "<leader>cr",
        rhs = ":Task start cmake run<cr>",
        options = { silent = true },
        description = "cmake run",
    },
    {
        mode = { "n" },
        lhs = "<leader>cd",
        rhs = ":Task start cmake debug<cr>",
        options = { silent = true },
        description = "nvim-dap debug",
    },
}

nvim_load_mapping(plugin_map)

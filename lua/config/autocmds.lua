-- This file is automatically loaded by config.init()
-- Triggered in plugins.colorscheme.lua

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

-- create directories when needed, when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match

    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    local backup = vim.fn.fnamemodify(file, ":p:~:h")
    backup = backup:gsub("[/\\]", "%%")
    vim.go.backupext = backup
  end,
})

-- Fix conceallevel for json & help files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- Autosave
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    vim.cmd("silent! write")
  end,
  nested = true,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("ColorChange", { clear = true }),
  callback = function()
    vim.cmd([[hi clear BufferLineWarning]])
    vim.cmd([[hi clear BufferLineWarningSelected]])
    vim.cmd([[hi clear BufferLineWarningVisible]])
    vim.cmd([[hi clear BufferLineWarningDiagnostic]])
    vim.cmd([[hi clear BufferLineWarningDiagnosticSelected]])
    vim.cmd([[hi clear BufferLineWarningDiagnosticVisible]])
    local opt = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    }

    if vim.g.colors_name == "catppuccin" then
      local cp = require("catppuccin.palettes").get_palette()
      cp.none = "NONE"

      local catppuccin_hl_overwrite = {
        highlights = require("catppuccin.groups.integrations.bufferline").get({
          styles = { "italic", "bold" },
          custom = {
            mocha = {
              -- Warnings
              warning = { fg = cp.sky },
              warning_visible = { fg = cp.sky },
              warning_selected = { fg = cp.sky },
              warning_diagnostic = { fg = cp.sky },
              warning_diagnostic_visible = { fg = cp.sky },
              warning_diagnostic_selected = { fg = cp.sky },
              -- Infos
              info = { fg = cp.yellow },
              info_visible = { fg = cp.yellow },
              info_selected = { fg = cp.yellow },
              info_diagnostic = { fg = cp.yellow },
              info_diagnostic_visible = { fg = cp.yellow },
              info_diagnostic_selected = { fg = cp.yellow },
              -- Hint
              hint = { fg = cp.rosewater },
              hint_visible = { fg = cp.rosewater },
              hint_selected = { fg = cp.rosewater },
              hint_diagnostic = { fg = cp.rosewater },
              hint_diagnostic_visible = { fg = cp.rosewater },
              hint_diagnostic_selected = { fg = cp.rosewater },
            },
          },
        }),
      }

      local opts = vim.tbl_deep_extend("force", opt, catppuccin_hl_overwrite)

      require("bufferline").setup(opts)
    end
  end,
})

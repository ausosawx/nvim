require("cmp").setup.buffer({
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, item)
      -- limit the max width of windows
      local ELLIPSIS_CHAR = "…"
      local MAX_LABEL_WIDTH = 30
      local content = item.abbr
      if #content > MAX_LABEL_WIDTH then
        item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
      end
      -- Kind icons
      local icons = require("config").icons.kinds
      if icons[item.kind] then
        item.kind = icons[item.kind]
      end
      -- Source
      item.menu = ({
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        path = "[PATH]",
        codeium = "[AI]",
        omni = (vim.inspect(item.menu):gsub('%"', "")),
      })[entry.source.name]
      return item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "codeium" },
    { name = "omni" },
  },
})

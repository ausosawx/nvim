local M = {}
M.default = "winter"
M.ns = vim.api.nvim_create_namespace("dashboard")

function M.get_theme(name)
  name = name or M.default
  local ret = {
    name = name,
    statusline = M.statusline[name],
  }
  return ret
end

M.statusline = {
  halloween = "🧛👻👺🧟🎃",
  summer = "🌴🌊",
  winter = "🏂❄️ ⛷️",
  xmas = "🎅🎄🌟🎁",
}

return M

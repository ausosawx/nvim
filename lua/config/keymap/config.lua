local _lazygit = nil
_G.toggle_lazygit = function()
    if not _lazygit then
        local Terminal = require("toggleterm.terminal").Terminal
        _lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            float_opts = {
                border = "rounded",
            },
        })
    end
    _lazygit:toggle()
end

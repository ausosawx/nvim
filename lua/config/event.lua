-- fcitx change
-- check fcitx-remote (fcitx5-remote)
local fcitx_cmd = ""
if vim.fn.executable("fcitx-remote") == 1 then
    fcitx_cmd = "fcitx-remote"
elseif vim.fn.executable("fcitx5-remote") == 1 then
    fcitx_cmd = "fcitx5-remote"
end

local os_name = vim.loop.os_uname().sysname
if
    (os_name == "Linux" or os_name == "Unix")
    and os.getenv("DISPLAY") == nil
    and os.getenv("WAYLAND_DISPLAY") == nil
then
    vim.notify("fcitx sets wrong", "ERROR", { title = "event.lua" })
end

function _Fcitx2en()
    local input_status = tonumber(vim.fn.system(fcitx_cmd))
    if input_status == 2 then
        -- input_toggle_flag means whether to restore the state of fcitx
        vim.b.input_toggle_flag = true
        -- switch to English input
        vim.fn.system(fcitx_cmd .. " -c")
    end
end

function _Fcitx2NonLatin()
    if vim.b.input_toggle_flag == nil then
        vim.b.input_toggle_flag = false
    elseif vim.b.input_toggle_flag == true then
        -- switch to Non-Latin input
        vim.fn.system(fcitx_cmd .. " -o")
        vim.b.input_toggle_flag = false
    end
end

vim.cmd([[
  augroup fcitx
    au InsertEnter * :lua _Fcitx2NonLatin()
    au InsertLeave * :lua _Fcitx2en()
    au CmdlineEnter [/\?] :lua _Fcitx2NonLatin()
    au CmdlineLeave [/\?] :lua _Fcitx2en()
  augroup END
]])

-- Remove auto-comments
-- More about 'c,r,o' see `:h fo-table`
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = "*",
    callback = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "<buffer>",
            once = true,
            callback = function()
                vim.cmd(
                    [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
                )
            end,
        })
    end,
})

-- Auto save buffer
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = { "*" },
    command = "silent! wall",
    nested = true,
})

-- Auto change cwd to the main Project path when filetype belongs to {'c', 'cpp','cmake'}
-- It is for neovim-tasks to find the main CMakeLists.txt
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        local ft = { "cpp", "c", "cmake" }
        local file = vim.fn.findfile("tags", ".;")
        local function isempty(s)
            return s == nil or s == ""
        end

        if vim.tbl_contains(ft, vim.bo.filetype) and not isempty(file) then
            vim.fn.chdir(vim.fn.fnamemodify(file, ":p:h"))
        else
            vim.cmd([[silent! lcd %:p:h]])
        end
    end,
})

-- Compile rules
local switch = {
    ["c"] = function()
        if vim.fn.isdirectory("bin") == 0 then
            vim.fn.mkdir("bin")
        end
        vim.cmd(
            [[TermExec cmd="clang -std=c17 -lm -Wall -Wextra -Werror -Wpedantic -pedantic -g % -o bin/%< && time ./bin/%<" direction=vertical]]
        )
    end,
    ["cpp"] = function()
        if vim.fn.isdirectory("bin") == 0 then
            vim.fn.mkdir("bin")
        end

        vim.cmd(
            [[TermExec cmd="clang++ -std=c++20 -stdlib=libc++ -Werror -Weverything -Wno-disabled-macro-expansion -Wno-float-equal -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-global-constructors -Wno-exit-time-destructors -Wno-missing-prototypes -Wno-padded -Wno-old-style-cast -lc++ -lc++abi -g % -o bin/%< && time ./bin/%<" direction=vertical]]
        )
    end,
    ["markdown"] = function()
        vim.cmd([[MarkdownPreview]])
    end,
    ["tex"] = function() end,
    ["sh"] = function()
        vim.cmd([[TermExec cmd="chmod +x % && ./%" direction=vertical]])
    end,
    ["python"] = function()
        -- require("toggleterm").exec_command("cmd='python3 %'", count)
        vim.cmd([[TermExec cmd="python3 %" direction=vertical]])
    end,
    ["lua"] = function()
        vim.cmd([[TermExec cmd="lua %" direction=vertical]])
    end,
    ["java"] = function()
        if vim.fn.isdirectory("build") == 0 then
            vim.fn.mkdir("build")
        end

        vim.cmd([[TermExec cmd="javac % -d build/ && java %" direction=vertical]])
    end,
    ["html"] = function()
        vim.cmd([[!firefox-beta % &]])
    end,
    ["rust"] = function()
        vim.cmd([[TermExec cmd="cargo run" direction=vertical]])
    end,
}

local desktop = vim.api.nvim_exec([[echo $XDG_CURRENT_DESKTOP]], true)

local key = nil
if desktop == "Hyprland" then
    key = "<c-F5>"
elseif desktop == "wayfire" then
    key = "<c-F5>"
else
    vim.notify("undefined desktop", "ERROR", { title = "event.lua" })
end

-- Bind ctrl+F5 to compile according to the rules above
vim.keymap.set("n", key, function()
    local ft = vim.bo.filetype
    if switch[ft] then
        switch[ft]()
    else
        vim.notify("You haven't set the quick_compile rules", "ERROR", { title = "event.lua" })
    end
end, { silent = true, desc = "Compile according to the filetype" })

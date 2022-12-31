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

local count = vim.api.nvim_eval("v:count")

-- Compile rules
local switch = {
    ["c"] = function()
        if vim.fn.isdirectory("bin") == 0 then
            vim.fn.mkdir("bin")
        end

        require("toggleterm").exec_command(
            "cmd='clang -std=c17 -lm -Wall -Wextra -Werror -Wpedantic -pedantic -g % -o bin/%< && time ./bin/%<'",
            count
        )
    end,
    ["cpp"] = function()
        if vim.fn.isdirectory("bin") == 0 then
            vim.fn.mkdir("bin")
        end

        require("toggleterm").exec_command(
            "cmd='clang++ -std=c++20 -stdlib=libc++ -Werror -Weverything -Wno-disabled-macro-expansion -Wno-float-equal -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-global-constructors -Wno-exit-time-destructors -Wno-missing-prototypes -Wno-padded -Wno-old-style-cast -lc++ -lc++abi -g % -o bin/%< && time ./bin/%<'",
            count
        )
    end,
    ["markdown"] = function()
        vim.cmd([[MarkdownPreview]])
    end,
    ["tex"] = function() end,
    ["sh"] = function()
        require("toggleterm").exec_command("cmd='chmod +x % && ./%'", count)
    end,
    ["python"] = function()
        require("toggleterm").exec_command("cmd='python3 %'", count)
    end,
    ["lua"] = function()
        require("toggleterm").exec_command("cmd='lua %'", count)
    end,
    ["java"] = function()
        if vim.fn.isdirectory("build") == 0 then
            vim.fn.mkdir("build")
        end

        require("toggleterm").exec_command("cmd='javac % -d build/ && java %'", count)
    end,
    ["html"] = function()
        vim.cmd([[!firefox-beta % &]])
    end,
}

-- Bind ctrl+F5 to compile according to the rules above
vim.keymap.set("n", "<c-F5>", function()
    local ft = vim.bo.filetype
    if switch[ft] then
        switch[ft]()
    else
        vim.notify("You haven't set the quick_compile rules", "ERROR", { title = "quick_compile" })
    end
end, { silent = true, desc = "Compile according to the filetype" })

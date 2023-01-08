local function load_options()
    local global_local = {
        autochdir = false, -- 自动切换为打开或者选择的文件所在的目录,由于特殊需求此功能在event.lua中特别实现
        clipboard = "unnamedplus", -- 剪贴板同步
        conceallevel = 2, -- 隐藏标记
        completeopt = "menuone,noselect", -- 逗号分隔的选项列表，用于插入模式的补全
        cursorline = true, -- 高亮光标所在的文本行
        expandtab = true, -- 输入Tab字符时,自动替换成空格
        fileencodings = "ucs-bom,utf-8,gbk,big5,gb18030,latin1", -- 字符编码
        filetype = "plugin", -- 执行runtimepath的ftplugin子目录的.lua脚本
        fillchars = "eob: ", -- 缓冲区结束之后的空行为空白而不是默认'~'
        foldcolumn = "0", -- 设定了在窗口的边上表示折叠的栏的宽度
        foldlevel = 100, -- 设置折叠级别(行的缩进除以 'shiftwidth'): 高于此级别的折叠会被关闭
        foldmethod = "indent", -- 相同缩进距离的行构成折叠
        ignorecase = true, -- 搜索模式里忽略大小写
        iskeyword = "@,48-57,_,192-255", -- 指定哪些字母可以出现在一个单词中
        laststatus = 3, -- 多窗口下底部状态栏显示当前窗口状态信息(显示在lualine)
        linebreak = true, -- 在合适的地方折行(由breakat定义的字符决定,默认为 ^I!@*-+_;:,./?)
        list = true, -- 用于看到制表和空格的区别以及拖尾的空白
        mouse = "a", -- 允许使用鼠标(所有五个模式)
        number = true, -- 显示行号
        numberwidth = 2, -- 行号使用的最小列数
        pumheight = 10, -- 决定用于插入模式补全的弹出菜单显示项目的最大数目
        relativenumber = true, -- 显示相对光标的行号
        ruler = false, -- 标尺，在状态行里显示光标的行号和列号(lualine代替)
        scrolloff = 10, -- 光标上下两侧最少保留的屏幕行数,这使你工作时总有一些可见的上下文
        sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,globals,options", -- 每个单词允许保存和恢复某种设置
        shiftwidth = 4, -- 自动缩进时,缩进长度为4
        shortmess = "sI", -- 避免文件信息的所有  hit-enter  提示
        showmode = false, -- 在状态行上显示当前模式的消息(lualine代替)
        signcolumn = "yes:1", -- 显示符号(lsp info,error etc),第一列显示标号
        smartcase = true, -- 如果搜索模式包含大写字符，不使用 'ignorecase' 选项
        smartindent = true, -- 插入新行时智能自动缩进
        softtabstop = -1, -- softtabstop的值为负数,会使用shiftwidth的值,两者保持一致,方便统一缩进
        spell = false, -- 默认不打开拼写检查
        spelllang = "en_us,cjk", -- 为这些语言进行拼写检查
        swapfile = true, -- 缓冲区是否使用交换文件
        termguicolors = true, -- 使用高亮-(guifg|guibg)
        timeoutlen = 500, -- 配合timeout(nvim中默认开启)设置毫秒计的等待键码或者映射的键序列完成的时间
        -- 由于安装了which-key,此选项对于which-key支持的映射无效,等待为+∞，对which-key启动生效
        updatetime = 500, -- 如果过了这么多毫秒数以后还没有任何输入，把交换文件写入磁盘
        whichwrap = "<>[]", -- 使<Left>和<Right>在行首或行尾可以移到前一行或者后一行
        wildignorecase = true,
        wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.ico,*.svg,*.aux,*.bbl,*.blg,*.synctex.gz,*.zip,**/tmp/**,*.DS_Store",
    }

    for name, value in pairs(global_local) do
        vim.opt[name] = value
    end
end

load_options()

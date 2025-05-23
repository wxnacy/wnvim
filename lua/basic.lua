vim.cmd([[

set nocompatible			    "去掉对vi的兼容，让vim运行在完全模式下
syntax on    					"开启语法高亮"
set history=2003                "记录VIM历史操作的条数
set autoread					"文件在vim外修改过自动重新载入
au CursorHold,CursorHoldI * checktime   " 自动加载文件变动"
set magic                       "magic (\m)：除了 $ . * ^ 之外其他元字符都要加反斜杠。nomagic (\M)：除了 $ ^ 之外其他元字符都要加反斜杠。
set title
set nobackup                    "去掉编辑文件时的备份
set novisualbell                "关掉可视化响铃警报
set noerrorbells                "关掉错误警报
set visualbell t_vb=            "关掉警报
set tm=500
set t_Co=256


" filetype
filetype on                     "开启文件类型检测
filetype plugin on              "开启插件的支持
filetype indent on              "开启文件类型相应的缩进规则
set fileformat=unix    			"设置以unix的格式保存文件"

" encoding
set encoding=utf-8              "打开文件时编码格式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1         "vim会根据该设置识别文件编码

" set fileencoding=utf-8        在保存文件时，指定编码
" 新版本废弃
" set termencoding=utf-8          "终端环境告诉vim使用编码
set ffs=unix,dos,mac            "在创建文件或写入时，这三种文件格式分别决定了行末要添加什么特殊字符，而在读入文件时，又分别决定了要从行末移去什么特殊字符。
set formatoptions+=m
set formatoptions+=B

" show
set number						"显示行号"
set ruler						"显示当前光标行号和列
" set nowrap    					"设置不折行"
set wrap    					"设置折行"
set sidescroll=1                "默认设置set sidescroll=0之下，当光标到达屏幕边缘时，将自动扩展显示1/2屏幕的文本。通过使用set sidescroll=1设置，可以实现更加平滑的逐个字符扩展显示。
set showcmd						"在屏幕右下角显示未完成的命令
set showmode					"显示当前vim模式
set showmatch    				"显示匹配的括号"
set matchtime=1					"设置showmatch的效果时间，默认500ms，现在是100ms
set cursorline        			"突出显示当前行"
set cursorcolumn        		"突出显示当前列"
set colorcolumn=80              "设置某一列高亮"


" search
set smartcase					"搜索时，如果输入大写，则严格按照大小写搜索，如果小写，并设置了ignorecase，则忽略大小写
set ignorecase        			"搜索时忽略大小写"
set incsearch					"搜索时及时匹配搜索内容，需要回车确认
set hlsearch        			"高亮搜索项"

" tab
set expandtab                   "将<tab>符号转变为<space>空格
set smarttab					"配合shiftwidth使用，如果设置该值，在行首键入<tab>会填充shiftwidth的数值,其他地方使用tabstop的数值，不设置的话，所有地方都是用shiftwidth数值

" indent
set autoindent                  "换行自动缩进
set smartindent                 "缩进采用c语言风格
set shiftround                  "在一般模式下键入>>整个缩进shiftwidth的长度，<<反向操作,== 可以与上一行对齐，插入模式下C-T和C-D也可以左右启动
set shiftwidth=4                "缩进的空格数
set tabstop=4                   "键入<tab>的步长
set softtabstop=4                " insert mode tab and backspace use 4 spaces

" set mark column color
" hi! link SignColumn   LineNr
" hi! link ShowMarksHLl DiffAdd
" hi! link ShowMarksHLu DiffChange

" status line
" set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2   " Always show the status line - use 2 lines for the status bar


" select & complete
set selection=inclusive         "选择文本事，光标所在位置也会被选中
set selectmode=mouse,key

set scrolloff=5        			"距离顶部和底部5行"
set backspace=2					"任何情况允许使用退格键删除
set mouse=a       				"启用鼠标"

" 代码折叠
set foldlevelstart=99           "默认不折叠"
set foldmethod=indent           "按照缩紧折叠"

" 临时文件路径
" set directory=$HOME/.vim/temp//
" set backupdir=$HOME/.vim/temp//
set directory=/tmp/nvim//            " for swp"
set backupdir=/tmp/nvim//
]])


-- encoding
-- vim.g.encoding = "UTF-8"
-- vim.o.fileencodings='ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1' -- vim会根据该设置识别文件编码
-- vim.o.termencoding="utf-8" -- 终端环境告诉vim使用编码
-- vim.o.fileencoding = 'utf-8'
-- 使用行号
-- vim.wo.number = true
-- vim.o.number = true
-- vim.bo.number = true
-- 执行命令
-- vim.api.nvim_command('new')
--vim.cmd([[
-- let g:multiline_list = [
            -- \ 1,
            -- \ 2,
            -- \ 3,
            -- \ ]

-- echo g:multiline_list
-- ]])
-- -- jk移动时光标下上方保留8行
-- vim.o.scrolloff = 8
-- vim.o.sidescrolloff = 8
-- -- 使用相对行号
-- -- vim.wo.number = true
-- -- vim.wo.relativenumber = true
-- 高亮所在行和列
-- vim.wo.cursorline = true
-- vim.wo.cursorcolumn = true
-- -- 显示左侧图标指示列
-- vim.wo.signcolumn = "yes"
-- -- 右侧参考线，超过表示代码太长了，考虑换行
-- vim.wo.colorcolumn = "80"
-- -- 缩进2个空格等于一个Tab
-- vim.o.tabstop = 4
-- vim.bo.tabstop = 4
-- vim.o.softtabstop = 2
-- vim.o.shiftround = true
-- -- >> << 时移动长度
-- vim.o.shiftwidth = 4
-- vim.bo.shiftwidth = 4
-- -- 新行对齐当前行，空格替代tab
-- vim.o.expandtab = true
-- vim.bo.expandtab = true
-- vim.o.autoindent = true
-- vim.bo.autoindent = true
-- vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
-- vim.o.ignorecase = true
-- vim.o.smartcase = true
-- -- 搜索不要高亮
-- vim.o.hlsearch = false
-- -- 边输入边搜索
-- vim.o.incsearch = true
-- -- 使用增强状态栏后不再需要 vim 的模式提示
-- vim.o.showmode = false
-- -- 命令行高为2，提供足够的显示空间
-- vim.o.cmdheight = 2
-- -- 当文件被外部程序修改时，自动加载
-- vim.o.autoread = true
-- vim.bo.autoread = true
-- -- 禁止折行
-- vim.o.wrap = false
-- vim.wo.wrap = false
-- -- 行结尾可以跳到下一行
-- vim.o.whichwrap = 'b,s,<,>,[,],h,l'
-- -- 允许隐藏被修改过的buffer
-- vim.o.hidden = true
-- -- 鼠标支持
-- vim.o.mouse = "a"
-- -- 禁止创建备份文件
-- vim.o.backup = false
-- vim.o.writebackup = false
-- vim.o.swapfile = false
-- -- smaller updatetime
-- vim.o.updatetime = 300
-- -- 设置 timeoutlen 为等待键盘快捷键连击时间300毫秒，可根据需要设置
-- -- 遇到问题详见：https://github.com/nshen/learn-neovim-lua/issues/1
-- vim.o.timeoutlen = 300
-- -- split window 从下边和右边出现
-- vim.o.splitbelow = true
-- vim.o.splitright = true
-- -- 自动补全不自动选中
-- vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- -- 样式
-- -- vim.o.background = "dark"
-- vim.o.termguicolors = true
-- vim.opt.termguicolors = true
-- -- 不可见字符的显示，这里只把空格显示为一个点
-- vim.o.list = true
-- vim.o.listchars = "space:·"
-- -- 补全增强
-- vim.o.wildmenu = true
-- -- Dont' pass messages to |ins-completin menu|
-- vim.o.shortmess = vim.o.shortmess .. 'c'
-- vim.o.pumheight = 10
-- -- always show tabline
-- vim.o.showtabline = 2

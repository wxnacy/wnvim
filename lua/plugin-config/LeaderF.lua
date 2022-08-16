-- https://github.com/Yggdroot/LeaderF
vim.g.Lf_WindowPosition = 'popup'
vim.g.Lf_fuzzyEngine_C = 1
vim.g.Lf_PreviewInPopup = 1
-- vim.g.Lf_PreviewResult = {Function= 0, BufTag= 0}
-- vim.keymap.set("n", "<Leader>p", ":Leaderf file<CR>")
-- vim.keymap.set("n", "<Leader>f", ":Leaderf mru --cwd<CR>")
-- vim.keymap.set("n", "<Leader>fm", ":Leaderf mru<CR>")
vim.keymap.set("n", "<Leader>fu", ":Leaderf function<CR>")

-- "===============================
-- " :LeaderfInstallCExtension 安装 c 语言扩展，可以提高 10 倍速度
-- " echo g:Lf_fuzzyEngine_C  输出 =1，代表使用 C 引擎成功
-- let g:Lf_IgnoreCurrentBufferName = 1    " 结果中过滤当前 buffer 名字"
-- " 弹窗设置
-- let g:Lf_WindowPosition = 'popup'
-- let g:Lf_PreviewResult={"Function": 0, 'BufTag': 0} " 设置搜索方法时不自动跳转"
-- let g:Lf_PreviewInPopup = 1     " 在弹窗中预览"
-- let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline"  }

-- " 按照路径查找
-- map <leader>p :Leaderf file --popup<CR>
-- " map <leader>f :Leaderf buffer<CR>
-- " 最近用过最多的文件，全部路径
-- " map <leader>f :Leaderf mru<CR>
-- " 最近用过最多的文件，当前路径
-- map <leader>f :Leaderf mru --cwd<CR>
-- " 查找当前缓存
-- map <leader>fb :Leaderf buffer<CR>
-- map <leader>fl :Leaderf line<CR>
-- map <leader>ft :Leaderf bufTag<CR>
-- " 查找方法
-- " /Library/Developer/CommandLineTools/usr/bin/ctags: illegal option -- n
-- " 如果出现上述 BUG，需要安装最新版本 ctags
-- " 命令 brew install ctags
-- map <leader>fu :Leaderf function --popup<CR>
return {}

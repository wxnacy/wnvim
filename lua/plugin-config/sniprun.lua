-- 执行当前文件
vim.keymap.set('n', '<Leader>r', 'ggvG<Plug>SnipRun', {silent = true})
-- 执行选中片段
vim.keymap.set('v', '<leader>r', '<Plug>SnipRun', {silent = true})
return require('sniprun').setup({
	display = {
		"Classic",
		"VirtualTextOk",
		"VirtualTextErr",          --# display error results as virtual text
		-- "TempFloatingWindow",      --# display results in a floating window
		-- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText__
		-- "Terminal",                --# display results in a vertical split
		-- "TerminalWithCode",        --# display results and code history in a vertical split
		"NvimNotify",              --# display with the nvim-notify plugin
		-- "Api"                      --# return output to a programming interface
	},
	show_no_output = {
		"NvimNotify",              --# display with the nvim-notify plugin
	}

})

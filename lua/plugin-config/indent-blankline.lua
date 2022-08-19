-- https://github.com/lukas-reineke/indent-blankline.nvim
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

return require("indent_blankline").setup {
    -- show_end_of_line = true,
    -- space_char_blankline = " ",
    -- 代码块缩进竖线
    show_current_context = true,
    -- 过滤文件类型
    filetype_exclude = { "dashboard" }
    -- 代码块首行标下划线
    -- show_current_context_start = true,
}

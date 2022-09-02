-- vim.g.vista_fzf_preview = 'right:50%'
vim.keymap.set('n', 'tb', ':Vista!!<cr>')
-- vim.api.nvim_exec("let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]")
vim.cmd([[
    let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
]])
vim.cmd([[
    let g:vista_default_executive = 'ctags'
]])
vim.cmd([[
    let g:vista_executive_for = {
    \ 'cpp': 'vim_lsp',
    \ 'php': 'vim_lsp',
    \ }
]])
vim.cmd([[
    let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }
]])
vim.cmd([[
    let g:vista_fzf_preview = ['right:50%']
]])
vim.cmd([[
    let g:vista#renderer#enable_icon = 1
]])
vim.cmd([[
    let g:vista#renderer#icons = {
    \   "function": "\uf794",
    \   "variable": "\uf71b",
    \  }
]])

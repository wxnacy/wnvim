--" https://github.com/tpope/vim-fugitive
vim.keymap.set('n', 'gb', ':G blame<CR>')
vim.keymap.set('n', 'gst', ':G status<CR>')
vim.keymap.set('n', 'gs', ':G<CR>')
vim.keymap.set('n', 'gd', ':G diff<CR>')
vim.keymap.set('n', 'gds', ':Gdiffsplit<CR>')
vim.keymap.set('n', 'gdv', ':Gvdiffsplit<CR>')
-- vim.keymap.set('n', '<leader>gc', ':G commit<CR>')
-- vim.keymap.set('n', '<leader>gr', ':Gread<CR>')
--nnoremap <leader>gb :G blame<CR>
--" nnoremap <leader>gst :G status<CR>
--" http://vimcasts.org/episodes/fugitive-vim-working-with-the-git-index/
--" gs 状态下
--" - add/reset Unpush - git push
--" = 展示 diff
--" cc commit 信息
--" <enter> 打开文件
--nnoremap <leader>gs :G<CR>
--nnoremap <leader>gd :G diff<CR>
--nnoremap <leader>gds :Gdiffsplit<CR>
--nnoremap <leader>gdv :Gvdiffsplit<CR>
--nnoremap <leader>gc :G commit<CR>
--nnoremap <leader>gr :Gread<CR>


-- https://github.com/junegunn/fzf.vim#commands
vim.keymap.set("n", "<Leader>fa", ":Rg<CR>")
vim.keymap.set("n", "<Leader>gl", ":Commits<CR>")
vim.keymap.set("n", "<Leader>fl", ":BLines<CR>")
vim.keymap.set("n", "<Leader>fc", ":Commands<CR>")
vim.keymap.set("n", "<Leader>ff", ":Files<CR>")
vim.keymap.set("n", "<Leader>p", ":Files<CR>")
vim.keymap.set("n", "<Leader>fh", ":History<CR>")
-- vim.keymap.set("n", "<Leader>fm", ":Files<CR>")

vim.g.fzf_history_dir="~/.fzf.nvim_history"
-- nmap <Leader><Leader>a :Rg<CR>
-- nmap <Leader>fa :Rg<CR>
-- nmap <Leader>gl :Commits<CR>
-- nmap <Leader>fl :BLines<CR>
-- nmap <Leader>fc :Commands<CR>
-- nmap <Leader>ff :Files<CR>
-- nmap <Leader>bm :call fzf#run({'source': 'bm ls', 'sink': 'e', 'tmux': '-p90%,60%', 'window': { 'width': 0.9, 'height': 0.6  }})<CR>

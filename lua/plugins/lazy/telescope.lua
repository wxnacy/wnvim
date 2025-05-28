-- https://github.com/nvim-telescope/telescope.nvim
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		-- vim.keymap.set("n", "gr", builtin.lsp_references) -- gr跳转到引用了对应变量或函数的位置
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fr", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fm", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>") -- 命令
		vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>") -- 映射 keymap
		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope oldfiles<cr>") -- 历史文件路径搜索
		vim.keymap.set("n", "<leader>fu", "<cmd>Telescope treesitter<cr>") -- 历史文件路径搜索
		-- vim.keymap.set('n', '<leader>fu', '<cmd>Telescope treesitter theme=cursor<cr>')        -- 历史文件路径搜索
		vim.keymap.set("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- 搜索当前 buffer 行搜索
		vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- git 文件修改状态
		vim.keymap.set("n", "<leader>gl", "<cmd>Telescope git_commits<cr>") -- git 提交历史
		vim.keymap.set("n", "gcb", "<cmd>Telescope git_branches<cr>") -- 切换分支
		-- need telescope-file-browser.nvim
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<cr>")
		-- need nvim-telescope/telescope-project.nvim
		vim.keymap.set(
			"n",
			"<leader>fp",
			"<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>"
		)
		vim.keymap.set("n", "<leader>fa", "<cmd>Telescope command_palette<CR>")

		-- 启动
		local actions = require("telescope.actions")
		require("telescope").setup({

			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						-- hop.hop_toggle_selection
						-- ["<C-g>"] = require("telescope").extensions.hop.hop,
					},
				},
			},
		})
	end,
}

-- return {
-- -- https://github.com/OXY2DEV/markview.nvim
-- "OXY2DEV/markview.nvim",
-- lazy = false,

-- -- For blink.cmp's completion
-- -- source
-- dependencies = {
-- "saghen/blink.cmp"
-- },
-- keys = {
-- -- 👇 in this section, choose your own keymappings!
-- {
-- "<leader>mt",
-- mode = { "n", "v" },
-- "<cmd>Markview<cr>",
-- desc = "Markview Toggle",
-- },
-- },
-- opts = {
-- preview = {
-- filetypes = { "markdown", "codecompanion" },
-- ignore_buftypes = {},
-- },
-- },
-- };

-- return {
-- -- https://github.com/toppair/peek.nvim
-- "toppair/peek.nvim",
-- event = "VeryLazy",
-- build = "deno task --quiet build:fast",
-- config = function()
-- require("peek").setup()
-- vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
-- vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
-- end,
-- }

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.keymap.set("n", "<C-p>", "<Cmd>MarkdownPreviewToggle<CR>")
	end,
	ft = { "markdown" },
}

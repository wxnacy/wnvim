return {
    -- https://github.com/OXY2DEV/markview.nvim
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- For blink.cmp's completion
    -- source
    dependencies = {
        "saghen/blink.cmp"
    },
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>mt",
			mode = { "n", "v" },
			"<cmd>Markview<cr>",
			desc = "Markview Toggle",
		},
	},
};

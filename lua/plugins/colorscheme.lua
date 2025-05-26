return {
    -- catppuccin
    -- https://github.com/catppuccin/nvim
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "frappe", -- latte, frappe, macchiato, mocha
            })
            vim.cmd.colorscheme "catppuccin"
        end
    }
}

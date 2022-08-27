-- local plugin_configs = {
    -- -- Packer can manage itself
    -- -- {'wbthomason/packer.nvim'},
    -- -- -- wvim 基础设置
    -- -- {'wxnacy/wvim' },
    -- -- 底部状态栏
    -- -- https://github.com/vim-airline/vim-airline
    -- -- use { 'bling/vim-airline' }
    -- -- 替换 vim-airline
    -- -- https://github.com/nvim-lualine/lualine.nvim
    -- {
        -- 'nvim-lualine/lualine.nvim',
        -- requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        -- config = function ()
            -- print("w")
        -- end
    -- }
-- }
-- for _, value in ipairs(plugin_configs) do
    -- for _, n in ipairs(value) do
        -- print(n)
    -- end
-- end


-- local plugin_setups = {
    -- ['lualine.nvim'] = function ()
        -- require('lualine').setup {
            -- options = {
                -- -- ... your lualine config
                -- theme = 'tokyonight'
                -- -- ... your lualine config
            -- }
        -- }
    -- end
-- }
-- for key, value in pairs(plugin_setups) do
    -- print(key, value)
-- end
-- local finders = require "telescope.finders"
-- local pickers = require "telescope.pickers"
-- local conf = require("telescope.config").values
-- local colors = function(opts)
  -- opts = opts or {}
  -- pickers.new(opts, {
    -- prompt_title = "colors",
    -- finder = finders.new_table {
      -- results = { "red", "green", "blue" }
    -- },
    -- sorter = conf.generic_sorter(opts),
  -- }):find()
-- end
-- -- colors()
-- colors(require("telescope.themes").get_dropdown{})


-- print(vim.fn.globpath(vim.fn.stdpath("config"), "ss.lua"))
-- local tmp = vim.split(vim.fn.globpath(vim.fn.stdpath("config"), "lug/plugin-config/*.lua"), "\n")
-- for _, f in ipairs(tmp) do
    -- print(f)
-- end
--


-- local api = vim.api
-- local command = api.n/Users/wxnacy/.local/share/nvim/site/pack/packer/startvim_create_user_command

-- command("DiffviewRefresh", function()
  -- diffview.emit("refresh_files")
-- end, { nargs = 0, bang = true })

-- local res = require("local-nvim-plugin")
-- print(res.name)

-- local m = {"ww", name = "wxnacy", 1}
-- print(type(m))
-- print(m[1])
-- print(m[2])
-- print(m['name'])

-- array = {"Lua", "Tutorial"}
-- table.insert(array, "ww")
-- for _ , value in ipairs(array ) do
    -- print(value)
-- end
--

-- for key, value in pairs(require("telescope.builtin")) do print(key) end

-- for key, value in pairs(require("telescope.command").get_extensions_subcommand()) do print(key) end

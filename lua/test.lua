local a = {1}
table.insert(a, 2)
table.insert(a, 3)
-- table.insert(a, 0, 4)
for _, value in ipairs(a) do
    print(value)
end

-- require("utils").require("ssss", true)
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
        -- end
    -- }
-- }
-- for _, value in ipairs(plugin_configs) do
    -- for _, n in ipairs(value) do
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


-- local tmp = vim.split(vim.fn.globpath(vim.fn.stdpath("config"), "lug/plugin-config/*.lua"), "\n")
-- for _, f in ipairs(tmp) do
-- end
--


-- local api = vim.api
-- local command = api.n/Users/wxnacy/.local/share/nvim/site/pack/packer/startvim_create_user_command

-- command("DiffviewRefresh", function()
  -- diffview.emit("refresh_files")
-- end, { nargs = 0, bang = true })




-- local opt1 = {name = 1}
-- local opt2 = {id = 2}
-- local opt3 = vim.tbl_deep_extend("force", opt1, opt2)
-- for key, value in pairs(opt3) do
    -- print(key, value)
-- end

-- print(opt1['name'])
-- print(opt1['nme'])
-- require("utils").require("ssss")

-- ===============================
-- telescope
-- 搜索插件
-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/nvim-telescope/telescope-project.nvim
-- https://github.com/nvim-telescope/telescope-smart-history.nvim
-- brew install fd
-- ===============================
local ok, telescope = pcall(require, 'telescope')
if not ok then
    return
end

local config = require("config")
local actions = require "telescope.actions"
local fb_actions = require "telescope".extensions.file_browser.actions

-- key mapping
if 1 == 1 then
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')      -- 当前 cwd 文件路径搜索
    vim.keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>')       -- 文本模糊搜索
    vim.keymap.set('n', '<leader>fr', '<cmd>Telescope buffers<cr>')         -- buffer 文件
    vim.keymap.set('n', '<leader>fc', '<cmd>Telescope commands<cr>')        -- 命令
    vim.keymap.set('n', '<leader>fm', '<cmd>Telescope help_tags<cr>')       -- 帮助文档
    vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')         -- 映射 keymap
    vim.keymap.set('n', '<leader>fh', '<cmd>Telescope oldfiles<cr>')        -- 历史文件路径搜索
    vim.keymap.set('n', '<leader>fu', '<cmd>Telescope treesitter<cr>')        -- 历史文件路径搜索
    -- vim.keymap.set('n', '<leader>fu', '<cmd>Telescope treesitter theme=cursor<cr>')        -- 历史文件路径搜索
    vim.keymap.set('n', '<leader>fl', '<cmd>Telescope current_buffer_fuzzy_find<cr>')        -- 搜索当前 buffer 行搜索
    vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<cr>')      -- git 文件修改状态
    vim.keymap.set('n', '<leader>gl', '<cmd>Telescope git_commits<cr>')     -- git 提交历史
    vim.keymap.set('n', 'gcb', '<cmd>Telescope git_branches<cr>')           -- 切换分支
    -- need telescope-file-browser.nvim
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser<cr>')
    -- need nvim-telescope/telescope-project.nvim
    vim.keymap.set('n', '<leader>fp', "<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>")
    vim.keymap.set('n', '<leader>fa', "<cmd>Telescope command_palette<CR>")
end


-- setup config
local setup_config = {
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                -- hop.hop_toggle_selection
                ["<space>"] = require("telescope").extensions.hop.hop,
            }
        },
    },
}

-- 扩展插件配置
local extensions = {}

-- command_palette config
local command_palette = {
    {
        "Vim",
        { "List trouble files", ":Trouble" },
        { "List TODO files", ":TodoTelescope" },
        { "Reload plugin load file", ":source " .. config.HOME .. "/lua/plugins.lua" },
        { "Reload nvim init.lua", ":source " .. config.HOME .. "/init.lua" },
        { "Reload current file", ":source %" },
    },
    {
        "Telescope",
        -- { "Search packer projects", "<Cmd>Telescope packer<CR>" },
        { "Search packer projects", ":Telescope packer" },
    },
    {
        "LSP",
        { "Print workspace cwd", ":lua vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()[1]))" },
        { "Format code", ":lua vim.lsp.buf.formatting()" },
    }
}

-- load telescope commands
for key, _ in pairs(require("telescope.builtin")) do
    for index, commands in ipairs(command_palette) do
        if commands[1] == "Telescope" then
            table.insert(command_palette[index], #commands, {
                "Telescope " .. key,
                ":Telescope " .. key
            })
        end
    end
end

extensions.command_palette = command_palette

-- hot config
extensions.hop = {
    keys = {"a", "s", "d", "f", "g", "h", "j", "k", "l", ";",
    "q", "w", "e", "r", "t", "y", "u", "i", "o", "p",
    "A", "S", "D", "F", "G", "H", "J", "K", "L", ":",
    "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", },
    -- Highlight groups to link to signs and lines; the below configuration refers to demo
    -- sign_hl typically only defines foreground to possibly be combined with line_hl
    sign_hl = { "WarningMsg", "Title" },
    -- optional, typically a table of two highlight groups that are alternated between
    line_hl = { "CursorLine", "Normal" },
    -- options specific to `hop_loop`
    -- true temporarily disables Telescope selection highlighting
    clear_selection_hl = false,
    -- highlight hopped to entry with telescope selection highlight
    -- note: mutually exclusive with `clear_selection_hl`
    trace_entry = true,
    -- jump to entry where hoop loop was started from
    reset_selection = true,
}

-- file_browser config
extensions.file_browser = {
    theme = "ivy",
    -- disables netrw and use telescope-file-browser in its place
    hijack_netrw = true,
    mappings = {
        ["i"] = {
            ['<C-r>'] = fb_actions.rename,
            ['<C-h>'] = fb_actions.goto_parent_dir,
            ['<C-l>'] = actions.select_default,
            -- ['<C-l>'] = '<C-m>',
        },
        ["n"] = {
            -- your custom normal mode mappings
        },
    },
}

-- project config
extensions.project = {
    -- theme = "ivy",
    base_dirs = {
        {'~/Documents/Projects'},
        {'~/Documents/Configs'},
        {'~/Projects'},
        {config.PLUGIN_HOME},
    }
}

-- ui-select config
-- extensions["ui-select"] = {
    -- require("telescope.themes").get_dropdown {
        -- -- even more opts
    -- }
-- }

setup_config.extensions = extensions

telescope.setup(setup_config)

-- 能否加载插件
local function load_extension(module)
    ok, _ = pcall(require, "telescope._extensions." .. module)
    if not ok then
        vim.notify("Telescope extension " .. module .. " not found")
        return
    end
    telescope.load_extension(module)

end


-- load_extension("ui-select")
load_extension("file_browser")
load_extension("project")
load_extension("packer")
load_extension('command_palette')
load_extension('hop')
-- load_extension('smart_history')
-- load_extension('repo')



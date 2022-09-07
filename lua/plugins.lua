local config = require("config")
-- local packer = require('packer')
local utils = require("utils")
local is_install_plugin = require("utils").is_install_plugin
local plugin_config = require("plugin-config.config")

-- 判断是否安装 packer 插件管理器
local fn = vim.fn
local install_path = config.PLUGIN_HOME .. "/packer.nvim"
local is_new_install
if not is_install_plugin("packer.nvim") then
    vim.notify("正在安装Pakcer.nvim，请稍后...")
    is_new_install = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
        install_path,
    })

    -- https://github.com/wbthomason/packer.nvim/issues/750
    local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    end
    vim.notify("Packer.nvim 安装完毕")
end

-- 没有成功安装直接返回
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("没有安装 packer.nvim")
    return
end

packer.reset()
packer.startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}
    -- wvim 基础设置
    use {'wxnacy/wvim'}
    -- 中文帮助文档
    use { 'yianwillis/vimcdoc' }
    -- 查看 lua 加载速度
    use { 'lewis6991/impatient.nvim' }
    -- ============================ 主题/美观 begin
    -- gruvbox theme
    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
    use 'shaunsingh/nord.nvim'
    -- 主题 https://github.com/glepnir/zephyr-nvim
    use({ 'glepnir/zephyr-nvim', })
    -- 主题
    use { 'folke/tokyonight.nvim' }
    -- use {
        -- "folke/which-key.nvim",
        -- config = function()
            -- require("which-key").setup {
                -- -- your configuration comes here
                -- -- or leave it empty to use the default settings
                -- -- refer to the configuration section below
            -- }
        -- end
    -- }
    --https://github.com/nvim-telescope/telescope.nvim#getting-started
    -- brew install fd
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- telescope ui 选择
    -- use {'nvim-telescope/telescope-ui-select.nvim' }
    -- 文件浏览器
    use { "nvim-telescope/telescope-file-browser.nvim" }
    -- 管理项目 require file-browser
    -- 管理 packer require file-browser
    use { 'nvim-telescope/telescope-project.nvim' }
    use { 'nvim-telescope/telescope-packer.nvim' }
    -- 管理命令
    use { "LinArcX/telescope-command-palette.nvim" }
    -- telescope 快速跳转
    use {'nvim-telescope/telescope-hop.nvim'}
    -- 使用 sqlite3 记录历史记录
    -- use {
        -- 'nvim-telescope/telescope-smart-history.nvim',
        -- requires = { "kkharji/sqlite.lua" }
    -- }
    -- 查找本地 git 仓库
    -- use { 'cljoly/telescope-repo.nvim' }
    -- dashboard
    -- https://github.com/glepnir/dashboard-nvim
    use {'glepnir/dashboard-nvim'}
    -- 缩进美化展示
    use "lukas-reineke/indent-blankline.nvim"
    -- 多光标选择
    use { "mg979/vim-visual-multi" }
    -- ============================ 主题/美观 end
    -- tagbar
    use { "liuchengxu/vista.vim" }
    -- 快速注释
    use { 'scrooloose/nerdcommenter' }
    -- 底部状态栏
    -- https://github.com/vim-airline/vim-airline
    -- use { 'bling/vim-airline' }
    -- 替换 vim-airline
    -- https://github.com/nvim-lualine/lualine.nvim
    -- use {
        -- 'nvim-lualine/lualine.nvim',
        -- requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    -- }
    -- 快速跳转
    -- use { 'Lokaltog/vim-easymotion' }
    -- 快速跳转用来代替 vim-easymotion
    -- https://github.com/phaazon/hop.nvim
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    }
    -- 快速去掉行尾空格
    -- use { 'bronson/vim-trailing-whitespace' }
    -- 快速去掉行尾空格 替换 bronson/vim-trailing-whitespace
    use { 'ntpeters/vim-better-whitespace' }
    -- 成对标签自动补全
    use { 'jiangmiao/auto-pairs' }
    -- fzf 插件
    use {
        'junegunn/fzf.vim',
        requires = {"junegunn/fzf"}
    }
    -- 文件搜索
    use { 'Yggdroot/LeaderF' }
    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- nvim-treesitter
    use { 'nvim-treesitter/nvim-treesitter', commit='11e88f6', run = ':TSUpdate'}
    -- git 相关
    use { 'tpope/vim-fugitive' }
    use { 'lewis6991/gitsigns.nvim' }
    -- diffview 查看文件不同
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    -- simnalamburt/vim-mundo 文件历史记录
    use { 'simnalamburt/vim-mundo' }
    -- 通知
    -- https://github.com/rcarriga/nvim-notify
    use { 'rcarriga/nvim-notify' }

    -- bufferline.nvim
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    -- ============================ 代码相关 begin
    -- for go
    use { 'fatih/vim-go' }
    -- 高亮相同单词
    use {'RRethy/vim-illuminate'}
    -- 代码片段运行
    -- https://github.com/michaelb/sniprun
    -- 需要下载 rust
    -- brew install rust
    use { 'michaelb/sniprun', run = 'bash ./install.sh' }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim"
    }

    -- nvim 包管理
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    }

    -- lspconfig
    use {'neovim/nvim-lspconfig'}
    -- use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    use 'hrsh7th/cmp-path'     -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    use 'hrsh7th/nvim-cmp'
    -- vsnip
    use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    -- lspkind
    use 'onsails/lspkind-nvim'

    -- Linters
    use {"jose-elias-alvarez/null-ls.nvim"}
    -- ============================ 代码相关 end

    -- ============================ 工具相关 begin
    -- 多终端
    use {"akinsho/toggleterm.nvim", tag = 'v2.*'}
    -- ============================ 工具相关 end

    -- 动态加载插件
    for _, _plugin in ipairs(plugin_config.plugins) do
        use(_plugin)
        if _plugin.config then
            pcall(_plugin.config)
        end
    end

    -- 新安装时执行同步操作
    if is_new_install then
        packer.sync()
    end
end)

-- 启动插件
local function setup_plugin()
    if is_install_plugin("wvim") then
        vim.api.nvim_command("source " .. config.PLUGIN_HOME .. "/wvim/vimrcs/basic.vim")
        vim.api.nvim_command("source " .. config.PLUGIN_HOME .. "/wvim/vimrcs/mapping.vim")
    end

    if is_install_plugin("packer.nvim") then
        vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>")
        vim.keymap.set("n", "<leader>pi", ":PackerInstall<CR>")
    end

    require("plugin-config")

    -- 设置主题
    vim.o.background = "dark"
    vim.g.tokyonight_style = "storm" -- day / night
    -- 半透明
    -- vim.g.tokyonight_transparent = true
    -- vim.g.tokyonight_transparent_sidebar = true
    local colorscheme = "tokyonight"
    -- tokyonight
    -- OceanicNext
    -- gruvbox
    -- zephyr
    -- nord
    -- onedark
    -- nightfox
    if not utils.can_success_run_cmd("colorscheme " .. colorscheme) then
        vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
    end

    local ok, toggleterm = utils.require('toggleterm')
    if ok then
        -- https://github.com/akinsho/toggleterm.nvim
        toggleterm.setup()
    end
    -- https://github.com/hrsh7th/vim-vsnip
    if utils.is_install_plugin('vim-vsnip') then
        vim.cmd([[
        imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
        smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
        imap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-n>'
        smap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-n>'
        imap <expr> <C-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-n>'
        smap <expr> <C-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-n>'
        imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
        smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
        imap <expr> <C-p>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-p>'
        smap <expr> <C-p>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-p>'
        ]])
        -- 设置代码片段目录
        vim.g.vsnip_snippet_dir = config.HOME .. '/config/vsnip'
    end

    -- if utils.require('which-key') then
        -- require("which-key").register({
            -- ["?"] = { "<cmd>WhichKey <cr>", "Show Hot Key" },
            -- -- ["<C-/>"] = { "<cmd>WhichKey <cr>", "Show Hot Key" },
        -- })
    -- end

end

local M = {}

-- 启动方法
M.setup = function ()
    setup_plugin()
end

return M

-- https://github.com/lewis6991/gitsigns.nvim
require("utils").setup('gitsigns', {
    signs = {
        add          = { text = '+' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    on_attach = function(bufnr)
        local map = require("utils").set_keymap
        map('n', '<leader>gn', '<cmd>Gitsigns next_hunk<CR>')   -- 下个修改
        map('n', '<leader>gp', '<cmd>Gitsigns prev_hunk<CR>')   -- 上个修改
        map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')      -- 重置修改
        map('n', '<leader>gR', ':Gitsigns reset_buffer<CR>')    -- 重置当前修改
        map('n', '<leader>gh', ':Gitsigns preview_hunk<CR>')    -- 预览修改

        -- Navigation
        -- map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
        -- map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
        -- Actions
        -- map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        -- map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        -- map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        -- map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        -- map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
        -- map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
        -- map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
        -- map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
        -- map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
        -- map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
        -- map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
        -- map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
        -- map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

        -- -- Text object
        -- map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        -- map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = true, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },

    attach_to_untracked = true,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',

    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
}, true)

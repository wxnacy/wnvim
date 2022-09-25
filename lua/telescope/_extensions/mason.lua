local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
    error("This plugin requires nvim-telescope/telescope.nvim")
end
local pickers = require "telescope.pickers"
local entry_display = require "telescope.pickers.entry_display"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local utils = require("telescope._extensions.mason.utils")

local results = {
    {
        name = 'test',
        path = 'test.lua',
        filetype = 'test.lua',
        source = 'test.lua',
    }
}

-- results = utils.extend_results('nvim-lspconfig', results)
results = utils.extend_results('mason', results)

local max_width_map = utils.get_max_width_map(results)

local mason = function(opts)
    local displayer = entry_display.create {
        separator = "",
        items = {
            { width = max_width_map['filetype'] + 1 },
            { width = max_width_map.name + 1 },
            { width = max_width_map.source + 1 },
            -- { remaining = true },
        },
    }

    local make_display = function(entry)
        -- local hl = entry.directory == "start" and "Operator" or "Number"
        return displayer {
            { entry.value['filetype'], "Operator", "Normal" },
            { entry.name, "Operator", "Normal" },
            { entry.value.source, "Comment" },
        }
    end

    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "Mason",
        finder = finders.new_table {
            results = results,
            entry_maker = function(entry)
                return {
                    value = entry,
                    name = entry.name,
                    path = entry.path,
                    display = make_display,
                    ordinal = entry.name,
                    preview_command = function(entry, bufnr)
                        local readme = {}
                        if entry.path ~= nil then
                            readme = vim.fn.readfile(entry.path)
                            vim.api.nvim_buf_set_option(bufnr, "filetype", "lua")
                        end
                        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, readme)
                    end,

                }
            end,
        },

        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            local test = function()
                print('test')
            end
            map('i', '<C-t>', test)
            return true
        end
    }):find()
end

-- TODO: 独立出来
return telescope.register_extension {
    setup = function()

    end,
    exports = {
        mason = mason,
    },
}

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
}

results = utils.extend_results('nvim-lspconfig', results)

local plugin_name_width = utils.get_max_name_width(results)
-- local plugin_name_width = 10

local mason = function(opts)
    local displayer = entry_display.create {
        separator = "",
        items = {
            { width = plugin_name_width + 1 },
            { width = plugin_name_width + 1 },
            -- { remaining = true },
        },
    }

    local make_display = function(entry)
        -- local hl = entry.directory == "start" and "Operator" or "Number"
        return displayer {
            { entry.name, "Operator", "Normal" }, -- TODO: parameter 2 intended to be override for matcher hl-group
            -- { entry.name}, -- TODO: parameter 2 intended to be override for matcher hl-group
            { entry.path, "Comment" },
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

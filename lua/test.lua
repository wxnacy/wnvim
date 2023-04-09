local utils = require("utils")



local function mysplit (inputstr, sep)
   if sep == nil then
      sep = "%s"
   end
   local t={}
   for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
   end
   return t
end

-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
-- print_ipairs(vim.api.nvim_get_runtime_file("", true))
-- print_ipairs(runtime_path)
-- print(vim.fn.expand("~/Downloads"))
-- print(vim.fn.stdpath("config"))
print(utils.is_install_plugin("packer.nvim"))
utils.print_pairs(utils)

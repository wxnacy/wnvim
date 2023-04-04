local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, vim.fn.stdpath("config") .. "/lua/?.lua")
table.insert(runtime_path, vim.fn.stdpath("config") .. "/lua/?/init.lua")
local library = vim.api.nvim_get_runtime_file("", true)
return {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = library
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false
      },
    },
  },
}

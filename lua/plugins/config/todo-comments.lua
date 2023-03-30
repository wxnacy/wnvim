if require("plugins.packer.utils").is_install_plugin("todo-comments") then
    return require("todo-comments").setup({})
else
    return {}
end

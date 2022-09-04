local ok, mason = pcall(require, 'mason')
if not ok then
    vim.notify('mason not install')
    return
end
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

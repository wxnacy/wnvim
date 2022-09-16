local M = {}
local mason_index = require("mason-registry.index")


M.null_ls_to_mason = {
    -- stylelint = "stylelint-lsp",
    clang_format = "clang-format",
    cfn_lint = "cfn-lint",
}

M.get_mason_package_name = function(name)
    -- if type(null_ls_spec) == 'table' then
    -- name = null_ls_spec[1]
    -- else
    -- name = null_ls_spec
    -- end
    if mason_index[name] then
        return name
    end

    local pck_name = M.null_ls_to_mason[name]
    if mason_index[pck_name] then
        return pck_name
    end

    return nil
end

M.is_install = function(name)
    local pck_name = M.get_mason_package_name(name)
    if not pck_name then
        require("utils").notify_not_installed(name)
        return false
    end
    local package_path = require("mason-core.path").package_prefix(pck_name)
    if require("utils").is_dir_exists(package_path) then
        return true
    else
        require("utils").notify_not_installed(name)
        return false
    end
end

return M

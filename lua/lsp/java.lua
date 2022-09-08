-- vim.wo.colorcolumn = "120"
-- 模式使用 mason 或者 lsp_installer 下载的 jdtls 无法使用
-- https://github.com/lxyoucan/nvim-as-java-ide
-- 按照文章中提示使用 https://download.eclipse.org/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz 版本可以使用
-- 需要替换 /Users/wxnacy/.local/share/nvim/mason/packages/jdtls (如果是 mason)
-- 默认配置 https://github.com/williamboman/nvim-lsp-installer/blob/main/lua/nvim-lsp-installer/servers/jdtls/README.md
-- lsp with lombok https://blog.csdn.net/lxyoucan/article/details/123448313
--
-- 使用 mason 需要配合环境变量来支持 lombok
-- cd $HOME/.local/share/nvim/mason/packages/jdtls
-- wget https://projectlombok.org/downloads/lombok.jar
-- cd -
-- export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"
local config =  {
    -- enable lombok support
    -- 这个参数在使用 mason 管理 lsp 时并不管用
    use_lombok_agent = true,
    vmargs = {
        "-XX:+UseParallelGC",
        "-XX:GCTimeRatio=4",
        "-XX:AdaptiveSizePolicyWeight=90",
        "-Dsun.zip.disableMemoryMapping=true",
        "-Djava.import.generatesMetadataFilesAtProjectRoot=false",
        "-Xmx1G",
        "-Xms100m",
    }
}

return config

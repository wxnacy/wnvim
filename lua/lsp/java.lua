local config =  {
    -- enable lombok support
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

-- local M = {}

-- M.setup = function (opts)
    -- opts = vim.tbl_deep_extend("force", config, opts)
    -- require("lspconfig").jdtls.setup(opts)
-- end

-- return M


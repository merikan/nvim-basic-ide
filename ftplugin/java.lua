-- https://github.com/mfussenegger/nvim-jdtls

local ok, jdtls = pcall(require, "jdtls")
if not ok then
  vim.notify "JDTLS not found, install with `:LspInstall jdtls`"
  return
end


local root_markers = { ".git", "mvnw", "gradlew" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  vim.notify  "nvim-jtls: no root_dir found"
  return
end

local util = require "lspconfig.util"
local jdtls_package_dir = require("mason-registry").get_package("jdtls"):get_install_path()
local jdtls_bin = util.path.join(jdtls_package_dir, "bin", "jdtls") -- wrapper script

local share_dir = vim.env.XDG_CACHE_HOME or util.path.join(vim.env.HOME, ".local/share")
local cache_dir = vim.env.XDG_CACHE_HOME or util.path.join(vim.env.HOME, ".cache")

local jdtls_cache_dir = util.path.join(cache_dir, "jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = util.path.join(jdtls_cache_dir, "workspace", project_name)
local lombok_jar = util.path.join(jdtls_package_dir, "lombok.jar")

-- add bundles installed w/ Mason
-- jdtls_bundles = {}
--   vim.fn.glob(mason_packages .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1, 1)
--   vim.list_extend(jdtls_bundles, vim.fn.glob(mason_packages .. "/java-test/extension/server/*[0123456789].jar", 1, 1))
-- end


vim.notify("project_name=" .. project_name )
vim.notify("workspace_dir=" .. workspace_dir )

local config = {
  -- The command that starts the language server
  -- NOTICE: I am using the python wrapper
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    jdtls_bin,
    '--jvm-arg=-javaagent:' .. lombok_jar,
    '-data', workspace_dir
  },
  root_dir = root_dir,
  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

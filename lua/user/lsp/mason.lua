-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
local servers = {
  "ansiblels",
  "angularls",
  "bashls",
  "cmake",
  'cssls',
  "diagnosticls", -- Diagnostic (general purpose server)
  "dockerls",
  "eslint",
  "emmet_ls",
  "gopls",
  "graphql",
  "groovyls",
  'html',
  "jsonls",
  "jdtls",
  "kotlin_language_server",
  'sumneko_lua',
  "rust_analyzer",
  "sqlls",
  "svelte",
  "tailwindcss",
  "taplo",
  'tsserver',
  'pylsp',
  'volar',
  "lemminx",
  "yamlls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

-- 
table.insert(servers, "dartls") -- add dartls since it installed via dart sdk

for _, server in pairs(servers) do
  if server ~= 'jdtls' then goto continue end --we will configure jdtls in ftplugin

  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]
  local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)

  ::continue::
end

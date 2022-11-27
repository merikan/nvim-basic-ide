-- https://github.com/nvim-treesitter/nvim-treesitter
local M = {}


M.setup = function()
  print("setting up treesitter")




  -- settings
  require'nvim-treesitter.configs'.setup {
  -- ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python" }, -- put the language you want in this array
  -- -- ensure_installed = "all", -- one of "all" or a list of languages
	-- ignore_install = { "" }, -- List of parsers to ignore installing
	-- sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

  -- highlight = {
	-- 	enable = true, -- false will disable the whole extension
	-- 	disable = { "css" }, -- list of language that will be disabled
	-- },
	-- autopairs = {
	-- 	enable = true,
	-- },
	-- indent = { enable = true, disable = { "python", "css" } },




    ensure_installed = "all",
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    autopairs = {
      enable = true,
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
	  indent = { enable = true, disable = { "python", "css", "yaml" } },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }

end

return M

-- install packer.nvim and plugins
-- https://github.com/wbthomason/packer.nvim
--
-- :PackerCompile                    - Regenerate compiled loader file
-- :PackerClean                      - Remove any disabled or unused plugins
-- :PackerInstall                    - Clean, then install missing plugins
-- :PackerUpdate                     - Clean, then update and install plugins
-- :PackerSync                       - Perform `PackerUpdate` and then `PackerCompile`
-- :PackerLoad completion-nvim ale   - Loads opt plugin immediately

local execute = vim.api.nvim_command
local fn = vim.fn

local packer_init = false
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_init = true
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  execute("!git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

local packer = require "packer"

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- reload if this buffer changes
vim.cmd [[
  augroup packer_refresh
  autocmd!
  autocmd BufWritePost plugins.lua PackerClean
  autocmd BufWritePost plugins.lua PackerInstall
  autocmd BufWritePost plugins.lua PackerCompile
  augroup END
]]

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "kyazdani42/nvim-tree.lua" }
  use { "akinsho/bufferline.nvim" }
  use { "moll/vim-bbye" }
  use { "alexghergh/nvim-tmux-navigation" }-- make tmux and and vim work together
  use { "akinsho/toggleterm.nvim" }
  use { "ahmedkhalf/project.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "goolord/alpha-nvim" }

  -- Colorschemes , use colorscheme.lua to load a scheme
  use { "folke/tokyonight.nvim" }
  use { "lunarvim/darkplus.nvim" }
  use { "doums/darcula" }
  use { "chriskempson/base16-vim" }
  use { "gruvbox-community/gruvbox" }
  use { "sainnhe/gruvbox-material" }
  use { "joshdick/onedark.vim" }
  use { "kvrohit/rasmus.nvim" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }

  -- snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" }
  use { "mfussenegger/nvim-jdtls" } -- java

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter" }

  use { "folke/trouble.nvim", -- handle diagnostics with grace
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("user.plugins.trouble").setup()
    end,
  }
  -- Git
  use { "lewis6991/gitsigns.nvim" }

  -- DAP
  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/nvim-dap-ui" }
  use { "ravenxrz/DAPInstall.nvim" }

  -- Other
  use { "nvim-lualine/lualine.nvim" }
  -- use { "szw/vim-maximizer" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_init then
    require("packer").sync()
  end
end)

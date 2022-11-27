-- install packer.nvim and plugins
-- https://github.com/wbthomason/packer.nvim
--
-- :PackerClean                      - Remove any disabled or unused plugins
-- :PackerInstall                    - Clean, then install missing plugins
-- :PackerUpdate                     - Clean, then update and install plugins
-- :PackerCompile                    - Regenerate compiled loader file
-- :PackerSync                       - Perform `PackerUpdate` and then `PackerCompile`
-- :PackerLoad <plugin>              - Loads opt plugin immediately

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
  autocmd BufWritePost packer.lua PackerInstall
  autocmd BufWritePost packer.lua PackerCompile
  augroup END
]]

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself

  use { "nvim-treesitter/nvim-treesitter", -- treesitter render AST for languages
    requires = {
      -- "nvim-treesitter/nvim-treesitter-refactor",
      -- "nvim-treesitter/nvim-treesitter-textobjects",
    },
    -- run = ":TSUpdate",
    config = function()
      require("user.plugins.treesitter").setup()
    end,
  }


  use { "kyazdani42/nvim-tree.lua" }
  use { "akinsho/bufferline.nvim" }
  use { "moll/vim-bbye" }
  use { "alexghergh/nvim-tmux-navigation" }-- make tmux and and vim work together
  use { "akinsho/toggleterm.nvim" }
  use { "ahmedkhalf/project.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }


  use "windwp/nvim-autopairs" -- autopairs parentheses, brackets, quotes etc.
  use "tpope/vim-surround" --  all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
  use { "numToStr/Comment.nvim", -- line/block comments
    requires = {
      { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
    },
    config = function()
      require("user.plugins.comment").setup()
    end,
  }

  -- autocompletion
  use { "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp", -- nvim-cmp for lsp
      "onsails/lspkind-nvim", -- pictograms for completion items
      "hrsh7th/cmp-buffer", -- nvim-cmp for buffer words
      "hrsh7th/cmp-path", -- nvim-cmp for path
      "hrsh7th/cmp-cmdline", -- nvim-cmp for vim cmdline
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "hrsh7th/cmp-nvim-lua", -- nvim-cmp for nvim lua
      "f3fora/cmp-spell", -- nvim-cmp for vim spell
      { "ray-x/cmp-treesitter", after = "nvim-treesitter" }, -- cmp for treesitter
      "Saecki/crates.nvim", -- cmp for rust crates
    },
    -- config = function()
    --   require("user.plugins.cmp")
    -- end,
  }

  -- snippets
  use { "L3MON4D3/LuaSnip", --snippet engine
    requires = "rafamadriz/friendly-snippets", -- a bunch of snippets to use
  }

  -- LSP
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" }
  use { "mfussenegger/nvim-jdtls" } -- java

  -- Telescope
  use { "nvim-telescope/telescope.nvim", -- a picky fuzzy finder
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-project.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  }

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

  -- ==============
  -- look and feel
  -- ==============
  use {
    "goolord/alpha-nvim", -- a nvim dashboard
    requires = { "kyazdani42/nvim-web-devicons" },
    -- config = function()
    --   require "user.plugins.alpha"
    -- end,
  }
  -- Colorschemes , use colorscheme.lua to load a scheme
  use { "folke/tokyonight.nvim" }
  use { "lunarvim/darkplus.nvim" }
  use { "doums/darcula" }
  use { "chriskempson/base16-vim" }
  use { "gruvbox-community/gruvbox" }
  use { "sainnhe/gruvbox-material" }
  use { "joshdick/onedark.vim" }
  use { "kvrohit/rasmus.nvim" }
  use { "nvim-lualine/lualine.nvim" }
  -- use { "szw/vim-maximizer" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_init then
    require("packer").sync()
  end
end)

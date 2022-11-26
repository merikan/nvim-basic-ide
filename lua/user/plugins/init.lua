-- Disable some builtin plugins.
local disable_built_ins = {
  "2html_plugin",
  "gzip",
  "matchit",
  "rrhelper",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "logipat",
  "spellfile_plugin",
}
for _, plugin in pairs(disable_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
-- install plugins with packer
require "user.plugins.packer"

-- config plugins -- TODO load in packer instead, or?
require "user.plugins.cmp"
require "user.plugins.telescope"
require "user.plugins.gitsigns"
require "user.plugins.treesitter"
require "user.plugins.autopairs"
require "user.plugins.comment"
require "user.plugins.nvim-tree"
require "user.plugins.bufferline"
require "user.plugins.lualine"
require "user.plugins.toggleterm"
require "user.plugins.vim-tmux-navigator"
require "user.plugins.project"
require "user.plugins.illuminate"
require "user.plugins.indentline"
require "user.plugins.alpha"
require "user.plugins.dap"
require "user.plugins.vim-maximizer"

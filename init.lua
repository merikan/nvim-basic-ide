
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  my awesome neovim configuration
--
--    ███╗   ███╗███████╗██████╗ ██╗██╗  ██╗ █████╗ ███╗   ██╗
--    ████╗ ████║██╔════╝██╔══██╗██║██║ ██╔╝██╔══██╗████╗  ██║
--    ██╔████╔██║█████╗  ██████╔╝██║█████╔╝ ███████║██╔██╗ ██║
--    ██║╚██╔╝██║██╔══╝  ██╔══██╗██║██╔═██╗ ██╔══██║██║╚██╗██║
--    ██║ ╚═╝ ██║███████╗██║  ██║██║██║  ██╗██║  ██║██║ ╚████║
--    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
--
--
--  Peter Merikan
--  github.com/merikan
--  https://merikan.com
--
-- to reset all the shit
-- $ rm -rf ~/.local/share/nvim && rm -rf ~/.config/nvim/plugin && rm -rf ~/.cache/nvim
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

require "user.plugins.impatient"    -- try to load impatient first
require "user.core.globals"         -- load global functions
require "user.core.options"         -- load my settings
require "user.plugins"              -- install and configure plugins
require "user.lsp"                  -- install and configure lsp
require "user.core.keymaps"         -- load my keybindings
require "user.core.autocommands"    -- register autocommands
require "user.core.colorscheme"     -- set color scheme

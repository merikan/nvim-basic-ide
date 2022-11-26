-- https://github.com/goolord/alpha-nvim
-- https://github.com/goolord/alpha-nvim/discussions/16
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
  dashboard.section.header.val = {
    [[                                                          ]],
    [[                                                          ]],
    [[ ███╗   ███╗███████╗██████╗ ██╗██╗  ██╗ █████╗ ███╗   ██╗ ]],
    [[ ████╗ ████║██╔════╝██╔══██╗██║██║ ██╔╝██╔══██╗████╗  ██║ ]],
    [[ ██╔████╔██║█████╗  ██████╔╝██║█████╔╝ ███████║██╔██╗ ██║ ]],
    [[ ██║╚██╔╝██║██╔══╝  ██╔══██╗██║██╔═██╗ ██╔══██║██║╚██╗██║ ]],
    [[ ██║ ╚═╝ ██║███████╗██║  ██║██║██║  ██╗██║  ██║██║ ╚████║ ]],
    [[ ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ]],
    [[                                                          ]],
    [[ Peter Merikan  (https://merikan.com)                     ]],
    [[ github.com/merikan                                       ]],
  }
dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
  dashboard.section.footer.val = {
    "                                                                                       ",
    "                                                                                       ",
    "                                                                                       ",
    "                                                                                       ",
    "In software development, complexity might be admired but simplicity is always rewarded.",
  }

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

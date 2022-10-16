-- colorscheme to use 
-- local colorscheme = "tokyonight-night"
-- local colorscheme = "darcula"
local colorscheme = "gruvbox-material"
ok, scheme_options = pcall(require, "user.schemes." .. colorscheme) -- load options for colorscheme (colorscheme/<scheme_name>.setup())
if ok then
  print("loaded options for " .. colorscheme)
else
  print("no personal options for color scheme " .. colorscheme)
end
-- use colorscheme
vim.cmd( "colorscheme " .. colorscheme)
-- local _, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

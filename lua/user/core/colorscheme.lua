-- colorscheme to use
local colorscheme = "gruvbox-material"
-- load custom settings for color schemes if available
local scheme = prequire("user.colorschemes." .. colorscheme)
if scheme then
  scheme.setup()
end
-- set colorscheme
pcall(vim.cmd, "colorscheme " .. colorscheme)

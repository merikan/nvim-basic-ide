-- colorscheme to use
local colorscheme = "gruvbox-material"
-- load custom settings for color schemes if available
ok, scheme = pcall(require, "user.colorschemes." .. colorscheme)
if ok then
  scheme.setup()
end
-- set colorscheme
_, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

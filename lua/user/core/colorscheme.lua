-- set colorscheme to use
local colorscheme = "darcula"
-- load color schemes custom settings if available
ok, scheme = pcall(require, "user.colorschemes." .. colorscheme)
if ok then
  scheme.setup()
end
-- set colorscheme
_, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

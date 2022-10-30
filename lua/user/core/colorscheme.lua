-- colorscheme to use
-- local colorscheme = "tokyonight-night"
local colorscheme = "darcula"
-- local colorscheme = "gruvbox-material"
ok, scheme = pcall(require, "user.colorschemes." .. colorscheme)
if ok then
  scheme.setup()
end
-- set colorscheme
ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

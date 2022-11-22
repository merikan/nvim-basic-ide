local au = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup

--Highlight yanked text for a short time
au('TextYankPost', {
  -- group = ag('yank_highlight', {}),
  -- pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup='Visual', timeout=300 }
  end,
})


-- au({ "FileType" }, {
-- 	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
-- 	callback = function()
-- 		vim.cmd([[
--       nnoremap <silent> <buffer> q :close<CR> 
--       set nobuflisted 
--     ]])
-- 	end,
-- })
--
-- au({ "FileType" }, {
-- 	pattern = { "gitcommit"},
-- 	callback = function()
-- 		vim.opt_local.wrap = true
-- 		vim.opt_local.spell = true
-- 	end,
-- })
--
-- au({ "FileType" }, {
-- 	pattern = { "markdown" },
-- 	callback = function()
-- 		vim.opt_local.wrap = true
-- 		vim.opt_local.spell = true
-- 	end,
-- })
--
--
-- vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
-- -- vim.api.nvim_create_autocmd({ "BufEnter" }, {
-- --   callback = function()
-- --     vim.cmd [[
-- --       if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- --     ]]
-- --   end,
-- -- })
--
-- au({ "VimResized" }, {
-- 	callback = function()
-- 		vim.cmd("tabdo wincmd =")
-- 	end,
-- })
--
-- au({ "CmdWinEnter" }, {
-- 	callback = function()
-- 		vim.cmd("quit")
-- 	end,
-- })
-- au({ "BufWinEnter" }, {
-- 	callback = function()
-- 		vim.cmd("set formatoptions-=cro")
-- 	end,
-- })
--
-- au({ "BufWritePost" }, {
-- 	pattern = { "*.java" },
-- 	callback = function()
-- 		vim.lsp.codelens.refresh()
-- 	end,
-- })
--
-- au({ "VimEnter" }, {
-- 	callback = function()
-- 		vim.cmd("hi link illuminatedWord LspReferenceText")
-- 	end,
-- })
--
-- -- pause illuminate if large file
-- au({ "BufWinEnter" }, {
-- 	callback = function()
-- 	local line_count = vim.api.nvim_buf_line_count(0)
-- 		if line_count >= 5000 then
-- 			vim.cmd("IlluminatePauseBuf")
-- 		end
-- 	end,
-- })
--

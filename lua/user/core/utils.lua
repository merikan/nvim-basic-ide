-- https://github.com/quantumsnowball/nvim/tree/master/lua/plugins/editing/layout
-- simple custom function to toggle maximize pane and restore
local isZoomed = false

local function toggleMaximize()
    if (isZoomed) then
        vim.cmd 'wincmd ='
    else
        vim.api.nvim_win_set_width(0, 99999)
        vim.api.nvim_win_set_height(0, 99999)
    end
    isZoomed = not isZoomed
end

-- local map = require('utils').map
vim.keymap.set('n', 'gm', toggleMaximize)
vim.keymap.set('n', '<leader>z', toggleMaximize)

-- Zoom / Restore windws
-- vim.cmd([[
-- function! s:ZoomToggle() abort
--     if exists('t:zoomed') && t:zoomed
--         execute t:zoom_winrestcmd
--         let t:zoomed = 0
--     else
--         let t:zoom_winrestcmd = winrestcmd()
--         resize
--         vertical resize
--         let t:zoomed = 1
--     endif
-- endfunction
-- command! ZoomToggle call s:ZoomToggle()
-- ]])


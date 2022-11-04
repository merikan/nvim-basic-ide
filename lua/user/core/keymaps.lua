local keymap = vim.keymap.set
local opts = { silent = true } -- Silent keymap option

-- set leader key(s)
keymap('n', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ","

-- clear highlightning with C-l or double Esc
keymap('n', '<silent> <C-l>', ':nohl<CR><C-l>')
-- clear highlighting on escape in normal mode
keymap('n', '<esc>', ':noh<CR>')
-- map hh top escape b/c it's faster to reach and type
keymap('i', 'hh', '<ESC>')
-- toggle cursorline and cursorcolumn
keymap('n', '<Leader>tc',':set cursorline! cursorcolumn!<CR>')
-- Alternate way to save
keymap('n', '<C-s>', ':w<CR>')
-- Alternate way to quit
keymap('n', '<C-Q>', ':q!<CR>')

-- clear highlightning with C-l or double Esc
keymap('n', '<silent> <C-l>', ':nohl<CR><C-l>')
-- clear highlighting on escape in normal mode
keymap('n', '<esc>', ':noh<CR>')
-- map hh top escape b/c it's faster to reach and type
keymap('i', 'hh', '<ESC>')
-- toggle cursorline and cursorcolumn
keymap('n', '<Leader>tc',':set cursorline! cursorcolumn!<CR>')
-- Alternate way to save
keymap('n', '<C-s>', ':w<CR>')
-- Alternate way to quit
keymap('n', '<C-Q>', ':q!<CR>')

-- make Y behave like C and D
keymap('n', 'Y', 'y$')
-- delete without yanking
keymap('n', '<leader>d', '"_d')
keymap('v', '<leader>d', '"_d')
-- paste without yanking
keymap('v', '<leader>p', '"_dP')
-- reselect pasted text
keymap('n', 'gp', '[v`]')
-- keep current line centered when jumping
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')
-- keep cursor in position when joining
keymap('n', 'J', 'mzJ`z')
keymap('v', 'J', 'mzJ`z')
-- repeatable indenting
keymap('n', '>', 'V><Esc>')
keymap('n', '<', 'V<<Esc>')
keymap('v', '>', '>gv')
keymap('v', '<', '<gv')
-- duplicate line(s) with Alt+d
if vim.fn.has('mac') then -- option != alt
  keymap('i', '∂','<Esc>yypi')
  keymap('n','∂','<Esc>yyp')
  keymap('v','∂', 'oYPgv<Esc>')
else
  keymap('i', '<A-d>','<Esc>yypi')
  keymap('n','<A-d>','<Esc>yyp')
  keymap('v','<A-d>', 'oYPgv<Esc>')
end
-- move line(s) with Alt+hjkl
if vim.fn.has('mac') then -- because option != alt
  -- Option-key is not Alt-key
  -- > US/ANSI keyboard (see alacritty.yaml)
  keymap('n', '∆', ':m .+1<CR>==')
  keymap('n', '˚', ':m .-2<CR>==')
  keymap('i', '∆', '<Esc>:m .+1<CR>==gi')
  keymap('i', '˚', '<Esc>:m .-2<CR>==gi')
  keymap('v', '∆', ':m \'>+1<CR>gv=gv')
  keymap('v', '˚', ':m \'<-2<CR>gv=gv')
else
  keymap('n', '<A-j>', ':m .+1<CR>==')
  keymap('n', '<A-k>', ':m .-2<CR>==')
  keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
  keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
  keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv')
  keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv')
end
-- buffers navigation
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")
keymap('n', '<C-tab>', ':bnext<CR>')
keymap('n', '<C-S-tab>', ':bprevious<CR>')
-- window navigation (disbled since we are using tmux plugin)
-- keymap("n", "<C-h>", "<C-w>h")
-- keymap("n", "<C-j>", "<C-w>j")
-- keymap("n", "<C-k>", "<C-w>k")
-- keymap("n", "<C-l>", "<C-w>l")
-- Terminal window navigation
keymap('t', '<C-h>', '<C-\\><C-N><C-w>h')
keymap('t', '<C-j>', '<C-\\><C-N><C-w>j')
keymap('t', '<C-k>', '<C-\\><C-N><C-w>k')
keymap('t', '<C-l>', '<C-\\><C-N><C-w>l')
keymap('t', '<Esc>', '<C-\\><C-n>')


--------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gui", "<cmd>lua _GITUI_TOGGLE()<CR>", opts)
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- ====================================================
--  map     : root of all recursive mappings
--  noremap : no recursive map
--  {m}{nore}map
--
--  Mode letters:
--    n: normal only
--    v: visual and select
--    o: operator-pending
--    x: visual only
--    s: select only
--    i: insert
--    c: command-line
--    t: terminal window
--    l: insert, command-line, regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)



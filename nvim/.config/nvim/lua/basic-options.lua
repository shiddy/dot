-- this just makes the keymaps cleaner to read here
local map = vim.keymap.set

-- Note, a lot of these values I have just copied from my old vimscript stuff. I know I can update most to vim.opt or vim.wo or w/e but I don't want to spend my time editing my editor... leave that to a more bored me.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- I like to be able to remove a highlighted bit of text with the leader key rather than searching asdf over and over, <leader>h for highlight
map("n", "<leader>h", ":nohlsearch<CR>", {})

-- Testing this out where the default register is not * or + and is instead the system buffer
-- vim.opt.clipboard = "unnamedplus"

-- Back in the day I would include this so that I would break my habit of using the arrow keys."
-- Alas... I now have a crazy split keyboard, and little did I know that the right hand does not lay on the hjkl keys for ergonomics, it lays on the jkl; keys.
-- vim.cmd('noremap <Up> <NOP>')
-- vim.cmd('noremap <Down> <NOP>')
-- vim.cmd('noremap <Left> <NOP>')
-- vim.cmd('noremap <Right> <NOP>')

-- Move through windows with control and movement keys
-- map('n', '<C-h>', ':wincmd h<CR>')
-- map('n', '<C-j>', ':wincmd j<CR>')
-- map('n', '<C-k>', ':wincmd k<CR>')
-- map('n', '<C-l>', ':wincmd l<CR>')
--
-- Move through windows with control and arrow keys
map('n', '<C-Left>', ':wincmd h<CR>')
map('n', '<C-Down>', ':wincmd j<CR>')
map('n', '<C-Up>', ':wincmd k<CR>')
map('n', '<C-Right>', ':wincmd l<CR>')

-- show a highlight of the line your cursor is on by default
vim.opt.cursorline = true

-- if you are familiar with buffers, this will make sure that you write your changes when you jump between buffers.
-- it will not auto-write if you exit you can use autowriteall for that, but this makes the jump between multiple files
-- less cumbersome
vim.opt.autowrite = true

-- from the docs
--   When a file has been detected to have been changed outside of Vim and
--   it has not been changed inside of Vim, automatically read it again.
--   When the file has been deleted this is not done, so you have the text
--   from before it was deleted.
-- this can be a curse if you open multiple instances of something, but will at least keep you from overwriting changes elsewhere
vim.opt.autoread = true

-- I like tabs as 2 spaces, because everyone keeps making me write yaml and I have given up.
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- vim.cmd("set shiftround=true")

-- This allows you to tab complete stuff in various ways. Back before LSPs were a thing and you needed to spawn 4 daemons to edit a text file you could do things like autocomplete text with just <C-p> but hey why not just do everything in lua files... I'm not mad.
vim.cmd("set wildmenu")

-- This will only search case sensitive when provided capitols in a search
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
-- do highlighting smartly
vim.cmd("set hls")

-- line numbers are nice when showing code to people
vim.cmd("set number")
-- relative line numbers are nice when using relative jumps
vim.cmd("set rnu")

-- I"m not a person that wants a plugin for statusline stuff
--vim.cmd("set statusline=%P\ %f\ %m")
vim.cmd("set showcmd")
--vim.cmd("set fillchars=vert:\ ,stl:\ ,stlnc:\")
vim.cmd("set laststatus=2")
vim.cmd("set noshowmode")

-- I hate not seeing tabs and trailing spaces
vim.cmd("set listchars=tab:>-,trail:-")

-- Default vim does not auto-match greater-than and less-than
vim.cmd("set matchpairs+=<:>")

-- backspace before vim 8.0 needed to include eol, start and indent, but now it seems to be working so that's a plus

-- It's nice to be able to use the h and l keys or arrow keys on the first or last character of a line and wrap them around
-- I've been told this can break some plugin functionality... but I have not seen it happen
-- vim.cmd("set whichwrap+=h,l,<,>")
vim.cmd("set whichwrap+=<,>")

-- You will have to create the backup directory but this keeps your backups in a
-- single place on your filesystem, so you don't have to ignore all the .swp
-- files in your version control software.
--
-- XXX This does not work with the tilde, it just makes local files with a tilde
-- mkdir -p ~/.vim/backup
-- vim.opt.backupdir = "~/.config/nvim/.backup/"

-- mappings for rust dap
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint"})
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue/start" })
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dd", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = "Debugger set conditional breakpoint" })
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

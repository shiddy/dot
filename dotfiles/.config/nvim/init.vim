"________________________________________________________________
"           __    _     __    __     _                 _
"     _____/ /_  (_)___/ /___/ /_  _( )_____    _   __(_)___ ___
"    / ___/ __ \/ / __  / __  / / / /// ___/   | | / / / __ `__ \
"   (__  ) / / / / /_/ / /_/ / /_/ / (__  )   _| |/ / / / / / / /
"  /____/_/ /_/_/\__,_/\__,_/\__, / /____/   (_)___/_/_/ /_/ /_/
"                           /____/
"________________________________________________________________


"_______________________________________
"   ____ ____ ___ ___ _ _  _ ____ ____
"   [__  |___  |   |  | |\ | | __ [__
"   ___] |___  |   |  | | \| |__] ___]
"_______________________________________

" This makes Vim work better rather than gimping it to vi's standards
set nocompatible

"filetype detection. This is kinda a plugin, but it's in vim by default so
"¯\(ツ)/¯"
filetype plugin on

" Do syntax color coating
syntax on

" This makes ambiguous searches tab completable
set wildmenu

"This will only search case senstive when provided capitals in a search
set ignorecase
set smartcase
set hls

" I like tabs as 4 spaces when not in paste mode.
set tabstop=4
set shiftwidth=4
set expandtab

" Show line numbers on the side of the screen
set number

" Make the vim statusline clean
set statusline=%=%P\ %f\ %m
set showcmd
set fillchars=vert:\ ,stl:\ ,stlnc:\
set laststatus=2
set noshowmode

"I hate not seeing tabs and trailing spaces
set listchars=tab:>-,trail:-
set list

"I hate not having the creater-thans not match like brackets
set matchpairs+=<:>

"I hate it when backspace will not wrap
set backspace=indent,eol,start

"I hate it when I can't use movement keys at the end and beginning of lines."
set whichwrap+=h,l " you can use things like <,>, or [,]

"I want to break your habit of using the arrow keys."
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" <Leader> is normally \ but I don't often use \ so I map it to space
let mapleader=" "

"Pressing the leader key (defined above) and o will close all windows execpt
"the one you are currently in"
noremap <Leader>o :only<CR>

"Pressing the leader key (defined above) and q will save and quit
noremap <Leader>q :wq<CR>

"Pressing the leader key (defined above) and w will save
noremap <Leader>w :w<CR>

" I want to make navigation between splits work with control and h j k l
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" I don't like .swp files everywhere, so I just put them in the vim directory
" This environment variable is defined within my shell's runcommand file
set backupdir=${VIMSWAPDIR}
set directory=${VIMSWAPDIR}

" My eyes hurt all the time now.
set background=dark

" move through buffers with Ctrl+Alt+j and Ctrl+Alt+k
noremap <C-A-j> :bprev<CR>
noremap <C-A-k> :bnext<CR>

" move through buffers with gp and gn (go previous, go next)
" nnoremap gp :bprev<CR>
" nnoremap gn :bnext<CR>

" netrw is the default file manager for vim. Here are some sane settings"
let g:netrw_winsize = -28
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_banner = 0
let g:netrw_liststyle = 3


"_________________________________________
"   _  _ ____ ___ _  _ ____ _   _ ____
"   |__| |  |  |  |_/  |___  \_/  [__
"   |  | |__|  |  | \_ |___   |   ___]
"_________________________________________

" pressing F2 converts all tabs to spaces, if you like it the other way you
" can change the sed command
nnoremap <silent> <F2> :%s/\(^\s*\)\@<=\t/    /g<CR>

" pressing F3 will toggle paste mode
set pastetoggle=<F3>

" pressing F4 to toggle numbers, this can be helpful for copying in a pinch
noremap <silent> <F4> :call ToggleNu()<CR>

" It would be nice if I could just copy the current line to host's buffer
" **When on linux you can use 'xsel --clipboard --input' rather than pbcopy
"    assuming you have X installed.**
" noremap <F5> !! pbcopy<CR> u
noremap <F5> !! xsel --clipboard --input<CR> u


" " I don't personally like wordwrap or colorcolumn. This will change the
" " background of characters at and after overlinenum with the color in
" overlinecolor
" let g:overlinenum=80
" let g:overlinebg=16
" " normally colors are 1-15 but 16 is #000 which is nice for me"
" " More colors: http://vim.wikia.com/wiki/View_all_colors_available_to_gvim
noremap <silent> <F6> :call ToggleOverLineHighlight()<CR>

hi ColorColumn ctermbg=lightgrey guibg=lightgrey
nnoremap <silent> <F6> :execute "set colorcolumn="
                  \ . (&colorcolumn == "" ? "80" : "")<CR>

" I want to be able to strip all whitespaces from the end of lines
nnoremap <F7> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
inoremap <F7> <Esc>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>i

" I want to insert the date when I press F9
nmap <F9> i<C-R>=strftime("%b %d %Y %p")<CR><Esc>

" I want to underline the line I am on with underscores when I press _
nmap _ yypVr_

" Adding a whole plugin for a snippet is total dorby move. This makes it so
" you can just define a snippet as something starting with a comma and have it
" read from a ~/templates/* directory.
"
" so if I have a file cswitch in ~/templates I can just type ,cswitch and
" insert it into the current file.
" nnoremap ,cswitch :-1read ~/.config/nvim/templates/clang_switch<CR>

"________________________________________________
"    ____ _  _ _  _ ____ ___ _ ____ _  _ ____
"    |___ |  | |\ | |     |  | |  | |\ | [__
"    |    |__| | \| |___  |  | |__| | \| ___]
"________________________________________________

" Toggle numbers
let g:nuIndex=1
function! ToggleNu()
  let g:nuIndex=g:nuIndex+1
  if g:nuIndex>=2 | let g:nuIndex=0 | endif
  if g:nuIndex==0
    set nonu
  else
    set nu
  endif
endfunction

" " Change the background of characters over your specified overlinenum
" " This is useful if you don't like the colourcolumn getting in the way
" let g:overLineIndex = 1
" function! ToggleOverLineHighlight()
"   let overlineregex= '/\%>' . g:overlinenum . 'v.*/'
"   let g:overLineIndex=g:overLineIndex+1
"   if g:overLineIndex>=2 | let g:overLineIndex=0 | endif
"   if g:overLineIndex == 0
"     execute "highlight OverLength ctermbg=" . g:overlinebg
"     execute "match OverLength " . overlineregex
"   else
"     match none
"   endif
" endfunction
" autocmd BufEnter * call ToggleOverLineHighlight()

"_______________________________________
"    ___  _    _  _ ____ _ _  _ ____
"    |__] |    |  | | __ | |\ | [__
"    |    |___ |__| |__] | | \| ___]
"_______________________________________

" "!! I leave these commented out to be nice to those who don't like to add
" "things to vim. ideally you don't have to, but sometimes there are creatue
" "comforts.

" "Installation:
" "I use vim-plug to handle plugins https://github.com/junegunn/vim-plug check
" "there for installation steps
"
" "alternatively, this will install vim-plug if it does not exist on your machine
" "one might find a curl execution in a vimrc onerous. but hey it's commented
" "out for a reason
"
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -flo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd vimenter * pluginstall --sync | source $myvimrc
"endif

"I try to keep these minimal. Ordered in their relative use to me
" call plug#begin('${HOME}/.config/nvim/plugged')
"   Plug 'tpope/vim-commentary'    " Comment out things with hotkeys (gcc to comment)
"   Plug 'tpope/vim-surround'      " Surround things within nvim (quotes around words)
"   Plug 'ap/vim-buftabline'       " Show buffers at the top of the screen
"   Plug 'w0rp/ale'                " Linting plugin (Requires some linters below)
"   Plug 'tpope/vim-fugitive'      " Git integration in vim buffers
"   Plug 'airblade/vim-gitgutter'  " Show git diff information in the gutter
"   Plug 'vim-scripts/DrawIt'      " Draw lines and boxes

" call plug#end()

" "ALE requires you to have the cli tools of the linters. here are the ones
" "that I have used:
"
" "  python
" "  * flake8 (pip)
"
" "  MARKDOWN
" "  * markdownlint-cli (npm)
"
" "  VIM
" "  * vint (pip)
"
" "  BASH
" "  * shellcheck (package-manager)
"
" "  YAML
" "  * yamllint (package-manager)
" "  * swaglint (npm)
"
" "  ENGLISH
" "  * alex (npm)
"
" "  JSON
" "  * fixjson (npm)
"
" "  DOCKER
" "  * hadolint (package-manager)


" Ale configuration for pep

" set the max-line-length to something more reasonable
" let g:ale_python_flake8_options = '--max-line-length=128'

" If you want to ignore the line length (E501) this is what you want
" The rest of the errors are the defaults for flake8
" let g:ale_python_flake8_options = '--ignore=E24,E121,E123,E126,E226,E704,W503,W504,E501'


" "Ale symbols
" let b:ale_fix_on_save = 1
" let g:ale_sign_error = '✖'
" let g:ale_sign_info = '✚'
" let g:ale_sign_warning = '✚'

" "Some file extensions need manually specified linters
" let g:ale_linter_aliases = {'tmpl': 'yaml'}
" let g:ale_linters = {'tmpl': ['yamllint', 'swaglint']}

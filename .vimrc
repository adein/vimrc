set nocompatible
behave mswin


" Automatic reloading of vimrc file
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost _vimrc source %

" Use Pathogen to manage plugins
" mkdir ~/vimfiles/autoload
" mkdir ~/vimfiles/bundle
" cd ~/vimfiles/autoload
" git clone git://github.com/tpope/vim-pathogen.git
execute pathogen#infect()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rebind <Leader> key for extra keybinds
let mapleader = ","

" Quick quit commands
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR>  " Quit all windows

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Bind ctrl+<movement> keys to move between windows, instead of ctrl+w+<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Fast movement between tabs
map <Leader>n <ESC>:tabprevious<CR>
map <Leader>m <ESC>:tabnext<CR>

" Map sort function
vnoremap <Leader>s :sort<CR>

" Better (un)indentation of code blocks
vnoremap < <gv
vnoremap > >gv

" Clear search highlighting
noremap <silent><Leader>/ :nohls<CR>

" I can type :help on my own, thanks.
noremap <F1> <Esc>

" Map Q to repeat the last macro
map Q @@


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy/Paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL-X Cut
vnoremap <C-X> "+x

" CTRL-C Copy
vnoremap <C-C> "+y

" CTRL-V Paste
map <C-V>  	"+gP
cmap <C-V>		<C-R>+

" Paste mapping
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" Better copy and paste
set pastetoggle=<F2>
set clipboard=unnamed

" Turn off autoselect for CTRL-V
set guioptions-=a

" Paste mode - insert typed text literally
set paste


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable backups
set nobackup

" Disable backups when overwriting a file
set nowritebackup

" Disable swap file
set noswapfile

" Dont use backups if version management is active
"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif

" Write a backup file before overwriting a file
"set wb

" Keep backup copy after overwriting a file
"set bk

" Backup file extension
"set bex=~


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  set mousehide		" Hide the mouse when typing text
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set syntax filetype
filetype off
filetype plugin indent on

" Turn on syntax highlighting
syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Number of spaces for a tab
set tabstop=4

" Number of spaces for soft tab
set softtabstop=4

" Number of spaces for shifting text
set shiftwidth=4

" Inserting a tab inserts spaces
set sta

" Expand tabs to spaces in insert mode
set expandtab

" Turn on autoindent
set ai

" Turn on smartindent
set si

" Turn on c indent
" set cin


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command line history
set history=700

" Number of undo changes to keep track of
set ul=700

" Display incomplete commands
set showcmd

" Some commands jump to first non-blank character
set sol


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight all matches
set hlsearch

" Incremental searching
set incsearch

" Dont ignore case while searching
"set noic

" Ignore case while searching
set ignorecase

" Intelligently override ignorecase
set smartcase


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show the cursor position all the time
set ruler

" Dont wrap text across lines
set nowrap

" Dont wrap text while typing
set fo-=t

" Show the line numbers for each line
set number

" Help window height
set hh=15

" Remove toolbar
set guioptions-=T

" Show matching brackets briefly during inserting
set sm

" Tenths of seconds to show match
set mat=5

" Width of document (used by gd)
set tw=79

" Show extra whitespace at the end of lines
" Must occur before color scheme
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Set color scheme
color elflord
"color wombat256

" Show a column at 80 characters to denote where lines should end
"set colorcolumn=80
execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=233 guibg=#1c1c1c 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selection
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selection mode
set sel=exclusive

" When to start select mode
set slm=mouse,key


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backspace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Backspace in Visual mode deletes selection
vnoremap <BS> d


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set end of line format to windows
set ff=dos

" Allow writing
set write


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
" cd ~/vimfiles/bundle
" git clone git://github.com/Lokaltog/powerline.git
" set rtp+=~\vimfiles\bundle\powerline\bindings\vim
set laststatus=2
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" CtrlP
" cd ~/vimfiles/bundle
" git clone git://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height=30
let g:ctrlp_working_path_mode='ra'
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*  " Windows ('noshellslash')

" vim-fugitive - git wrapper
" cd ~/vimfiles/bundle
" git clone git://github.com/tpope/vim-fugitive.git

" Better navigation through omnicomplete option list
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" python-mode
" cd ~/vimfiles/bundle
" git clone git://github.com/klen/python-mode.git
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts=1
let g:pymode_rope_goto_def_newwin="vnew"
let g:pymode_rope_extended_complete=1
let g:pymode_syntax=1
let g:pymode_syntax_builtin_objs=0
let g:pymode_syntax_builtin_funcs=0

" Python folding
" cd ~/vimfiles/ftplugin
" wget http://www.vim.org/scripts/script.php?script_id=1494
set nofoldenable


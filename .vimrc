"Enable the package manager pathogen, requires downloading a package
execute pathogen#infect()
syntax on
filetype plugin indent on

"Use papercolor color scheme, requires downloading a package #TODO add to setup
set t_Co=256
set background=light
colorscheme PaperColor


"Map space as the leader key
map <Space> <leader>

"Switch buffers using leader key shortcuts
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

"Edit README file for project
map <leader>read :e README.txt<cr>

"Easy saving with leader
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>o 3o
nnoremap <leader>O 3O

"Resizing windows with the leader key
nnoremap <leader><Up> :resize +3<cr>
nnoremap <leader><Down> :resize -3<cr>
nnoremap <leader><Right> :vertical resize +3<cr>
nnoremap <leader><Left> :vertical resize -3<cr>

"Switch between relative/fixed line numbering vim
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <leader>ln :call NumberToggle()<cr> 
"Enable spellchecking w/ <leader> + ss
set spelllang=en_us
set spellfile=$HOME/Dropbox/dotfiles/vim/spell/en.utf-8.add

map <leader>ss :setlocal spell!<cr>

"Attempt to soft word wrap
set wrap linebreak nolist

"NERDTree options
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 20
let NERDTreeShowHidden = 1
let NERDTreeNaturalSort = 1
let NERDTreeMouseMode = 2

"NERDTree buffs
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent>  <leader>v :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_int=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif "Open NERDTree if Vim is called w/o options

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "If NERDTree is the only thing left open, automatically close VIM on :q
"--------------"

"General usibility improvments for vim
set number "show line number
set visualbell "dont beep
set smarttab 
set ignorecase
set showmatch "Show matching parenthesis/brackets
set cursorline
set mouse=a "turn on mouse support
set mousemodel=popup

"Add a little space to the left
set foldcolumn=1
"Show key commands in bottom-right
set showcmd

"Settings recommended by Stanford cs107 handout
set tabstop=4
set expandtab
set shiftwidth=4

"Highlight the cursor line
set cursorline

"Set graphical autocompletion
set wildmenu

"Search behavior
set hlsearch
set incsearch

"better indenting
set autoindent
set smartindent

"force statusline to appear
set laststatus=2

"move vertically by visual line
nnoremap j gj
nnoremap k gk

"Set how new horizontal and vertical splits open
set splitright
set splitbelow

"Show 100 characters
set textwidth=100
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1
"Desired features
set smartindent

"Section for abreviations
iabbrev shebang #! /bin/bash


"Seamlessly switch between vim and tmux using C+directional keys
"Code taken from https://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits
if exists('$TMUX')
    function! TmuxOrSplitSwitch(wincmd, tmuxdir)
        let previous_winnr = winnr()
        silent! execute "wincmd " . a:wincmd
        if previous_winnr == winnr()
            call system("tmux select-pane -" . a:tmuxdir)
            redraw!
        endif
    endfunction

    let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
    let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
    let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

    nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
    nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
    nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
    nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
endif

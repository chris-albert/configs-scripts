syntax on

set hidden
set wildmenu
set hlsearch
set number
set relativenumber
set cursorline  
"set cursorcolumn

set shiftwidth=2
set expandtab
set tabstop

set incsearch
set ignorecase
set smartcase
set noswapfile

set spell

set encoding=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline

:let mapleader = ","
" Open .vimrc in pane for editing
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source .vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>
" Put " around current word
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

let g:airline#extensions#tabline#enabled = 1

"vim-plug config
call plug#begin('~/.vim/plugged')
"airline (gutter info)
Plug 'vim-airline/vim-airline'
"themes for airline
Plug 'vim-airline/vim-airline-themes'
"left nav
Plug 'scrooloose/nerdtree'
"async lib
Plug 'Shougo/vimproc'
"colorschmes
Plug 'flazz/vim-colorschemes'
"git wrapper
Plug 'tpope/vim-fugitive'
"git gutter
Plug 'airblade/vim-gitgutter'
"dracula theme
Plug 'dracula/vim'
"Fast fuzzy search
Plug 'junegunn/fzf'
"project maker
Plug 'neomake/neomake'
"Tab completion
Plug 'ervandew/supertab'
"Alignment
Plug 'godlygeek/tabular'
"""""""""""""""""""
" Haskell Plugins "
"""""""""""""""""""
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }

call plug#end()

colorscheme atom

"Syntastic config
"map <Leader>s :SyntasticToggleMode<CR>

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

" powerline symbols
let g:airline_powerline_fonts=1
let g:airline_theme='kolor'

" airline config
" customize airline section a (remove spell)
let g:airline_section_a = airline#section#create(['mode', 'crypt', ' ', 'paste', 'iminsert'])
" display buffers like tabs
let g:airline#extensions#tabline#enabled=1

" nerd tree config
"let NERDTreeShowHidden=1

"GHC shortcuts
nmap <silent> <leader>hT :GhcModTypeInsert<CR>
ca ht GhcModTypeInsert
nmap <silent> <leader>hs :GhcModSplitFunCase<CR>
ca hs GhcModSplitFunCase
nmap <silent> <leader>ht :GhcModType<CR>
ca ht GhcModType
nmap <silent> <leader>hC :GhcModTypeClear<CR>
ca hC GhcModTypeClear
nmap <silent> <leader>hc :GhcModCheck<CR>
ca hc GhcModCheck

""""""""""
" Hoogle "
"""""""""" 
" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>
ca hh Hoogle

" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle 

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>
ca hi HoogleInfo

" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo 

" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>
ca hz HoogleClose

"""""""""""
" Neomake "
"""""""""""
" When writing a buffer.
call neomake#configure#automake('w')


""""""""""""
" Supertab "
""""""""""""

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"""""""""""
" Tabular "
"""""""""""
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

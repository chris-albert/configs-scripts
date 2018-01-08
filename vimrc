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
nmap <silent> hT :GhcModTypeInsert<CR>
nmap <silent> hs :GhcModSplitFunCase<CR>
nmap <silent> ht :GhcModType<CR>
nmap <silent> hC :GhcModTypeClear<CR>
nmap <silent> hc :GhcModCheck<CR>

""""""""""
" Hoogle "
"""""""""" 
" Hoogle the word under the cursor
nnoremap <silent> <leader>:hh :Hoogle<CR>

" Hoogle and prompt for input
nnoremap <leader>:hH :Hoogle 

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>:hi :HoogleInfo<CR>

" Hoogle for detailed documentation and prompt for input
nnoremap <leader>:hI :HoogleInfo 

" Hoogle, close the Hoogle window
nnoremap <silent> <leader>:hz :HoogleClose<CR>

"""""""""""
" Neomake "
"""""""""""
" When writing a buffer.
call neomake#configure#automake('w')

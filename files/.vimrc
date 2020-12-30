" Keybinds
let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>
nnoremap <leader>y "+y<CR>
nnoremap <leader>p "+p<CR>

nnoremap <silent><leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent><leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent><leader>d	:YcmCompleter GetDoc<CR>

nmap <F1> :NERDTreeToggle<CR>

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" No delay after pressing the Esc key
set timeoutlen=1000
set ttimeoutlen=0

" Five more frequent updates than by defaults
set updatetime=750

" Display the line number, normal for the current line, relative for the others (hybrid line number)
set relativenumber
set number

" Highlight all strings that match a search
set hlsearch

" Set tabs length
set tabstop=4
set shiftwidth=4

" Auto indent when new line
set autoindent
set smartindent

" Copy/Cut to the default clipboard of the OS
set clipboard=unnamedplus

" Don't cut the line if longer than the screen's size
set nowrap

" Disable swap file
set noswapfile

" Setup the undodir -- need to create the ~/.vim/undodir directory
set nobackup
set undodir=~/.vim/undodir
set undofile

" Change colorscheme
syntax on
colorscheme badwolf 

" Plugins section
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mbbill/undotree'

call vundle#end()
filetype plugin indent on

" Options for YouCompleteMe plugin
let g:clang_library_path='/usr/lib/llvm-10/lib'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '->'
let g:ycm_confirm_extra_conf = 0

" Options for vim-airline plugin
let g:airline_theme='term'

" Options for NERDTree plugin
let NERDTreeQuitOnOpen = 1

" Hide the show mode, ie --INSERT--, --VISUAL-- and so on (need to be at the end of .vimrc, I don't know why)
set noshowmode

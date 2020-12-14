"
"   Author: Ilya Moiseev <ilya@moiseev.su>
"   Version: 7
"   Date: May 26, 2020
"

" Autocheck if vim-plug is installed, if not -- install it and re-read this
" vimrc file
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Plugin section
call plug#begin('~/.vim/plugs')     " Begin of plugin section and directory for plugins

" Colorscheme
Plug 'lifepillar/vim-solarized8'    " https://vimawesome.com/plugin/solarized-8

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin fast file search in nertdtree
Plug 'ctrlpvim/ctrlp.vim'

" Plugin for Go support
Plug 'fatih/vim-go', { 'tag': '*' } " https://github.com/fatih/vim-go

" Autocomplete plugin
Plug 'valloric/youcompleteme'

" Automatically fill paired items
Plug 'jiangmiao/auto-pairs'

" YAML syntax for Ansible
Plug 'pearofducks/ansible-vim'

" Rust language support
Plug 'rust-lang/rust.vim'

" Lua language syntax and indentation support
Plug 'tbastos/vim-lua'

" HCL (Packer, Terraform) syntax hightligher
Plug 'jvirtanen/vim-hcl'

call plug#end()                     " End of plugin section

" Various sets
syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

set encoding=UTF-8         " UTF-8
set autoindent             " Respect indentation when starting a new line.
set expandtab              " Expand tabs to spaces. Essential in Python.
set tabstop=4              " Number of spaces tab is counted for.
set shiftwidth=4           " Number of spaces to use for autoindent.
set backspace=2            " Fix backspace behavior on most terminals.
set number                 " Lines numbers
set hlsearch               " Highlight search result
set incsearch              " Incremental search
set termguicolors          " True colors
set guioptions+=a          " This is necessary to have same colorscheme in tmux with gtk3
set t_Co=256               " This is necessary to have same colorscheme in tmux with gtk3
set background=dark        " This is necessary to have same colorscheme in tmux with gtk3
set cursorline             " Cursor line
set cursorcolumn           " Cursor column
" set spell                  " Spell checking     


" Visual
colorscheme solarized8     " Change a colorscheme, was: elflord
" set guifont="DejaVu Sans Mono h:15" " Fonts settings

" Lets
" to have transparent background using solarized colorscheme
let g:solarized_termtrans=0

" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" for ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Mappings
" 
" for nerdtree
map <C-n> :NERDTreeToggle<CR>

" for YCM server restart
map <C-.> :YcmRestartServer<CR>

" for tabs
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>

" autocmd
autocmd CompleteDone * pclose

" Ansible files detection
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
augroup END

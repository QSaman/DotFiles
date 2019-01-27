set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" Plugin 'https://github.com/vim-syntastic/syntastic.git'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'lyuts/vim-rtags'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
" Plugin 'https://github.com/mileszs/ack.vim.git'
" Plugin 'https://github.com/majutsushi/tagbar.git'
" Plugin 'https://github.com/xolox/vim-easytags.git'
" Plugin 'https://github.com/xolox/vim-misc.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/Smart-Tabs'
Plugin 'vim-airline/vim-airline'
" Plugin 'https://github.com/altercation/vim-colors-solarized.git'
" Plugin 'Yggdroot/indentLine'
" Plugin 'https://github.com/vim-scripts/vim-sjson.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
" 

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


" For avoiding easytags slow down VM
"let g:easytags_syntax_keyword = 'always'
" let g:easytags_async=1
" let g:easytags_auto_highlight=0
" set backspace=indent,eol,start


" See ~/.vim/after/ftplugin directory for language-based customization:
filetype plugin indent on

" set spell

runtime ftplugin/man.vim
set t_Co=256
colorscheme wombat256

" Enabling mouse. For copy press shift and then select text with mouse
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" YouCompleteMe Shortcuts (leader is \ character):

nnoremap <leader>gD :YcmCompleter GoToDeclaration<CR>

nnoremap <leader>gt :YcmCompleter GoTo<CR>

nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>

nnoremap <leader>gT :YcmCompleter GetType<CR>

" CtrlP shortcuts:

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
" set clipboard=unnamedplus
" in insert mode you can press CTRL+r,* or CTRL+r,+ to paste form clipboard.

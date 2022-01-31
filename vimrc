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
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
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
Plugin 'nelsyeung/twig.vim'

Plugin 'bfrg/vim-cpp-modern'

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
"https://vi.stackexchange.com/questions/780/how-to-jump-between-matching-html-xml-tags 
runtime macros/matchit.vim

" Use 24-bit true color in terminal if available
if has('termguicolors')

    " Comment this line out. Note if 24-bit true color is not enabled in terminal, it makes Vim colorless.
    " For more information type :h xterm-true-color. The following links are helpful:
    " https://stackoverflow.com/questions/62702766/termguicolors-in-vim-makes-everything-black-and-white
    " https://gist.github.com/XVilka/8346728
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" colorscheme wombat256
" colorscheme molokai

" For gruvbox settings refer to:
" https://github.com/morhetz/gruvbox/wiki/Configuration 

" Comment the following line if you terminal doesn't support italics. For
" example if you connect to a remote server using ssh and grubvox isn't
" rednered properly
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
" TODO Fix undercurl in terminal Vim (syntax error in youcompleteme). The
" current workaround is to disable undercurl before enabling gruvbox and
" setting underline as cterm after setting gruvebox
let g:gruvbox_undercurl = 1
" let g:gruvbox_invert_indent_guides = 1 
" let g:gruvbox_invert_tabline = 1
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_guisp_fallback = 'bg'
colorscheme gruvbox
" TODO If you could enable undercurl in terminal, delete the follwoing line
" highlight SpellBad cterm=underline
set background=dark

" Enabling mouse. For copy press shift and then select text with mouse
set mouse+=a
if &term =~ '^screen' || &term =~ '^tmux'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" YouCompleteMe Shortcuts (leader is \ character):

nnoremap <leader>gD :YcmCompleter GoToDeclaration<CR>

nnoremap <leader>gt :YcmCompleter GoTo<CR>

nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>

nnoremap <leader>gT :YcmCompleter GetType<CR>
nnoremap <leader>f :YcmCompleter Format<CR>

let g:ycm_auto_hover=''

" CtrlP Settings:

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1

" https://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders/22784889#22784889
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" If you want to actually insert all characters, including special codes such as
" Ctrl-H, you need to press Ctrl-R twice
" http://vim.wikia.com/wiki/Inserting_text_in_multiple_lines 

" set clipboard=unnamedplus

" <C-V> in insert mode:
inoremap <C-v> <C-r><C-r>+
" <C-v> in normal mode:
nnoremap <C-v> a<C-r><C-r>+
" <C-v> in visual mode:
vnoremap <C-v> d<ESC>i<C-r><C-r>+
" <C-c> in visual mode:
vnoremap <C-c> "+y
" <C-a> in insert mode
inoremap <C-a> <ESC>ggVG
" <C-a> in normal mode:
nnoremap <C-a> <ESC>ggVG
" in insert mode you can press 'CTRL-r *' or 'CTRL-r +' to paste form clipboard.

" Enable smart case:
set ignorecase
set smartcase
set incsearch

set listchars=tab:<->,eol:$,trail:.,nbsp:.,extends:>,precedes:<
let g:ctrlp_working_path_mode = 0

" Tabs are not buffers!
set hidden

" Mintty settings (Cygwin or Msys2)***************
" syntax on
" https://superuser.com/questions/634326/how-can-i-get-a-block-cursor-in-vim-in-the-cygwin-terminal:
" let &t_ti.="\e[1 q"
" let &t_SI.="\e[5 q"
" let &t_EI.="\e[1 q"
" let &t_te.="\e[0 q"

" set encoding=utf-8

" End of Mintty Settings***************

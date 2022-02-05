call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'tpope/vim-fugitive'
" Plug 'Valloric/YouCompleteMe'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/a.vim'
Plug 'vim-airline/vim-airline'
Plug 'nelsyeung/twig.vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-rhubarb'


" Initialize plugin system
call plug#end()

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

"nnoremap <leader>gD :YcmCompleter GoToDeclaration<CR>

"nnoremap <leader>gt :YcmCompleter GoTo<CR>

"nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>

"nnoremap <leader>gT :YcmCompleter GetType<CR>
"nnoremap <leader>f :YcmCompleter Format<CR>

"let g:ycm_auto_hover=''

" ******************************************************************************
" asyncomplete settings:
"
" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Force refresh completion
imap <c-space> <Plug>(asyncomplete_force_refresh)
" For Vim 8 (<c-@> corresponds to <c-space>):
" imap <c-@> <Plug>(asyncomplete_force_refresh)

" Preview Window
"
" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview

" To auto close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" ******************************************************************************
" vim-lsp settings:
"
" Language Server Protocol (LSP)
"
" Python: https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Python
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
        \ })
endif

" Clangd: C/C++ https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Clangd
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

" Bash: https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Bash
if executable('bash-language-server')
  augroup LspBash
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'allowlist': ['sh'],
          \ })
  augroup END
endif

" Docker: https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Docker
if executable('docker-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'docker-langserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
        \ 'whitelist': ['dockerfile'],
        \ })
endif

" HTML: https://github.com/prabirshrestha/vim-lsp/wiki/Servers-HTML
if executable('html-languageserver')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'html-languageserver',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
    \ 'whitelist': ['html'],
  \ })
endif

" CSS: https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Css
if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
endif

" TypeScript/JavaScript: https://github.com/prabirshrestha/vim-lsp/wiki/Servers-TypeScript
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx', 'typescriptreact'],
        \ })
endif

" Vim: https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Vim
if executable('vim-language-server')
  augroup LspVim
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'vim-language-server',
        \ 'cmd': {server_info->['vim-language-server', '--stdio']},
        \ 'whitelist': ['vim'],
        \ 'initialization_options': {
        \   'vimruntime': $VIMRUNTIME,
        \   'runtimepath': &rtp,
        \ }})
  augroup END
endif

" Copied from https://github.com/prabirshrestha/vim-lsp
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <leader>gd <plug>(lsp-definition)
    nmap <buffer> <leader>gs <plug>(lsp-document-symbol-search)
    nmap <buffer> <leader>gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <leader>gr <plug>(lsp-references)
    nmap <buffer> <leader>gi <plug>(lsp-implementation)
    nmap <buffer> <leader>gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <leader>[g <plug>(lsp-previous-diagnostic)
    nmap <buffer> <leader>]g <plug>(lsp-next-diagnostic)
    nmap <buffer> <leader>K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ******************************************************************************
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

if executable("ag")
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
endif

" fzf shortcuts
nnoremap <C-p> :Files<Cr>
nnoremap <C-l> :Buffers<Cr>

" For more information try :h feature-list
" For Linux-specific use has("linux")
if has("macunix") || has("mac")
	" echo 'mac or macunix'
	syntax on
	set backspace=indent,eol,start
	set hls
elseif has("win32") || has("win32unix")
	" echo 'win32 or win32unix'
	syntax on
	" https://superuser.com/questions/634326/how-can-i-get-a-block-cursor-in-vim-in-the-cygwin-terminal:
	let &t_ti.="\e[1 q"
	let &t_SI.="\e[5 q"
	let &t_EI.="\e[1 q"
	let &t_te.="\e[0 q"

	set encoding=utf-8
endif

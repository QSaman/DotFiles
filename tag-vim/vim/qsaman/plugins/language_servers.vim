" **Note** currently this file is not loaded


" Language Server Protocol (LSP)
"
" Python: https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Python
" Note that pyls is deprecated. You should use pylsp: https://github.com/python-lsp/python-lsp-server
" pip install "python-lsp-server[pyflakes]"
if executable('pylsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pylsp': {'plugins': {'pydocstyle': {'enabled': v:false}}}}
        \ })
endif

if executable('pyright-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyright-langserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'pyright-langserver --stdio']},
        \ 'allowlist': ['python'],
        \ 'workspace_config': {
        \   'python': {
        \     'analysis': {
        \       'useLibraryCodeForTypes': v:true
        \      },
        \   },
        \ }
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


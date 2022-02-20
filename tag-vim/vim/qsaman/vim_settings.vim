if (&term =~ '^screen' || &term =~ '^tmux')
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

source ~/.vim/qsaman/plugins/asyncomplete.vim
" source ~/.vim/qsaman/plugins/language_servers.vim
source ~/.vim/qsaman/plugins/vim-lsp.vim
source ~/.vim/qsaman/plugins/vim-lsp-settings.vim

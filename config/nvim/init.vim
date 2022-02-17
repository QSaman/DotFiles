set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" set completeopt=menu,menuone,noselect

lua <<EOF
require('plugin_settings')
EOF

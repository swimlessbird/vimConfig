"plug.vim

call plug#begin("~/.vim/plugged")

Plug 'vim-airline/vim-airline'

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-scripts/taglist.vim', { 'on': 'Tlist' }

call plug#end()

IncScript config/plugged/taglist.vim

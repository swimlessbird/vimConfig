"plug.vim

call plug#begin("~/.vim/plugged")

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'dimasg/vim-mark'

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-scripts/taglist.vim', { 'on': 'Tlist' }
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

call plug#end()

IncScript config/plugged/taglist.vim
IncScript config/plugged/gutentags.vim

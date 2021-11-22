" vim 配置

" 基础配置
filetype         on                                                    " 打开文件类型检查
syntax           on                                                    " 打开语法高亮
syntax           enable                                                " 允许用指定语法高亮配色方案代替默认方案

let mapleader = "\<space>"                                             " 设置leader

" 设置主题

" 配色
set background=dark
" 主题
" 需要在/etc/profile中新增 export TERM=xterm-256color
set t_CO=256
colorscheme zenburn


" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 高亮当前行和列
set cursorline
set cursorcolumn
" 高亮搜索结果
set hlsearch
" 设置120字符提示竖线
set colorcolumn=121

"remember last update or view postion"
 " Only do this part when compiled with support for autocommands
 if has("autocmd")
 " In text files, always limit the width of text to 78 characters
 autocmd BufRead *.txt set tw=78
 " When editing a file, always jump to the last cursor position
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
 \ endif
 endif

call plug#begin('~/.vim/plugged')

" 直接插入
Plug 'vim-airline/vim-airline'                                         " 状态栏强化插件
Plug 'LunarWatcher/auto-pairs'                                         " 括号成对
Plug 'dimasg/vim-mark'                                                 " 标记
Plug 'ctrlpvim/ctrlp.vim'                                              " 查找文件插件

" 延迟插入
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }                 " 目录树插件

call plug#end()

" 插件配置
" 目录树配置
" 当nerdtree是最后一个窗口时关闭它
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" 快捷键
"
" F2 切换开关显示行号
noremap <F2> :set number! <CR>
" F3 切换开关显示相对行号
noremap <F3> :set relativenumber! <CR>
" 打开和关闭nerdtree
nnoremap <F7> :NERDTreeToggle<CR>

" sunsuwan

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
" 设置递进搜索
set incsearch
" 设置120字符提示竖线
set colorcolumn=121

" 设置缩进
set tabstop=4

" 记录文件打开位置
if has("autocmd")
 autocmd BufRead *.txt set tw=78
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
 \ endif
 endif

call plug#begin('~/.vim/plugged')

" 直接插入
Plug 'vim-airline/vim-airline'                                         " 状态栏强化插件
Plug 'dimasg/vim-mark'                                                 " 标记
Plug 'ctrlpvim/ctrlp.vim'                                              " 查找文件插件
Plug 'tpope/vim-fugitive'                                              " git插件
Plug 'ludovicchabant/vim-gutentags'                                    " 自动生成tag

" 延迟插入
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }                 " 目录树插件

call plug#end()

" 插件配置
" 目录树配置
" 当nerdtree是最后一个窗口时关闭它
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" gutentags配置
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')
" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" 快捷键
"
" F2 切换开关显示行号
noremap <F2> :set number! <CR>
" F3 切换开关显示相对行号
noremap <F3> :set relativenumber! <CR>
" 打开和关闭nerdtree
nnoremap <F7> :NERDTreeToggle<CR>

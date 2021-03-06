" 设置菜单语言
set langmenu=zh_cn

"=============
" Bundle
"=============
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Bundle "gmarik/Vundle.vim"
" 好玩的
Bundle "mattn/flappyvird-vim"
" Clojure 相关插件
Bundle "guns/vim-clojure-static"
Bundle "tpope/vim-fireplace"
Bundle "guns/vim-clojure-highlight"
Bundle "amdt/vim-niji"
" Python 相关
Bundle "klen/python-mode.git"
" C++ 相关
Bundle "XadillaX/c.vim"
Bundle "Valloric/YouCompleteMe"
" JS 相关
Bundle "walm/jshint.vim"
Bundle "moll/vim-node"
Bundle "heavenshell/vim-jsdoc"
Bundle "jelera/vim-javascript-syntax"
Bundle "pangloss/vim-javascript"
Bundle "marijnh/tern_for_vim"
Bundle "vim-scripts/JavaScript-Indent"
Bundle "beautify-web/js-beautify"
Bundle "maksimr/vim-jsbeautify.git"
Bundle "scrooloose/syntastic.git"
Bundle "guileen/vim-node-dict"
" JSON 相关
Bundle "elzr/vim-json"
Bundle "XadillaX/json-formatter.vim"
" 通用插件
Bundle "vim-scripts/grep.vim"
Bundle "rosenfeld/conque-term"
Bundle "fholgado/minibufexpl.vim"
Bundle "morhetz/gruvbox"
Bundle "scrooloose/nerdtree"
Bundle "jistr/vim-nerdtree-tabs"
Bundle "scrooloose/nerdcommenter"
Bundle "Lokaltog/vim-powerline"
Bundle "mattn/emmet-vim"
Bundle "vim-scripts/TagHighlight"
Bundle "vim-scripts/vimwiki"
Bundle "vim-scripts/taglist.vim"
Bundle "Raimondi/delimitMate"
Bundle "mileszs/ack.vim"
Bundle "godlygeek/tabular"
Bundle "junegunn/vim-easy-align"

"============
" 环境配置
"============
" 保留历史记录
set history=400

" 高亮配色
colorscheme atom-dark
set background=dark

" 命令行处于状态行
set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]\ %l,%c\ %=\ %P   
set ls=2 " 始终显示状态行

" 制表符
set tabstop=2
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

" 状态栏显示目前所执行的命令
set showcmd

" 行控制
" set linebreak
set nocompatible
" set textwidth=80
set wrap

" 行号和标尺
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" 控制台响铃
:set noerrorbells
:set novisualbell
:set t_vb= "close visual bell

" 在插入模式下使用 <BS>, <Del> <C-W> <C-U>
set backspace=indent,eol,start

" 标签页
set tabpagemax=20
set showtabline=2

" 命令补全菜单
set wildmenu

" 缩进
set autoindent
set cindent
set smartindent

" 自动重新读入
set autoread

" 代码折叠
set foldmethod=syntax

" 自动切换到文件当前目录
set autochdir

" 查找时忽略大小写
set ignorecase
set incsearch
set hlsearch

" 显示匹配的括号
set showmatch
set matchtime=5

" 实现全能补全功能，需要打开文件类型检测
" 所以打开文件类型自动检测
filetype on
filetype plugin on
filetype indent on
syntax on

" 关闭备份
set nobackup

" 在所有模式下都允许鼠标
set mouse=a

" 当前航
set cursorline

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 80 列辅助线
set cc=80
set cc+=100

" =====================
" 多语言环境
"    默认为 UTF-8 编码
" =====================
if has("multi_byte")
    set encoding=utf-8
    set fileencoding=utf-8

    if has('win32')
        language english
        let &termencoding=&encoding
    endif

    set lm=zh_tw.utf-8
    let $LANG="zh_tw"
    set fencs=ucs-bom,utf-8,gbk,cp936,latin1
    set formatoptions+=mM

    " 不使用 utf8 签名
    set nobomb

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" =====================
" 图形界面
" =====================
if has('gui_running')
    " 只显示菜单
    " set guioptions=mcr

    " 高亮光标所在的行
    set cursorline

    if has("win32")
        " Windows 兼容配置
        source $VIMRUNTIME/mswin.vim

        " f11 最大化
        map <f11> :call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)<cr>

        " 字体配置
        set guifont=Fantasque_Sans_Mono:h11:cANSI
        set guifontwide=YouYuan:h9:cGB2312
    endif

    if has("unix") && !has('gui_macvim')
        set guifont=Fantasque\ Sans\ Mono\ Regular:h14
        set guifontwide=YaHei\ Consolas\ Hybrid\ 14
    endif

    if has("mac") || has("gui_macvim")
        set guifont=Fantasque\ Sans\ Mono:h14
        set guifontwide=Yuanti\ SC:h14
        if has("gui_macvim")
            set transparency=4

            let s:lines=&lines
            let s:columns=&columns
            func! FullScreenEnter()
                set lines=999 columns=999
                set fu
            endf

            func! FullScreenLeave()
                let &lines=s:lines
                let &columns=s:columns
                set nofu
            endf

            func! FullScreenToggle()
                if &fullscreen
                    call FullScreenLeave()
                else
                    call FullScreenEnter()
                endif
            endf
        endif

        " Clojure 配置
        source $HOME/.vim/clojure.vim
    endif
endif

fun! OpenNodeProjPath()
    execute "cd " . g:nodeProjectPath
endfun

fun! OpenHexoProjPath()
    execute "cd " . g:hexoProjectPath
endfun

"=====================
" MacVim 下的配置
"=====================
if has("gui_macvim")
    " Mac 下，按 \ff 切换全屏
    map <Leader><Leader>  :call FullScreenToggle()<cr>

    " Set input method off
    set imdisable

    " Set QuickTemplatePath
    let g:QuickTemplatePath = $HOME.'/.vim/templates/'

    " call OpenNodeProjPath()

    " 自动切换到文件当前目录
    set autochdir

    " Set QuickTemplatePath
    let g:QuickTemplatePath = $HOME.'/.vim/templates/'
endif

"=============
" 键映射
"=============
let mapleader = "-"
" 关闭 / 打开 quickfix
nnoremap <leader>cc :cclose<cr>
nnoremap <leader>co :copen<cr>
" JSHint
nnoremap <leader>jshint :JSHint<cr>
" 选中当前单词
map <space> viw
" 打开 vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
" 执行 vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" 用双引号括当前单词
nnoremap <leader>" viw<esc>i"<esc>hbi"<esc>lel
" 用单引号括当前单词
nnoremap <leader>' viw<esc>i'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>i(<esc>hbi)<esc>lel
" 打开/关闭 NERDTree
nnoremap <leader>fl :NERDTreeToggle<cr>
" 打开/关闭 Tlist
nnoremap <leader>tl :TlistToggle<cr>
" 打开 nodepath
nnoremap <leader>nodepath :call OpenNodeProjPath()<cr>
" 打开 hexopath
nnoremap <leader>hexopath :call OpenHexoProjPath()<cr>
" 复制系统寄存器
nnoremap <leader>y "+y
" 粘贴系统寄存器
nnoremap <leader>p "+p
" 新建 hexo 日志
nnoremap <leader>hn :call OpenHexoProjPath()<cr>:!hexo new<space>
" 生存 hexo 静态
nnoremap <leader>hg :call HexoGenerate()<cr>
nnoremap <leader><cr> a<cr><esc>k$a<cr>
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
" Ctrl-d 插入时间
imap <C-d> <C-r>=GetTimeInfo()<cr>
" 换窗口
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
" 设置标签路径
nnoremap <leader>st :set tags+=./tags<cr>
" 切换标签页
nnoremap <S-h> gT
nnoremap <S-l> gt
nnoremap <S-j> :MBEbn<cr>
nnoremap <S-k> :MBEbp<cr>
" 关闭标签页
nnoremap <S-x> :tabc<cr>
nnoremap <S-d> :tabo<cr>
nnoremap <S-w> :MBEbw<cr>
" 取消搜索高亮
nnoremap <leader>/ :set nohlsearch<cr>
" 执行 clojure
nnoremap <C-cr> :Eval<cr>
" tag 自动生成
nnoremap <leader>tag :!ctags -R *<cr>:TlistUpdate<cr>:call AddCurrentDirToTag()<cr>
" 打开终端
map <D-r> :ConqueTermVSplit zsh<cr>

"============
" 功能函数
"============
" 获取当前目录
func GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

" 把当前目录加入 tag 目录
function! AddCurrentDirToTag()
    let tag = GetPWD() . "tags"
    execute "set tags+=" . tag
endfunction

" 打开 Hexo 的文章
function! OpenHexoPost(...)
    call OpenHexoProjPath()

    let filename = "source/_posts/" . a:1 . ".md"
    execute "e " . filename
endfunction

" 新建 Hexo 的文章
function! NewHexoPost(...)
    call OpenHexoProjPath()

    let filename = a:1
    execute "!hexo new " . filename

    call OpenHexoPost(a:1)
endfunction

" Hexo 静态文件发布
function! HexoGenerate()
    call OpenHexoProjPath()
    execute "!hexo generate"
endfunction

" 获取系统时间
func! GetTimeInfo()  
    return strftime('%Y-%m-%d %H:%M:%S')  
endfunction  

"=============
" 插件配置
"=============
" python-mode
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"
" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

" Powerline
set laststatus=2     " Always show the statusline
set t_Co=256         " Explicitly tell Vim that the terminal support 256 colors
let g:Powerline_symbols  = 'unicode'

" vimwiki
let g:vimwiki_use_mouse  = 1
let g:vimwiki_camel_case = 0
" Vimwiki
" 生成所有 HTML
map <leader>wah :VimwikiAll2HTML<cr>

" vimclojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow      = 1

" JSDoc
let g:jsdoc_allow_input_prompt     = 1

" minibufexpl
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim   = 1
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
map <Leader>mbe :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" c.vim
let  g:C_UseTool_cmake      = 'yes' 
let  g:C_UseTool_doxygen    = 'yes' 

" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
set completeopt-=preview

" Grep
nnoremap <silent> <F3> :Rgrep<CR>

" Tabular
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Node.js
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '♠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }
" syntastic - jshintrc
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args = '--config ' . $HOME . '/.jshintrc'
let g:syntastic_javascript_jshint_exec = '/usr/local/bin/jshint'
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

"=============
" 命令映射
"=============
command -nargs=+ HexoOpen :call OpenHexoPost("<args>")
command -nargs=+ HexoNew :call NewHexoPost("<args>")

"=============
" 自启动命令
"=============
"autocmd StdinReadPre * let s:std_in=1
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" 模板
augroup templates
  au!
  " read in template files
  autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/templates/skeleton.'.expand("<afile>:e")

  " parse special text in the templates after the read
  autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END

" 自定义后缀
au BufNewFile,BufRead *.gyp set filetype=json

" Vim Javascript Syntax
au FileType javascript call JavaScriptFold()

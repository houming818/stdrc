"""""""""""""""""""""""""""""""""
"  BEGIN OF VIMRC               "
"  Author: houming818           "
"  Email: houming818@qq.com     "
"  Version: 1.0                 "
"""""""""""""""""""""""""""""""""

call plug#begin()

"Plug 'https://github.com/tpope/vim-surround', {'tag': 'v2.2'} " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree', {'tag': '6.10.16'} " NerdTree
"Plug 'https://github.com/tpope/vim-commentary', {'tag': 'v1.3'} " For Commenting gcc & gc
"Plug 'https://github.com/vim-airline/vim-airline' " Status bar
"Plug 'https://github.com/lifepillar/pgsql.vim'  " PSQL Pluging needs :SQLSetType pgsql.vim
"Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
"Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}  " Auto Completion
Plug 'https://github.com/github/copilot.vim', {'branch': 'release'}  " Auto Completion
"Plug 'https://github.com/ryanoasis/vim-devicons', {'tag': 'v0.11.0'} " Developer Icons
"Plug 'https://github.com/tc50cal/vim-terminal', {'branch': 'version/1.0'} " Vim Terminal
Plug 'https://github.com/preservim/tagbar', {'tag': 'v3.0.0'} " Tagbar for code navigation
"Plug 'https://github.com/terryma/vim-multiple-cursors', {'tag': 'v2.2'} " CTRL + N for multiple cursors
Plug 'https://github.com/jlanzarotta/bufexplorer', {'tag': 'v7.4.23'} "
Plug 'https://github.com/airblade/vim-gitgutter' " git
Plug 'https://github.com/vim-syntastic/syntastic', {'tag': '3.10.0'} " Syntastic

"""  Go Support
"{{{
"let go_bin_file=system('which go')
"if v:shell_error == 0
    "echo 'init bundle for go'
Plug 'https://github.com/fatih/vim-go', {'tag': 'v1.26'} " comment
"Plug 'https://github.com/Blackrush/vim-gocode', {'tag': ''} " comment
"Plug 'https://github.com/nsf/gocode' " comment
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"endif
"}}}

"""  Rust Support
"{{{
"Plug 'https://github.com/rust-lang/rust'
"endif
"}}}

"""  Java Support
"{{{
"let go_bin_file=system('which java')
"if v:shell_error == 0
    "echo 'init bundle for java'
Plug 'nvim-treesitter/nvim-treesitter' " comment

"require'nvim-treesitter.configs'.setup {
"  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"  highlight = {
"    enable = true,              -- false will disable the whole extension
"  },
"}

""" START SETTING Copilot
"let g:copilot_no_tab_map = true
"vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
"


""" END SETTING Copilot

"endif
"}}}

set encoding=UTF-8

call plug#end()


""" Copilot Support
"{{{

let b:coc_suggest_disable = 1
"let g:copilot_no_tab_map = v:true
"imap <silent><script><expr> <C-i> copilot#Accept("\<CR>")


"}}}



"""  JavaScript Support
"{{{

"Bundle "pangloss/vim-javascript"
"Bundle "mxw/vim-jsx"


"Bundle "posva/vim-vue"

"}}}

"""  TypeScript Support
"{{{

"Bundle "leafgarland/typescript-vim"
"let g:typescript_compiler_binary = 'tsc'
"let g:typescript_compiler_options = ''

"autocmd! FileType typescript :set makeprg=tsc
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost l* nested lwindow

"}}}


"""  SQL Support
"{{{

" Bundle 'SQLComplete.vim'

"}}}

"Bundle 'fatih/vim-go'
"Bundle 'Blackrush/vim-gocode'
"Bundle 'nsf/gocode'

" golint

"}}}

"""  HTML Support
"{{{

"let g:html_indent_inctags = "html,body,head,tbody"
"let g:html_indent_script1 = "inc"
"let g:html_indent_style1 = "inc"

"}}}

""" enable InitEnv
"}}}

autocmd! FileType go call InitGoEnv()
"autocmd! FileType rust call InitRustEnv()
autocmd! FileType python call InitPythonEnv()
autocmd! FileType javascript call InitJavaScriptEnv()
autocmd! FileType vue call InitVueEnv()

"}}}


"""  required!
filetype plugin indent on       

set autochdir
set tags+=$VIM/tags

nmap <Leader>w <Plug>(easymotion-overwin-w)

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

""}}}

"""""""""""""""""""""""""""""""""
"   SETTINGS FOR COC.VIM        "
"   不知道怎么归类的设置        "
"""""""""""""""""""""""""""""""""
"{{{
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"}}}

"""""""""""""""""""""""""""""""""
"   SETTINGS FOR UNKNOWN        "
"   不知道怎么归类的设置        "
"""""""""""""""""""""""""""""""""
"{{{

"set viminfo+=!                  "  保存全局变量
"set relativenumber
set lbr
set fo+=mB
set sm
set undofile
silent !mkdir ~/.undodir > /dev/null 2>&1
set undodir=~/.undodir
"""  允许插件
filetype plugin on
"""  共享剪贴板
"set clipboard+=unnamed
set ruler                       "  打开状态栏标尺
set guioptions-=T               "  隐藏工具栏
set guioptions-=m               "  隐藏菜单栏
set nocompatible                "  不要使用vi的键盘模式，而是vim自己的
set noeb                        "  去掉输入错误的提示声音
set confirm                     "  在处理未保存或只读文件的时候，弹出确认
set nobackup                    "  禁止生成临时文件
set noswapfile                  "  禁止生成临时文件
set linespace=0
set wildmenu                    "  增强模式中的命令行自动完成操作
set backspace=2                 "  使回格键（backspace）正常处理indent, eol, start等
set mouse=a                     "  enable mouse
set selection=exclusive
set selectmode=key
set report=0                    "  通过使用: commands命令，告诉我们文件的哪一行被改变过
"""  在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch                   "  高亮显示匹配的括号
set matchtime=1                 "  匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3                 "  光标移动到buffer的顶部和底部时保持3行距离

"""  Settings for editor
set foldenable                  "  allow foldenable 允许折叠
set foldmethod=syntax
set foldcolumn=0
set foldminlines=2
set foldlevel=99
"set foldmethod=manual   " set foldenable to menual 手动折叠
set wildignore+=*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     
 
"""  自动载入
set autoread
"""  自动保存
set autowrite
"""  代码补全
"set completeopt=menu
"""  don't cover the edit buffer 粘贴不覆盖缓冲区
xnoremap p pgvy
"""   settings for searching 搜索相关设置
"""  关闭环绕式搜索
set nowrapscan
"""  搜索忽略大小写
"set ignorecase
"  设置正则引擎,提高vim性能
set regexpengine=0
let b:easytags_auto_highlight = 1
"}}}

"""""""""""""""""""""""""""""""""
"   SETTINGS FOR FILETYPE       "
"   文件相关的设置              "
"""""""""""""""""""""""""""""""""
"{{{
"""  文件类型
syntax on                       "  
filetype on                     "  侦测文件类型
filetype plugin on              "  载入文件类型插件
filetype indent on              "  为特定文件类型载入相关缩进文件
filetype plugin indent on       "  打开文件类型检测, 加了这句才可以用智能补全
autocmd FileType c setlocal dict+=~/.vim/dict/c.dict
autocmd FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
autocmd FileType css setlocal dict+=~/.vim/dict/css.dict
autocmd FileType html setlocal dict+=~/.vim/dict/css.dict
autocmd FileType html setlocal dict+=~/.vim/dict/javascript.dict
autocmd FileType scale setlocal dict+=~/.vim/dict/scale.dict
autocmd FileType vim set foldmethod=marker

autocmd BufRead,BufNewFile *.{html} set filetype=html
":autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
autocmd BufRead,BufNewFile *.{go} set filetype=go
":autocmd BufRead,BufNewFile *.{js}   set filetype=javascript

" trim end spaces

"""  文件编码
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"set iskeyword+=_,$,@,%,#,-     "  带有如下符号的单词不要被换行分割

""}}}

"""""""""""""""""""""""""""""""""
"   SETTINGS FOR FUNCTIONS      "
"   函数设置                    "
"""""""""""""""""""""""""""""""""
"{{{

func! InsertBreakPoint()
    if &filetype == 'py'||&filetype == 'python'
        let trace = expand("import pudb; pudb.set_trace()  # NOQA, BreakPoint XXX")
        execute "normal O".trace
    elseif &filetype == 'javascript' || &filetype == 'js' || &filetype == 'javascript.jsx'
        let trace = expand("/* eslint no-debugger: \"off\" */ debugger")
        execute "normal O".trace
        return
    elseif &filetype == 'vue'
        let trace = expand("/* eslint no-debugger: \"off\" */ debugger")
        execute "normal O".trace
        return
    elseif &filetype == 'jsp'
        return
    elseif &filetype == 'xml'
        return
   else
        return
    endif
endfunc

func! InitGoEnv()
    set completeopt-=preview
    set tabstop=2
    set softtabstop=2
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_command = "goimports"
    let g:go_fmt_fail_silently = 1
    let g:jedi#show_documentation_command = 0
    let g:syntastic_go_checkers=['go', 'gofmt', 'golint']

    nmap <F5> :GoRun<CR>

  augroup SaveGo
    autocmd!
    autocmd BufWritePre *.go silent! execute ':%s/\s\+$//g'
  augroup END

endfunc


func! InitRustEnv()
    set completeopt-=preview
    set tabstop=2
    set softtabstop=2
    let g:rustfmt_autosave = 1
    let g:syntastic_rust_checkers = ['cargo']

    nmap <F5> :RustRun<CR>

  augroup SaveRust
    autocmd!
    "autocmd BufWritePre *.go silent! execute ':%s/\s\+$//g'
    autocmd BufWritePre *.rs silent! execute ':RustFmt'
  augroup END

endfunc


func! InitPythonEnv()
  let g:miniBufExplMapWindowNavArrows = 1
  let g:miniBufExplMapWindowNavVim = 1
  let g:miniBufExplModSelTarget = 1
  let g:pydiction_location = '~/.vim/after/complete-dict'
  let g:pydiction_menu_height = 20
  let g:syntastic_python_checkers=['flake8', 'pylint']
  let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301,F0401'
  let g:syntastic_python_flake8_args='--ignore=E501'
  let g:syntastic_python_python_exec = 'python'

  set foldmethod=indent
  set foldlevel=99

  "let g:pymode_rope = 0
  "let g:pymode_rope_lookup_project = 0
  "let g:pymode_rope_complete_on_dot = 0
  "let g:pymode_rope_autoimport = 0
  "let g:pymode_syntax_slow_sync = 0
  "let g:pymode_folding = 0
  "autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  "autocmd InsertLeave * if pumvisible() == 0|pclose|endif
  "let g:pymode_python = 'python3'
  "let g:syntastic_check_on_open = 0

  augroup SavePython
    autocmd!
    autocmd BufWritePre *.py silent! execute ':%s/\s\+$//g'
  augroup END

  "autocmd BufWritePre *.py call PyUpdateHeader()

  "增加 Python 运行键映射
  nmap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>
endfunc

func! PyUpdateHeader()
  silent! execute "m'"
  silent! execute ':5s/^date: [0-9-]\{10\} [0-9:]\{8\}$/date: '.strftime("%Y-%m-%d %H:%M:%S").'/e'
  silent! execute "''"
endfun

func! InitJavaEnv()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set foldmethod=indent
  setlocal dict+=~/.vim/dict/css.dict
  setlocal dict+=~/.vim/dict/javascript.dict
  set foldlevel=99
  let loaded_matchparen = 0
  let g:syntastic_javascript_checkers=['eslint']
  let g:jsx_ext_required = 0

  augroup SaveJava
    autocmd!
    silent! execute ':%s/\s\+$//g'
  augroup END

endfunc

func! InitJavaScriptEnv()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set foldmethod=indent
  setlocal dict+=~/.vim/dict/css.dict
  setlocal dict+=~/.vim/dict/javascript.dict
  set foldlevel=99
  let loaded_matchparen = 0
  let g:syntastic_javascript_checkers=['eslint']
  let g:jsx_ext_required = 0

  augroup SaveJavaScript
    autocmd!
    silent! execute ':%s/\s\+$//g'
  augroup END

endfunc

func! InitVueEnv()
  set foldmethod=indent
  setlocal dict+=~/.vim/dict/css.dict
  setlocal dict+=~/.vim/dict/javascript.dict
  set foldlevel=99
  let loaded_matchparen = 0
  let g:syntastic_javascript_checkers=['eslint']
  let g:jsx_ext_required = 0

  set tabstop=2
  set shiftwidth=2
  augroup SaveVue
    autocmd!
    autocmd BufWritePre *.vue silent! execute ':%s/\s\+$//g'
  augroup END

endfunc


"}}}
"

"""""""""""""""""""""""""""""""""
"   SETTINGS FOR AUTOCMD        "
"   自动执行命令设置            "
"""""""""""""""""""""""""""""""""
"{{{

augroup InitEnv
  au!

  let g:go_version_warning = 0
  autocmd BufRead,BufNewFile *.vue setfiletype vue
  autocmd BufRead,BufNewFile *.py setfiletype python

  autocmd FileType vue syntax sync fromstart

  autocmd BufRead,BufNewFile *.vue set foldlevel=99

  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  """  当打开vim且没有文件时自动打开NERDTree
  autocmd vimenter * if !argc() | NERDTree | endif 

  """  只剩NERDTree时自动关闭
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  """  quickfix模式
  "autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
  "

augroup END

""}}}

"""""""""""""""""""""""""""""""""
"   SETTINGS FOR KEY MAP        "
"   快捷键设置                  "
"""""""""""""""""""""""""""""""""
"{{{
let mapleader=","
"""  Toggle KeyMap
"""  Toggle for NERDComment | 快速注释
:nmap <Leader>c  <plug>NERDCommenterToggle
:nmap <Leader>b :call InsertBreakPoint()<CR>
"""  toggle for show line numbers
"""  行号显示开关
nmap <Leader>N :set invnumber<CR>
"""  toggle for the paste support
"""  粘贴模式开关
" :set pastetoggle=<Leader>y
"""  tagbar toggle
"""  tags窗口开关
nmap <leader>T :TagbarToggle<CR>
"""  toggle for nerdtree
"""  目录窗口开关
nmap <leader>t :NERDTreeToggle<CR>
"""  key map for fast edit
"""  delete the empty lines | 去空行
:vmap <C-d> :g/^\s*$/d<CR>

"""  key map for wins, buffers, tabs | 切换快捷键

"""  win

nmap <C-h> <C-W><Left>
nmap <C-l> <C-W><Right>
nmap <C-j> <C-W><Down>
nmap <C-k> <C-W><Up>
nmap <leader>o :on!<CR>:GitGutterDisable<CR>:set nonumber<CR>
nmap <leader>O :GitGutterEnable<CR>:set number<CR>

""" 复制到剪切板
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y

"" 错误信息

nnoremap <silent> en :call CocAction('diagnosticNext')<cr> 
nnoremap <silent> ep :call CocAction('diagnosticPrevious')<cr> 
nmap <leader>e :CocList diagnostics<cr> 

"""  buffer

let g:bufExplorerSplitBelow=1
let g:bufExplorerSplitHorzSize=10
let g:bufExplorerSplitVertSize=10
nmap <leader>s :b#<CR>
nmap <leader>S :ToggleBufExplorer<CR>

"""  tab

"nmap <F2> :tabp<CR>
"nmap <F3> :tabn<CR>
"nmap <F4> :tabclose<CR>

"""  排序

vmap <S-s> :sort<CR>

"""  key map for tags
"""  tags快捷键

"nmap tl :Tlist<cr>
"
let NERDTreeRespectWildIgnore=1
let NERDTreeShowHidden=1

"""  FOLD 
""" init fold settings for different filetype
autocmd FileType html set foldmethod=indent
nmap zz zc

nmap <silent> <leader>ps <Plug>(pydocstring)


""" coc快捷配置
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"""


"imap <tab> <C-X><C-O>
"}}}

"""""""""""""""""""""""""""""""""
"   SETTINGS FOR STYLES         "
"   样式设置                    "
"""""""""""""""""""""""""""""""""
"{{{

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
"  if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif
"set background=dark
set background=light

"let g:molokai_original = 0

"""  settings for cursor 光标相关设置
"""  highlight for cursor
hi CursorColumn term=bold cterm=bold ctermbg=None
hi clear CursorLine
hi CursorLine term=bold cterm=bold ctermbg=None
"hi CursorLine ctermbg=LightBlue
"hi CursorLine term=none cterm=none ctermfg=none ctermbg=255

set cursorline
autocmd InsertLeave * set cursorline
autocmd InsertEnter * set nocursorline
set cursorcolumn
autocmd InsertLeave * set cursorcolumn
autocmd InsertEnter * set nocursorcolumn

"""  settings for colors
set t_Co=256                    "  set the color bits
set go=                         "  I don't know what is this
set ruler                       "  show the ruler but not effective
"set showcmd                    "  show the command, set to off if the terminal is slow
"set whichwrap+=<,>,h,l         "  allow the cursor move cross line, not recommend for default
set laststatus=2                "  2 stand for always show the statusline | (1)启动显示状态行 (2)总是显示状态行
set nocompatible                "  I don't know what is this. 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set autoindent                  "  自动缩进
set cindent
"""  settings for height or width
set smarttab                    "  在行和段开始处使用制表符
set expandtab                   "  使用空格代替制表符
set smartindent

set tabstop=4
set shiftwidth=4
set softtabstop=4               "  统一缩进为4

set scrolloff=3                 "  set the margin to 3 lines 光标移动到buffer的顶部和底部时保持3行距离
set cmdheight=2                 "  set the command height to 1 line
set number
set history=1000
set hlsearch
set incsearch
set langmenu=zh_CN.UTF-8
set helplang=cn
" settings of status line format status line格式
set statusline=
set statusline+=%7*\|%n                                 "buffernr
set statusline+=%3*\|%{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%2*\|%y                                  "FileType
set statusline+=%4*\|%{&ff}                              "FileFormat (dos/unix..)
set statusline+=%1*\|%<%F                                "File+path
"set statusline+=%1*\|%<%F=%{coc#status()}%{get(b:,'coc_current_function','')} "File+path
set statusline+=%8*\|%=\(%03p%%)%l/%L                    "Rownumber/total (%)
set statusline+=%8*\|\(%03p%%)%l/%L                    "Rownumber/total (%)
set statusline+=%9*\|%03c                              "Colnr
set statusline+=%0*\|%m%r%w%=                           "Modified? Readonly? Top/bot.

"""  choose the default colorscheme
colorscheme catppuccin

"colorscheme moloka-i
"colorscheme molokai_dark
"colorscheme gruvbox
"colorscheme OceanicNextLight
"colorscheme materialbox
"colorscheme github
"colorscheme Atelier_HeathDark
"colorscheme peaksea
":colorscheme jellybeans

"}}}

"""""""""""""""""""""""""""""""""
"        END OF VIMRC           "
"""""""""""""""""""""""""""""""""

"nnoremap <C-f> :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-d> :call CocActionAsync('jumpDefinition')<CR>

"nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = 'b'
let g:airline_symbols.readonly = 'RO'
let g:airline_symbols.linenr = ''

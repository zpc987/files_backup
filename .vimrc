"=============================================================================
"     FileName: .vimrc
"         Desc: 
"       Author: zhang pengcheng
"        Email: zpc987@sina.com
"     HomePage: 
"      Version: 0.0.1
"   LastChange: 2013-01-26 15:54:24-
"    CreatTime: 2013-01-26 15:54:24
"=============================================================================
colorscheme desert
set wrap

let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

"set guioptions-=T
set guioptions+=l
set guioptions+=b
set noswapfile

set tabstop=4
set softtabstop=4
set shiftwidth=4
 
set nu
set expandtab
set guioptions-=T
set autochdir
set nocompatible

set history=100
 
set confirm
 
abbreviate ,, <=
"imap ,. <C-X><C-L>
"与windows共享剪贴板
"set clipboard+=unnamed
"
"自动在每次执行写入Buffer的时候，将^M替换为空格，并将行尾的多余空格删除，并将文件中的tab用空格删除
"autocmd BufWritePre,FileWritePre *.v,*.sv %s/\r//ge | %s/\s\+$//ge | retab | <ESC> <C-O>
autocmd BufWritePre,FileWritePre *.c *.cpp,*.v,*.sv,*.qsf set fileformat=dos | %s/\r//ge | %s/\s\+$//ge | retab 
autocmd BufWritePre,FileWritePre *.dat setlocal noeol binary fileformat=unix

syntax on  "or use filetype on
filetype plugin on
filetype indent on
 
" 保存全局变量
set viminfo+=!
 
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
 
" 语法高亮
syntax on
 
" 高亮字符，让其不受100列限制
":highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
":match OverLength '\%101v.*'
 
" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
 
" 不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide
 
" 字符间插入的像素行数目
set linespace=0
 
" 增强模式中的命令行自动完成操作
set wildmenu
 
" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
 
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
 
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
 
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
 
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
 
" 启动的时候不显示那个援助索马里儿童的提示
" set shortmess=atI
 
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
 
" 不让vim发出讨厌的滴滴声
set noerrorbells
 
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 在搜索的时候忽略大小写
" set ignorecase

" 高亮被搜索的句子（phrases）
set hlsearch

"no wrap scan
set nowrapscan
" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
" set incsearch

" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 不要闪烁
set novisualbell

" 总是显示状态行
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 为C程序提供自动缩进
set smartindent

" 使用C样式的缩进
set cindent

" 不要用空格代替制表符
set noexpandtab

" 不要换行
set nowrap

" 在行和段开始处使用制表符
set smarttab

set textwidth=1000
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Compart_Format = 1
let Tlist_Exist_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Enable_Fold_Column = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mark.vim plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "m"
"-------------------------------------------------------------------
"windows key map
"-------------------------------------------------------------------
vmap <C-c> "+y
vmap <C-x> "+x
nmap <C-v> "+gP
imap <C-v> <C-O>"+gP
nmap <C-s> :wall<CR>
imap <C-s> <C-O>:wall<CR>
nmap <C-z> :q<CR> 
" nmap <C-w> :w<CR> 

" let mapleader = "f"
" nmap <leader>f zf%
"------------------------------------------------------------------
"   key map
"------------------------------------------------------------------
"----------------------------------------------------------------------
"auto add the author ,filename ,data and other information to the file
"----------------------------------------------------------------------
let g:vimrc_author='zhang pengcheng'
let g:vimrc_email='zpc987@sina.com'
let g:vimrc_homepage=''
nmap <F4> :AuthorInfoDetect<cr>
imap <silent><F4>  <C-O>:AuthorInfoDetect<CR> 
"----------------------------------------------------------------------
nmap <silent><F5>  :vsplit<CR> 
imap <silent><F5>  <C-O>:vsplit<CR> 
nmap <silent><F6> :NERDTree<CR>
imap <silent><F6> <C-O>:NERDTree<CR>
nmap <silent><F7> :Tlist<CR>
imap <silent><F7> <C-O>:Tlist<CR>
nmap <silent><F8> :BufExplorer<CR>
imap <silent><F8> <C-O>:BufExplorer<CR>
"打开浏览器
nmap <F10> :!start explorer /e,,%:p:h<CR>
imap <F10> <C-O>:!start explorer /e,,%:p:h<CR>
"------------------------------------------------------------------
"can use the <C+>< h,j,k,l> to change the window
let g:miniBufExplMapWindowNavVim = 1 
"can use the <C+> Arrows to change the window
"let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
"------------------------------------------------------------------
"set the window's  original position
"------------------------------------------------------------------
winpos 200 200
set lines=30
set columns=90
"------------------------------------------------------------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示

"  if has("autocmd")
"    autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number
"    autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
"    autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o
"    autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100
"    autocmd Filetype html,xml,xsl source $VIMRUNTIME/plugin/closetag.vim
"    autocmd BufReadPost *
"      \ if line("'"") > 0 && line("'"") <= line("$") |
"      \ exe " normal g`"" |
"      \ endif
"  endif "has("autocmd")
"
"  " F5编译和运行C程序，F6编译和运行C++程序
"  " 请注意，下述代码在windows下使用会报错
"  " 需要去掉./这两个字符
" 
"  " C的编译和运行
"  map <F5> :call CompileRunGcc()<CR>
"  func! CompileRunGcc()
"  exec "w"
"  exec "!gcc % -o %<"
"  exec "! ./%<"
"  endfunc
 
  " C++的编译和运行
"  map <F6> :call CompileRunGpp()<CR>
"  func! CompileRunGpp()
"  exec "w"
"  exec "!g++ % -o %<"
"  exec "! ./%<"
"  endfunc
 
  " 能够漂亮地显示.NFO文件
"  set encoding=utf-8
"  function! SetFileEncodings(encodings)
"      let b:myfileencodingsbak=&fileencodings
"          let &fileencodings=a:encodings
"          endfunction
"          function! RestoreFileEncodings()
"              let &fileencodings=b:myfileencodingsbak
"                  unlet b:myfileencodingsbak
"                  endfunction
" 
"                  au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single au BufReadPost *.nfo call RestoreFileEncodings()
" 
"" 高亮显示普通txt文件（需要txt.vim脚本）
"au BufRead,BufNewFile *  setfiletype txt
" 
"" 用空格键来开关折叠
" set foldenable
" set foldmethod=indent
" set foldmethod=marker
 set foldlevel=99
 nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zf%':'zO')<CR>
"
" " minibufexpl插件的一般设置
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1

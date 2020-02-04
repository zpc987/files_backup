set langmenu=en_US
let $LANG = 'en_US'
set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = ","

let $HOME='D:/Program/Vim'
let win_flag = (has('win32') || has('win64'))

set rtp+=~/bundle/Vundle.vim/
let path='~/bundle/plugins'
call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" 1. plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'wincent/command-t'
" 2. plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" 3. Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" 4. git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'unite.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'inkarkat/vim-ingo-library'
Plugin 'inkarkat/vim-mark'
"============================================================
Plugin 'grep.vim'
"-----------------------------
let grep_path = 'D:\program\mingw\bin'
let Grep_Shell_Quote_Char  = "\"" 
let Grep_Path              = grep_path . '\grep.exe'
let Fgrep_Path             = grep_path . '\fgrep.exe'
let Egrep_Path             = grep_path . '\egrep.exe'
"let Agrep_Path            = grep_path . '\agrep.exe'
let Grep_Find_Path         = grep_path . '\find.exe'
let Grep_Xargs_Path        = grep_path . '\xargs.exe'
"let Grep_Default_Filelist = '*.c *.cpp *.asm'
let Grep_Default_Options  = '-R'

"============================================================
Plugin 'scrooloose/nerdtree'
"-----------------------------
let NERDTreeDirArrows=0
let NERDTreeShowHidden= 1
let NERDTreeChDirMode=2
let NERDTreeIgnore=['^\.$[[dir]]', '^\.\.$[[dir]]']
let NERDTreeSortOrder =['\.pl$','\.py$','\.rb$','\.c$', '\.cpp$','\.h$','\.v$','\.sv$','\.txt$', '*','\.swp$', '\.bak$', '\~$'] 
"============================================================
Plugin 'scrooloose/nerdcommenter'
"-----------------------------

"============================================================
Plugin 'scrooloose/syntastic'
"-----------------------------

"============================================================
Plugin 'majutsushi/tagbar'
"-----------------------------

"============================================================
Plugin 'vim-scripts/EasyGrep'
"-----------------------------
let g:EasyGrepMode = 2 

"============================================================
"Plugin 'fholgado/minibufexpl.vim'
"-----------------------------
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
noremap <C-Left> <C-W>h
noremap <C-Right> <C-W>l
noremap <C-L> <C-W>l
"noremap <C-TAB> :MBEbn<CR>
"noremap <C-S-TAB> :MBEbp<CR>
"let g:miniBufExplBuffersNeeded = 0
"let g:miniBufExplCycleArround = 1 
"---can use the <C+>< h,j,k,l> to change the window
"let g:miniBufExplMapWindowNavVim = 1 
"---can use the <C+> Arrows to change the window
"let g:miniBufExplMapWindowNavArrows=1
"let g:miniBufExplMapCTabSwitchBufs =1
"let g:miniBufExplModSelTarget =1 

"============================================================
Plugin 'winmanager'
"============================================================
Plugin 'taglist.vim'
"-----------------------------
let Tlist_Sort_Type ="name"
let Tlist_Use_Right_Window =1
let Tlist_Compart_Format =1
let Tlist_Exist_OnlyWindow =1
let Tlist_File_Fold_Auto_Close=0
let Tlist_Enable_Fold_Column =0
let Tlist_Ctags_Cmd = '~\vimfiles\plugin\ctags.exe'
"============================================================
Plugin 'OmniCppComplete'
"============================================================
Plugin 'Emmet.vim'
"============================================================
"Plugin 'SyntaxComplete'
"============================================================
if(0)
Plugin 'Valloric/YouCompleteMe'
"-----------------------------
let g:ycm_global_ycm_extra_conf = '~\bundle\plugins\YouCompleteMe\.ycm_extra_conf.py'

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'mkd' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1,
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'md' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_disable_for_files_larger_than_kb = 1000

" "youcompleteme  默认tab  s-tab 和自动补全冲突
" "let g:ycm_key_list_select_completion=['<c-n>']
" let g:ycm_key_list_select_completion = ['<Down>']
" "let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
" 
" let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
" let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
" let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
" let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
" nnoremap <F2> :YcmForceCompileAndDiagnostics<CR> " force recomile with syntastic
" "nnoremap <leader>lo :lopen<CR>	"open locationlist
" "nnoremap <leader>lc :lclose<CR>	"close locationlist
" inoremap <leader><leader> <C-x><C-o>
" "在注释输入中也能补全
" let g:ycm_complete_in_comments = 1
" "在字符串输入中也能补全
" let g:ycm_complete_in_strings = 1
" "注释和字符串中的文字也会被收入补全
" let g:ycm_collect_identifiers_from_comments_and_strings = 0
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> "跳转到定义处


let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nmap <F4> :YcmDiags<CR>
endif
"============================================================

call vundle#end()
filetype plugin indent on

"============================================================
"Do not use plugin 'AuthorInfo'
"-----------------------------
let g:vimrc_author=''
let g:vimrc_email=''
let g:vimrc_homepage=''
nmap <F4> :AuthorInfoDetect<Enter>
imap <silent><F4> <C-O><F4>
"============================================================
colorscheme desert
set confirm
set nu
behave xterm
au GUIEnter * simalt ~x

set fileencodings =utf-8,gbk,ucs-bom,cp936
set termencoding =utf-8
set encoding =prc

if (win_flag)
set guifont =Consolas:h12 
"set guifont =Lucida_Sans_Typewriter:h10 
endif

if(has("gui_running"))
set guioptions -=T "hide Toolbar
set guioptions -=m "hide menu bar
set guioptions +=bh "show bottom scrollbar
set guioptions +=L
winpos 200 200
set lines =50
set columns=90
endif

set noswapfile

set tabstop =4
set softtabstop =4
set shiftwidth =4

set expandtab
set autochdir

set history=100

abbreviate ,, <=
"imap ,. <C-X><C-L>
"set clipboard+=unnamed "与windows共享剪贴板

"自动在每次执行写入Buffer的时候，将^M替换为空格，并将行尾的多余空格删除，并将文件中的tab用空格删除
"autocmd BufWritePre,FileWritePre *.v,*.sv %s/\r//ge | %s/\s\+$//ge | retab | <ESC> <C-O>

autocmd BufWritePre,FileWritePre *.c,*.cpp,*.v,*.sv,*.qsf,*.py 
\| %s/\s\+$//ge 
"\| %s/\r//ge 
"\| retab 

if (win_flag)
autocmd BufWritePre,FileWritePre *.c,*.cpp,*.v,*.sv,*.qsf set fileformat=dos 
autocmd BufWritePre,FileWritePre *.dat setlocal noeol binary fileformat=dos
else
autocmd BufWritePre,FileWritePre *.c,*.cpp,*.v,*.sv,*.qsf set fileformat=unix 
autocmd BufWritePre,FileWritePre *.dat setlocal noeol binary fileformat=unix
endif

syntax on "or use filetype on

set noequalalways
set eadirection=ver
"set eadirection=hor

set viminfo+=! " 保存全局变量
" set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割


" 高亮字符，让其不受100列限制
":highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
":match OverLength '\%101v.*'

" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

"-------------------------------------------------------------------
" 文件设置
"-------------------------------------------------------------------
set nobackup
set linespace=0                      " 字符间插入的像素行数目
set wildmenu                         " 增强模式中的命令行自动完成操作
set cmdheight=2                      " 命令行（在状态行下）的高度，默认为1，这里是2
set backspace=2                      " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l               " 允许backspace和光标键跨越行边界
" set shortmess=atI                  " 启动的时候不显示援助索马里儿童的提示
set report=0                         " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\  " 在被分割的窗口间显示空白，便于阅读

" 可以在buffer的任何地方使用鼠标
set mousehide
set mouse =a
set selection =exclusive
set selectmode=mouse,key

" 不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide

" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

"-------------------------------------------------------------------
" 搜索和匹配
"-------------------------------------------------------------------

set showmatch    " 高亮显示匹配的括号
set matchtime=5  " 匹配括号高亮的时间（单位是十分之一秒）
set hlsearch     " 高亮被搜索的句子（phrases）
set nowrapscan   " no wrap scan
set scrolloff=0  " 光标移动到buffer的顶部和底部时保持1行距离
set novisualbell " 不要闪烁
set laststatus=2 " 总是显示状态行

set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

"-------------------------------------------------------------------
" 文本格式和排版
"-------------------------------------------------------------------

set formatoptions=tcrqn " 自动格式化
set autoindent          " 继承前一行的缩进方式，特别适用于多行注释
set smartindent         " 为C程序提供自动缩进
set cindent             " 使用C样式的缩进
set expandtab           " 不要用空格代替制表符
set smarttab            " 在行和段开始处使用制表符
set textwidth=500
set nowrap

"-------------------------------------------------------------------
if(win_flag)
nmap <silent><leader>s :source $VIM/_vimrc<CR>
nmap <silent><leader>v :e $VIM/_vimrc<CR>
else
nmap <silent><leader>s :source ~/.vimrc <Esc>
nmap <silent><leader>v :e ~/.vimrc<CR>
endif
nmap <silent><leader>h :nohl<Esc>
"--- add C like comment
nmap <leader>a i/* <Esc>
nmap <leader>e a*/<Esc>
nmap <leader>w :set wrap !<Esc>
"--- use \ split one line into two lines
nmap <Bslash> C<CR><Esc>P
"-------------------------------------------------------------------
"windows key map
"-------------------------------------------------------------------
vmap <C-c> "+y
vmap <C-x> "+x
nmap <C-v> "+gP
imap <C-v> <C-o><C-v>
nmap <C-s> :wa<Enter>
imap <C-s> <C-o><C-s>
nmap <C-z> :q<CR>
nmap <M-c> :cn<CR> 
nmap <M-x> :cp<CR> 
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
"-------------------------------------------------------------------
"commend line map
"-------------------------------------------------------------------
cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
"------------------------------------------------------------------
" key map
"------------------------------------------------------------------
nmap <silent><F6> :NERDTree<Enter>
imap <silent><F6> <C-O><F6>
nmap <silent><F7> :Tlist<Enter>
imap <silent><F7> <C-O><F7>
nmap <silent><F8> :BufExplorer<Enter>
imap <silent><F8> <C-O><F8>
if(win_flag)
    nmap <silent><F9> :!start explorer /e,,%:p:h<CR>
    imap <silent><F9> <C-O><F9>
    nmap <silent><F10> :!start cmd /t:3f /K cd /d <CR>
    imap <silent><F10> <C-O><F10>
else
    nmap <silent><F9> :!nautilus ./<Enter><Enter>
    imap <silent><F9> <C-O><F9>
    nmap <silent><F10> :!gnome-terminal &<Enter><Enter>
    imap <silent><F10> <C-O><F10>
endif

"------------------------------------------------------------------
" Autocommands
"------------------------------------------------------------------
"set makeprg=iverilog\ -g2\ -y./\ -y../rtl/\ -y../../IPcores/Xilinx_sim/\ -y../../IPcores/Xilinx_lib/\ -Wall\ -tnull\ %

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\ exe "normal! g`\"" |
\ endif

au BufRead,BufNewFile *.txt setfiletype text

if has("autocmd")
" autocmd FileType text set nonu 
" autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby,vera,verilog,systemverilog
" autocmd FileType xml,html 
" \ vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o--> 
" autocmd FileType java,c,cpp,cs 
"	 \ vmap <C-o> <ESC>'<o 
" autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python 
"	 \ setlocal textwidth=100 
" autocmd Filetype html,xml,xsl 
"	 \ source $VIMRUNTIME/plugin/closetag.vim 
" autocmd BufReadPost *
" \ if line("'"") > 0 && line("'"") <= line("$") |
" \ exe " normal g`"" |
" \ endif
endif "has("autocmd")
"
" " F5编译和运行C程序，F6编译和运行C++程序
" " 请注意，下述代码在windows下使用会报错
" " 需要去掉./这两个字符
" 
" " C的编译和运行
" map <F5> :call CompileRunGcc()<CR>
" func! CompileRunGcc()
" exec "w"
" exec "!gcc % -o %<"
" exec "! ./%<"
" endfunc

" C++的编译和运行
" map <F6> :call CompileRunGpp()<CR>
" func! CompileRunGpp()
" exec "w"
" exec "!g++ % -o %<"
" exec "! ./%<"
" endfunc

" " 能够漂亮地显示.NFO文件
" set encoding=utf-8
" function! SetFileEncodings(encodings)
"	 let b:myfileencodingsbak=&fileencodings
"	 let &fileencodings=a:encodings
" endfunction
" function! RestoreFileEncodings()
"	 let &fileencodings=b:myfileencodingsbak
"	 unlet b:myfileencodingsbak
" endfunction
" 
" au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single au BufReadPost *.nfo call RestoreFileEncodings()

"------------------------------------------------------------------
" fold setting
"------------------------------------------------------------------

" set foldenable
" set foldmethod=indent
" set foldmethod=marker
set foldlevel=99
"" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zf%':'zO')<Enter>


set noerrorbells
set vb t_vb=
"------------------------------------------------------------------
"add #! for .pl files automaticaly
"------------------------------------------------------------------
"---makesure your Windows has installed perl already

if has("perl")
    "autocmd BufWinEnter *.pl exec ":call AddSheBang()"
    function! AddSheBang()
        perl add_she_bang()
    endfunction
    
perl << EOF
    
    sub add_she_bang {
    if (($curbuf->Count() == 0)||(($curbuf->Get(1)) !~ /\#/)){
        $curbuf->Append(0, "#!/usr/bin/perl -w"); 
        $curbuf->Append(1, ""); 
        $curbuf->Append(2, "use strict;"); 
        $curbuf->Append(3, "use 5.018;"); 
        $curbuf->Append(4, ""); 
        @pos = (6,0);
        $curwin->Cursor(@pos);
        VIM::DoCommand("echo 'auto insert information'");
        }
    }
EOF
endif

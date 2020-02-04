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

" "youcompleteme  Ĭ��tab  s-tab ���Զ���ȫ��ͻ
" "let g:ycm_key_list_select_completion=['<c-n>']
" let g:ycm_key_list_select_completion = ['<Down>']
" "let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_confirm_extra_conf=0 "�رռ���.ycm_extra_conf.py��ʾ
" 
" let g:ycm_collect_identifiers_from_tags_files=1	" ���� YCM ���ڱ�ǩ����
" let g:ycm_min_num_of_chars_for_completion=2	" �ӵ�2�������ַ��Ϳ�ʼ����ƥ����
" let g:ycm_cache_omnifunc=0	" ��ֹ����ƥ����,ÿ�ζ���������ƥ����
" let g:ycm_seed_identifiers_with_syntax=1	" �﷨�ؼ��ֲ�ȫ
" nnoremap <F2> :YcmForceCompileAndDiagnostics<CR> " force recomile with syntastic
" "nnoremap <leader>lo :lopen<CR>	"open locationlist
" "nnoremap <leader>lc :lclose<CR>	"close locationlist
" inoremap <leader><leader> <C-x><C-o>
" "��ע��������Ҳ�ܲ�ȫ
" let g:ycm_complete_in_comments = 1
" "���ַ���������Ҳ�ܲ�ȫ
" let g:ycm_complete_in_strings = 1
" "ע�ͺ��ַ����е�����Ҳ�ᱻ���벹ȫ
" let g:ycm_collect_identifiers_from_comments_and_strings = 0
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> "��ת�����崦


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
"set clipboard+=unnamed "��windows���������

"�Զ���ÿ��ִ��д��Buffer��ʱ�򣬽�^M�滻Ϊ�ո񣬲�����β�Ķ���ո�ɾ���������ļ��е�tab�ÿո�ɾ��
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

set viminfo+=! " ����ȫ�ֱ���
" set iskeyword+=_,$,@,%,#,- " �������·��ŵĵ��ʲ�Ҫ�����зָ�


" �����ַ������䲻��100������
":highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
":match OverLength '\%101v.*'

" ״̬����ɫ
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

"-------------------------------------------------------------------
" �ļ�����
"-------------------------------------------------------------------
set nobackup
set linespace=0                      " �ַ���������������Ŀ
set wildmenu                         " ��ǿģʽ�е��������Զ���ɲ���
set cmdheight=2                      " �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1��������2
set backspace=2                      " ʹ�ظ����backspace����������indent, eol, start��
set whichwrap+=<,>,h,l               " ����backspace�͹�����Խ�б߽�
" set shortmess=atI                  " ������ʱ����ʾԮ���������ͯ����ʾ
set report=0                         " ͨ��ʹ��: commands������������ļ�����һ�б��ı��
set fillchars=vert:\ ,stl:\ ,stlnc:\  " �ڱ��ָ�Ĵ��ڼ���ʾ�հף������Ķ�

" ������buffer���κεط�ʹ�����
set mousehide
set mouse =a
set selection =exclusive
set selectmode=mouse,key

" ��Ҫ����swap�ļ�����buffer��������ʱ��������
setlocal noswapfile
set bufhidden=hide

" ��״̬������ʾ�������λ�õ��кź��к�
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

"-------------------------------------------------------------------
" ������ƥ��
"-------------------------------------------------------------------

set showmatch    " ������ʾƥ�������
set matchtime=5  " ƥ�����Ÿ�����ʱ�䣨��λ��ʮ��֮һ�룩
set hlsearch     " �����������ľ��ӣ�phrases��
set nowrapscan   " no wrap scan
set scrolloff=0  " ����ƶ���buffer�Ķ����͵ײ�ʱ����1�о���
set novisualbell " ��Ҫ��˸
set laststatus=2 " ������ʾ״̬��

set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

"-------------------------------------------------------------------
" �ı���ʽ���Ű�
"-------------------------------------------------------------------

set formatoptions=tcrqn " �Զ���ʽ��
set autoindent          " �̳�ǰһ�е�������ʽ���ر������ڶ���ע��
set smartindent         " ΪC�����ṩ�Զ�����
set cindent             " ʹ��C��ʽ������
set expandtab           " ��Ҫ�ÿո�����Ʊ��
set smarttab            " ���кͶο�ʼ��ʹ���Ʊ��
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
" " F5���������C����F6���������C++����
" " ��ע�⣬����������windows��ʹ�ûᱨ��
" " ��Ҫȥ��./�������ַ�
" 
" " C�ı��������
" map <F5> :call CompileRunGcc()<CR>
" func! CompileRunGcc()
" exec "w"
" exec "!gcc % -o %<"
" exec "! ./%<"
" endfunc

" C++�ı��������
" map <F6> :call CompileRunGpp()<CR>
" func! CompileRunGpp()
" exec "w"
" exec "!g++ % -o %<"
" exec "! ./%<"
" endfunc

" " �ܹ�Ư������ʾ.NFO�ļ�
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
"" �ÿո���������۵�
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

(add-to-list 'load-path "~/.emacs.d")
;------------语言环境字符集设置(utf-8)-------------
(set-language-environment 'Chinese-GB)
(setq locale-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;(set-keyboard-coding-system 'euc-cn)
(set-clipboard-coding-system 'euc-cn) 
(set-terminal-coding-system 'utf-8)
;(set-terminal-coding-system 'euc-cn)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8) 
(set-selection-coding-system 'utf-8) 
(modify-coding-system-alist 'process "*" 'utf-8) 
(setq default-process-coding-system '(utf-8 . utf-8)) 
(setq-default pathname-coding-system 'utf-8) 
;(setq-default pathname-coding-system 'euc-cn) 
(set-file-name-coding-system 'utf-8) 
;(set-file-name-coding-system 'euc-cn) 
(prefer-coding-system 'utf-8)

 (defun font-existsp (font)
   (if (null (x-list-fonts font))
       nil t))
 (defvar font-list '("文泉驿等宽微米黑" "黑体" ))
 (require 'cl) ; find-if is in common list package
 (find-if #'font-existsp font-list)
 (defun make-font-string (font-name font-size)
   (if (and (stringp font-size)
            (equal ":" (string (elt font-size 0))))
       (format "%s%s" font-name font-size)
     (format "%s %s" font-name font-size)))
 (defun set-font (english-fonts
                        english-font-size
                        chinese-fonts
                        &optional chinese-font-size)
   "english-font-size could be set to \":pixelsize=18\" or a integer.
 If set/leave chinese-font-size to nil, it will follow english-font-size"
   (require 'cl)                         ; for find if
   (let ((en-font (make-font-string
                   (find-if #'font-existsp english-fonts)
                   english-font-size))
         (zh-font (font-spec :family (find-if #'font-existsp chinese-fonts)
                             :size chinese-font-size)))
   
     ; Set the default English font
     ;
     ; The following 2 method cannot make the font settig work in new frames.
     ; (set-default-font "Consolas:pixelsize=18")
     ; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
     ; We have to use set-face-attribute
     (message "Set English Font to %s" en-font)
     (set-face-attribute
      'default nil :font en-font)
   
     ; Set Chinese font
     ; Do not use 'unicode charset, it will cause the english font setting invalid
     (message "Set Chinese Font to %s" zh-font)
     (dolist (charset '(kana han symbol cjk-misc bopomofo))
       (set-fontset-font (frame-parameter nil 'font)
                         charset
                         zh-font))))
 (set-font
  '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New") ":pixelsize=15"
  '("文泉驿等宽微米黑" "黑体" ))

 ;;Setting English Font
 ;;(set-face-attribute  'default nil :font "Consolas 12")
 ;  
 ;; Chinese Font
 ;;(dolist (charset '(kana han symbol cjk-misc bopomofo))  (set-fontset-font (frame-parameter nil 'font) charset  (font-spec :family "" :size 12)))
 ;;处理shell-mode乱码,好像没作用
  
 ;------语言环境字符集设置结束------------
  
  
 ;--------------窗口界面设置------------------
  
 (set-foreground-color "grey")
 (set-background-color "black")
 (set-cursor-color "gold1")
 (set-mouse-color "gold1")
  
 ;(set-scroll-bar-mode nil)
 ;取消滚动栏
  
 (customize-set-variable 'scroll-bar-mode 'right)
 ;设置滚动栏在窗口右侧，而默认是在左侧
  
 ;(tool-bar-mode nil)
 ;取消工具栏
  
 ;启动设置
 ;(setq default-frame-alist  '((vertical-scroll-bars)   (top . 25)    (left . 45) (width . 180)  (height . 55)
 ;(background-color . "black") (foreground-color . "grey")(cursor-color     . "gold1") (mouse-color      . "gold1")  (tool-bar-lines . 0)  (menu-bar-lines . 1)  (right-fringe)   (left-fringe)))
  
 ;启动自动最大化(数据自己调整，注意格式，如(top . 0)，圆点前后都要留有空格)
 (setq initial-frame-alist '((top . 0) (left . 0) (width . 120) (height . 36)))
  
  
 ; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
 (set-face-foreground 'highlight "white")
 (set-face-background 'highlight "blue")
 (set-face-foreground 'region "cyan")
 (set-face-background 'region "blue")
 (set-face-foreground 'secondary-selection "skyblue")
 (set-face-background 'secondary-selection "darkblue")
  
 ;------------窗口界面设置结束-----------------
  
 ;------------显示时间设置------------------------------
  
 (display-time-mode 1);启用时间显示设置，在minibuffer上面的那个杠上
 (setq display-time-24hr-format t);时间使用24小时制
 (setq display-time-day-and-date t);时间显示包括日期和具体时间
 (setq display-time-use-mail-icon t);时间栏旁边启用邮件设置
 (setq display-time-interval 10);时间的变化频率，单位多少来着？
  
 ;------------显示时间设置结束--------------
  
 ;------------定制操作习惯--------------------
  
 ;设置打开文件的缺省路径
 ;(setq default-directory "~/work/")
 ;(setenv "HOME" "/home/zpc")
 ;(setenv "PATH" "")
 ;------------------------------------------
  
 ;ido的配置,这个可以使你在用C-x C-f打开文件的时候在后面有提示;
 ;这里是直接打开了ido的支持，在emacs23中这个是自带的.
 (ido-mode t)
  
 (setq ido-save-directory-list-file nil)
 ;ido模式中不保存目录列表,解决退出Emacs时ido要询问编码的问题。
  
 (setq visible-bell t)
 ;关闭烦人的出错时的提示声
  
 (setq inhibit-startup-message t)
 ;关闭emacs启动时的画面
  
 (setq gnus-inhibit-startup-message t)
 ;关闭gnus启动时的画面
 (setq inhibit-startup-message t);关闭起动时闪屏 

;;shell,gdb退出后，自动关闭该buffer 
(defun kill-buffer-when-shell-command-exit () 
"Close current buffer when `shell-command' exit." 
(let ((process (ignore-errors (get-buffer-process (current-buffer))))) 
(when process 
(set-process-sentinel process 
(lambda (proc change) 
(when (string-match "\\(finished\\|exited\\)" change) 
(kill-buffer (process-buffer proc))))))))

;退出gdb的时候关闭gdb对应的buffer 
(add-hook 'gdb-mode-hook 'kill-buffer-when-shell-command-exit) 
;; 退出term的时候关闭term对应的buffer 
(add-hook 'term-mode-hook 'kill-buffer-when-shell-command-exit) 
;;编译成功后自动关闭*compilation* 函数 
(defun kill-buffer-when-compile-success (process) 
"Close current buffer when `shell-command' exit." 
(set-process-sentinel process 
(lambda (proc change) 
(when (string-match "finished" change) 
(delete-windows-on (process-buffer proc)))))) 

;; 编译成功后自动关闭*compilation* buffer 
(add-hook 'compilation-start-hook 'kill-buffer-when-compile-success) 
;;退出时寻问 
(setq kill-emacs-query-functions 
(lambda () 
(y-or-n-p "Do you really want to quit? "))) 
 
 (fset 'yes-or-no-p 'y-or-n-p)
 ; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
  
 (setq font-lock-maximum-decoration t)
 (setq font-lock-global-modes '(not shell-mode text-mode))
 (setq font-lock-verbose t)
 (setq font-lock-maximum-size '((t . 1048576) (vm-mode . 5250000)))
 ; 语法高亮。除 shell-mode 和 text-mode 之外的模式中使用语法高亮。
  
 (setq column-number-mode t)
 (setq line-number-mode t)
 ;显示行列号
 (global-linum-mode t)
 (setq mouse-yank-at-point t)
 ;不要在鼠标点击的那个地方插入剪贴板内容。我不喜欢那样，经常把我的文档搞的一团糟。我觉得先用光标定位，
 ;然后鼠标中键点击要好的多。不管你的光标在文档的那个位置，或是在 minibuffer，鼠标中键一点击，X selection 的内容就被插入到那个位置。
  
 (setq kill-ring-max 200)
 ;设置粘贴缓冲条目数量.用一个很大的kill ring(最多的记录个数). 这样防止我不小心删掉重要的东西
  
 (setq-default auto-fill-function 'do-auto-fill)
  ; Autofill in all modes;
 (setq default-fill-column 120)
 ;把 fill-column 设为 60. 这样的文字更好读
  
 (setq-default indent-tabs-mode nil)
 (setq default-tab-width 4);tab键为4个字符宽度
 (setq tab-stop-list ())
 ;不用 TAB 字符来indent, 这会引起很多奇怪的错误。编辑 Makefile 的时候也不用担心，因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的。
  
 (setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
 (setq sentence-end-double-space nil)
 ;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。
  
 (setq enable-recursive-minibuffers t)
 ;可以递归的使用 minibuffer
  
 (setq scroll-margin 3  scroll-conservatively 10000)
 ;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
  
 (setq default-major-mode 'text-mode)
 (add-hook 'text-mode-hook 'turn-on-auto-fill)
 ;设置缺省主模式是text，,并进入auto-fill次模式.而不是基本模式fundamental-mode
  
 (show-paren-mode t)
 ;打开括号匹配显示模式
  
 (setq show-paren-style 'parenthesis)
 ;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。
  
 ;(mouse-avoidance-mode 'animate)
 ;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
  
 (setq frame-title-format "emacs@%b")
 ;在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用的提示。
  
 (setq uniquify-buffer-name-style 'forward);好像没起作用
 ; 当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字，不用原来的foobar<?> 形式。
  
 (setq auto-image-file-mode t)
 ;让 Emacs 可以直接打开和显示图片。
  
 ;(auto-compression-mode 1)
 ;打开压缩文件时自动解压缩。
  
 (setq global-font-lock-mode t)
 ;进行语法加亮。
  
 (setq-default kill-whole-line t)
 ; 在行首 C-k 时，同时删除该行。
  
 (add-hook 'comint-output-filter-functions
       'comint-watch-for-password-prompt)
 ;当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况,此时加密显出你的密码
  
 ;(setq version-control t);;启用版本控制，即可以备份多次
 ; (setq kept-old-versions 2);;备份最原始的版本两次，及第一次编辑前的文档，和第二次编辑前的文档
 ; (setq kept-new-versions 1);;备份最新的版本1次，理解同上
 ; (setq delete-old-versions t);;删掉不属于以上3中版本的版本
 ; (setq backup-directory-alist '(("." . "~/backups")));;设置备份文件的路径
 ; (setq backup-by-copying t);;备份设置方法，直接拷贝
 ; Emacs 中，改变文件时，默认都会产生备份文件(以 ~ 结尾的文件)。可以完全去掉; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一个固定的地方("~/backups")。对于每个备份文件，保留最原始的两个版本和最新的1个版本。并且备份的时候，备份文件是复本，而不是原件。
  
(setq make-backup-files nil); 设定不产生备份文件
(setq auto-save-mode nil);自动保存模式
(setq-default make-backup-files nil); 不生成临时文件
(setq backup-inhibited t);;不产生备份 
(setq auto-save-default nil);不生成名为#filename# 的临时文件 
;; 用M-x执行某个命令的时候，在输入的同时给出可选的命令名提示 
(icomplete-mode 1) 
(define-key minibuffer-local-completion-map (kbd "SPC") 'minibuffer-complete-word) 

 (put 'scroll-left 'disabled nil)     ;允许屏幕左移
 (put 'scroll-right 'disabled nil)    ;允许屏幕右移
 (put 'set-goal-column 'disabled nil)
 (put 'narrow-to-region 'disabled nil)
 (put 'upcase-region 'disabled nil)
 (put 'downcase-region 'disabled nil)
 (put 'LaTeX-hide-environment 'disabled nil)
 ;把这些缺省禁用的功能打开。
  
 ;允许emacs和外部其他程序的粘贴
 (setq x-select-enable-clipboard t)
  
 (setq mouse-yank-at-point t)
 ;使用鼠标中键可以粘贴
  
 (setq user-full-name "")
 (setq user-mail-address "")
 ;设置有用的个人信息,这在很多地方有用。
  
 (setq require-final-newline t)
 ; 自动的在文件末增加一新行
  
 (setq-default transient-mark-mode t)
 ;Non-nil if Transient-Mark mode is enabled.
  
 (setq track-eol t)
 ; 当光标在行尾上下移动的时候，始终保持在行尾。
  
 (setq Man-notify-method 'pushy)
 ; 当浏览 man page 时，直接跳转到 man buffer。
  
 ;(setq next-line-add-newlines nil)
 ;Emacs 21 中已经是缺省设置。按 C-n 或向下键时不添加新行。
  
 (global-set-key [home] 'beginning-of-buffer)
 (global-set-key [end] 'end-of-buffer)
 ;设置home键指向buffer开头，end键指向buffer结尾
  
  
 (global-set-key (kbd "C-,") 'scroll-left)
 ; "C-,"设为屏幕左移命令
 (global-set-key (kbd "C-.") 'scroll-right)
 ; "C-."设为屏幕右移命令
  
 ;(global-set-key [f1] 'manual-entry)
 ;(global-set-key [C-f1] 'info )
  
 ;(global-set-key [f2] 'emacs-wiki-find-file)
 ;打开wiki
  
 ;(global-set-key [f3] 'repeat-complex-command)
  
 ;(global-set-key [f4] 'other-window)
 ; 跳转到 Emacs 的另一个buffer窗口


; ;; F9 调用 compile 并设置编译命令
;;; C-F9 则保存所有文件并编译(无提示)
;(defun simple-compile-commend()
;  (interactive)
;  (setq compile_file_name (substring (buffer-name (current-buffer)) 0 (string-match "[.]"  (buffer-name (current-buffer)))))
;  (setq compile_file_name (concat compile_file_name ".exe"))
;  (setq compile-command 
;	(concat  "g++ -g "
;		 " -o "
;		 compile_file_name
;		 " && "
;		 compile_file_name
;		 ))
;  )
; 
;(defun shrink-compile-window()
;  "shrink compile window, avoid compile window occupy 1/2 hight of whole window"
;  (interactive)
;  ;;(select-window (get-buffer-window "*compilation*"))
;  (setq compiled_buffer_name (buffer-name (current-buffer)))
;  (switch-to-buffer-other-window "*compilation*")
;  (if (< (/ (frame-height) 3) (window-height))
;      (shrink-window (/ (window-height) 2)))
;  (switch-to-buffer-other-window compiled_buffer_name)
;  )
; 
;;;C-F9保存当前所有未保存的buffer并编译当前buffer
;(global-set-key [C-f9] '(lambda()
;			  "Save buffers and start compile"
;			  (interactive)
;			  (save-some-buffers t)
;			  (simple-compile-commend)
;			  (compile compile-command)
;			  (shrink-compile-window)
;			  )
;		) 
;;;F9调用compile编译当前buffer
;(global-set-key [f9] '(lambda ()
;			(interactive)
;			(simple-compile-commend)	
;			(compile compile-command)
;			(shrink-compile-window)
;			)
;)
 (defun du-onekey-compile ()
   "Save buffers and start compile"
   (interactive)
   (save-some-buffers t)
   (switch-to-buffer-other-window "*compilation*")
   (compile compile-command))
   (global-set-key [C-f5] 'compile)
   (global-set-key [f5] 'du-onekey-compile)
 ;  C-f5, 设置编译命令; f5, 保存所有文件然后编译当前窗口文件
  
 (global-set-key [f6] 'gdb)
 ;F6设置为在Emacs中调用gdb
  
 (global-set-key [C-f7] 'previous-error)
 (global-set-key [f7] 'next-error)
  
 (defun open-eshell-other-buffer ()
   (interactive)
   (split-window-horizontally)
   (eshell))
 (global-set-key [(f8)] 'open-eshell-other-buffer)
 (global-set-key [C-f8] 'eshell)
  
 (setq speedbar-show-unknown-files t);可以显示所有目录以及文件
 (setq dframe-update-speed nil);不自动刷新，手动 g 刷新
 (setq speedbar-update-flag nil)
 (setq speedbar-use-images nil);不使用 image 的方式
 (setq speedbar-verbosity-level 0)
  
 ;(global-set-key [f9] 'speedbar)
 ;设置f9调用speedbar命令
 ;使用 n 和 p 可以上下移动，
 ; + 展开目录或文件进行浏览，- 收缩，RET 访问目录或文件，g 更新 speedbar。
  
 (setq dired-recursive-copies 'top)
 (setq dired-recursive-deletes 'top)
 ;让 dired 可以递归的拷贝和删除目录。

 ;(global-set-key [C-f9] 'dired)
 ;设置[C-f9]为调用dired命令
  
 (global-set-key [f10] 'undo)
 ;设置F10为撤销
  
 ;(global-set-key [f11] 'calendar)
 ;设置F11快捷键指定Emacs 的日历系统
  
 ;(global-set-key [f12] 'list-bookmarks)
 ;设置F12 快速察看日程安排
  
 (setq time-stamp-active t)
 (setq time-stamp-warn-inactive t)
 (setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chunyu")
 ; 设置时间戳，标识出最后一次保存文件的时间。
  
 (global-set-key (kbd "M-g") 'goto-line)
 ;设置M-g为goto-line
  
 (global-set-key (kbd "C-SPC") 'nil)
 ;取消control+space键设为mark
  
 (global-set-key (kbd "s-SPC") 'set-mark-command)
 ;用win+space键来set-mark，这样，C-SPC就可以用来调用外部输入法了。
  
 ;----------定制操作习惯结束-------------
  
 ;----------日历设置--------------------
 ;设置日历的一些颜色
 (setq calendar-load-hook
 '(lambda ()
 (set-face-foreground 'diary-face "skyblue")
 (set-face-background 'holiday-face "slate blue")
 (set-face-foreground 'holiday-face "white")))
  

 ;-----------日记设置---------------------
  
 (setq diary-file ""); 默认的日记文件
 (setq diary-mail-addr "")
 ;(add-hook 'diary-hook 'appt-make-list)
 ;当你创建了一个'~/diary'文件，你就可以使用calendar去查看里面的内容。你可以查看当天的事件，相关命令如下 ：
 ;  d     显示被选中的日期的所有事件
 ;  s     显示所有事件，包括过期的，未到期的等等
  
 ; 创建一个事件的样例：
 ; 02/11/1989
 ;     Bill B. visits Princeton today
 ;     2pm Cognitive Studies Committee meeting
 ;     2:30-5:30 Liz at Lawrenceville
 ;     4:00pm Dentist appt
 ;     7:30pm Dinner at George's
 ;     8:00-10:00pm concert
  
 ; 创建事件的命令：
 ; i d   为当天日期添加一个事件
 ; i w   为当天周创建一个周事件
 ; i m   为当前月创建一个月事件
 ; i y   为当前年创建一个年事件
 ; i a   为当前日期创建一个周年纪念日
 ; i c   创建一个循环的事件
  
 ;----------日记设置结束-----------------
  
  
 ;-------------方便编程操作设置----------------
  
 ;代码折叠
 (load-library "hideshow")
 (add-hook 'c-mode-hook 'hs-minor-mode)
 (add-hook 'c++-mode-hook 'hs-minor-mode)
 (add-hook 'java-mode-hook 'hs-minor-mode)
 (add-hook 'perl-mode-hook 'hs-minor-mode)
 (add-hook 'php-mode-hook 'hs-minor-mode)
 (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
 ;能把一个代码块缩起来，需要的时候再展开
 ;  M-x              hs-minor-mode
 ;  C-c @ ESC C-s    show all
 ;  C-c @ ESC C-h    hide all
 ;  C-c @ C-s        show block
 ;  C-c @ C-h        hide block
 ;  C-c @ C-c toggle hide/show
  
  
;;;自动补全括号
;;;输入左边的括号，就会自动补全右边的部分.包括(), "", [] , {} , 等等。 
;(defun my-common-mode-auto-pair () 
;(interactive) 
;(make-local-variable 'skeleton-pair-alist) 
;(setq skeleton-pair-alist '( 
;(? ? _ "''") 
;(? ? _ """") 
;(? ? _ "()") 
;(? ? _ "[]") 
;(?{ _ ?} >))) 
;(setq skeleton-pair t) 
;(local-set-key (kbd "(") 'skeleton-pair-insert-maybe) 
;(local-set-key (kbd "\"") 'skeleton-pair-insert-maybe) 
;(local-set-key (kbd "{") 'skeleton-pair-insert-maybe) 
;(local-set-key (kbd "\'") 'skeleton-pair-insert-maybe) 
;(local-set-key (kbd "[") 'skeleton-pair-insert-maybe)) 
;(add-hook 'c-mode-hook 'my-common-mode-auto-pair) 
;(add-hook 'c++-mode-hook 'my-common-mode-auto-pair) 
;(add-hook 'java-mode-hook 'my-common-mode-auto-pair) 
;(add-hook 'lisp-mode-hook 'my-common-mode-auto-pair) 
;(add-hook 'php-mode-hook 'my-common-mode-auto-pair) 
;(add-hook 'python-mode-hook 'my-common-mode-auto-pair) 
;(add-hook 'html-mode-hook 'my-common-mode-auto-pair) 
;(add-hook 'scheme-mode-hook 'my-common-mode-auto-pair) 
;(add-hook 'css-mode-hook 'my-common-mode-auto-pair) 
;(add-hook 'sql-mode-hook 'my-common-mode-auto-pair) 
;(add-hook 'emacs-lisp-mode-hook 'my-common-mode-auto-pair) 
;(add-hook 'text-mode-hook 'my-common-mode-auto-pair) 


 ;(defun my-c-mode-auto-pair ()
 ;  (interactive)
 ;  (make-local-variable 'skeleton-pair-alist)
 ;  (setq skeleton-pair-alist  '(
 ;    (?` ?` _ "''")
 ;    (?\(?  _ ")")
 ;    (?\[?  _ "]")
 ;    (?{ \n > _ \n ?} >)))
 ;  (setq skeleton-pair t)
 ;  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
 ;  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
 ;  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
 ;  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
 ;(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
 ;(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
 ;;输入左边的括号，就会自动补全右边的部分.包括(), "", [] , {} , 等等。
 
  
 ;把c语言风格设置为k&r风格
 (add-hook 'c-mode-hook
 '(lambda ()
 (c-set-style "k&r")))
  
 (autoload 'css-mode "css-mode" "CSS editing mode" t)
 ;css-mode.el编辑css文件
  
 (autoload 'htmlize-buffer "htmlize" "HTMLize mode" t)
 ;把buffer的内容连同颜色转为html格式
  
 (autoload 'folding-mode          "folding" "Folding mode" t)
 (autoload 'turn-off-folding-mode "folding" "Folding mode" t)
 (autoload 'turn-on-folding-mode  "folding" "Folding mode" t)
 ;folding.el 编辑文本的一部分，其它部分折叠起来
  
 (setq auto-mode-alist
       ; 将文件模式和文件后缀关联起来
          (append '(("\\.css$"  . css-mode) 
             ("\\.c$"    . c-mode) 
             ("\\.cc$"   . c++-mode) 
             ("\\.cpp$"  . c++-mode) 
             ("\\.cxx$"  . c++-mode) 
             ("\\.e$"    . eiffel-mode) 
             ("\\.hxx$"  . c++-mode) 
             ("\\.h$"    . c++-mode) 
             ("\\.hh$"   . c++-mode) 
             ("\\.idl$"  . c++-mode) 
             ("\\.ipp$"  . c++-mode) 
             ("\\.java$" . java-mode) 
             ("\\.lua"   . lua-mode) 
             ("\\.pl$"   . perl-mode) 
             ("\\.pm$"   . perl-mode) 
             ("\\.rb$"   . ruby-mode) 
             ("\\.rbw$"  . ruby-mode) 
             ("\\.t2t$"  . t2t-mode) 
             ("\\.txt$"  . text-mode) 
             ("\\.py\\'" . python-mode)
             ("\\.s?html?\\'" . html-helper-mode)
             ("\\.asp\\'" . html-helper-mode)
             ("\\.phtml\\'" . html-helper-mode)
             ("\\.css\\'" . css-mode)
             ("\\.hs$"  . haskel-mode))
          auto-mode-alist))

;;set ibus-el
(add-to-list 'load-path "~/.emacs.d/ibus-el-0.3.2")
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)

(setq-default cursor-type 'bar);光标变成竖线

;;;;;;;;;;;;;;;;;;;;;;;
;;start cedet
(require 'cedet)

(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)

; Semantic setup
;(global-semantic-idle-completions-mode t)
;(global-semantic-decoration-mode t)
;(global-semantic-highlight-func-mode t)
;(global-semantic-show-unmatched-syntax-mode t)

;; CC-mode
(add-hook 'c-mode-hook '(lambda ()
        (setq ac-sources (append '(ac-source-semantic) ac-sources))
        (local-set-key (kbd "RET") 'newline-and-indent)
        (linum-mode t)
        (semantic-mode t)))

;; smart complitions
(require 'semantic/ia)
(setq-mode-local c-mode semanticdb-find-default-throttle
'(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
'(project unloaded system recursive))

;;;; Semantic DataBase存储位置
(setq semanticdb-default-save-directory
(expand-file-name "~/.emacs.d/semanticdb"))

;;semanticdb 可以使用其他工具产生的Tag，例如GNU Global产生的Tags，按照下面代码来启用
;; 使用 gnu global 的TAGS。
(require 'semantic/db-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

;start EDE
(global-ede-mode t)

(global-semantic-highlight-edits-mode (if window-system 1 -1))
(global-semantic-show-unmatched-syntax-mode 1)
(global-semantic-show-parser-state-mode 1)

;;;;;;;;;;;;;;;auto-complete  set;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/pos-tip")
;(add-to-list 'load-path "~/.emacs.d/fuzzy-el")
(add-to-list 'load-path "~/.emacs.d/popup-el")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
;加载auto-complete并添加字典路径
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/auto-complete/dict")
(ac-config-default)
;设置auto-complete的触发键
(setq ac-auto-start nil)  ;auto complete using clang is CPU sensitive
(ac-set-trigger-key "<C-return>")

;;;;;;;;;;;;;;;;;yasnippet set;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;;;;;;;;;;;;;;split window horizontal;;;;;;;
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;;;;;;;;; C-c C-w 复制整行, 而"C-u 5 C-c w"复制 5 行

(global-set-key (kbd "C-c w") 'copy-lines)

(defun copy-lines(&optional arg)
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (set-mark (point))
    (next-line arg)
    (kill-ring-save (mark) (point))
    )
  )
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(mouse-scroll-delay 0.1)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (5 ((shift) . 1) ((control))))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;;;;;;;;;start markdown mode;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/language_mode")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;;;;;;;;;;load tiny-tools path;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/plugins/tiny-tools/lisp/tiny")
(add-to-list 'load-path "~/.emacs.d/plugins/tiny-tools/lisp/other")

;;;;;;;;;;ecb setting;;;;;;;;;;
;;donot show the tip
(setq ecb-tip-of-the-day nil)
;;let the mouse could be used
;'(ecb-primary-secondary-mouse-buttons(quote mouse-1--C-mouse-1)
;;;;;;;;;; use cscope
;(require 'xcscope)

;;;;;;;;;; use ido
(require 'ido)
(ido-mode t)
;;;;;;;;;;; use iswitchb-mode ;;this is similar with ido
;(iswitchb-mode 1)
;(setq iswitchb-buffer-ignore '("^ " "*Buffer"))
;(setq iswitchb-default-method 'samewindow)

;;;;;;;;;; not wrap search
(setq isearch-wrap-function (lambda () (error "no more matches")))

;;;;;;;;;; set highlight-symbol
(require 'highlight-symbol)
(global-set-key [(s f9)] 'highlight-symbol-at-point)
(global-set-key [(s f10)] 'highlight-symbol-next)
(global-set-key [(s f11)] 'highlight-symbol-prev)
(global-set-key (kbd "s-s") 'highlight-symbol-prev)
(global-set-key (kbd "s-r") 'highlight-symbol-query-replace)

;;;;;;;;;; set and use ELPA in Emacs 23
(add-to-list 'load-path "~/.emacs.d/package.el-master")
(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
;;;;;;;;;; set and use ELPA in Emacs 24
;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;                         ("marmalade" . "http://marmalade-repo.org/packages/")
;                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;;;;;;;;;; set and use evil
(add-to-list 'load-path "~/.emacs.d/evil") ; only without ELPA/el-get
    (require 'evil)
    (evil-mode 1)

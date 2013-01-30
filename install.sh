#!/bin/bash

#=============================================================================
#     FileName: install.sh
#         Desc: 
#       Author: zpc
#        Email: zpc987@gmail.com
#     HomePage:  
#      Version: 0.0.1
#   LastChange: 2013-01-07 22:36:05
#      History:
#=============================================================================
 
# 如果系统提示没有add-apt-repository命令，则需要先安装python-software-properties，
# 命令sudo apt-get install python-software-properties。
# 另外，有些版本的ubuntu即使安装了python-software-properties也无add-apt-repository命令,
# 此时需要手动添加源到sources.list文件中。

#---------     删除一些没用的软件 ------------
#----------   force-yes  -y-------
sudo apt-get remove totem totem-gstreamer totem-mozilla --force-yes  -y
sudo apt-get remove rhythmbox evolution bittorrent empathy --force-yes  -y
 
 
#-------------------------------------------
#---------     常用软件     --------------
#-------------------------------------------
 
#安装压缩类软件
sudo apt-get install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar  --force-yes  -y

#安装 RSS 新闻阅读器
sudo apt-get install akregator  --force-yes  -y

#安装互联网常用工具
sudo apt-get install filezilla amsn iptux --force-yes  -y

#安装LINUX下远程windows的工具，redsktop使用命令行启动
sudo apt-get install rdesktop

#安装虚拟机
sudo apt-get install virtualbox

#添加源
sudo add-apt-repository ppa:emesene-team/emesene-stable
sudo add-apt-repository ppa:happyaron/ppa
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo add-apt-repository ppa:tualatrix/ppa
sudo add-apt-repository ppa:gnome3-team/gnome3
sudo apt-get update

#安装emesene
#sudo add-apt-repository ppa:emesene-team/emesene-stable
sudo apt-get install --force-yes -y emesene

#安装飞信
#sudo add-apt-repository ppa:happyaron/ppa
sudo apt-get install --force-yes  -y openfetion

#安装Fcitx输入法
#sudo add-apt-repository ppa:wengxt/fcitx-nightly
#sudo apt-get update
#不安装源应该也可以
#sudo apt-get install fcitx
#im-switch -s fcitx -z default

#安装IBUS框架拼音输入法,安装ibus框架、设置面板、拼音输入法
sudo apt-get install ibus --force-yes  -y 
#在KDE下，装了IBUS框架输入法并更新字体后，无法打开输入法，输入法图标不显示，解决办法
sudo apt-get install gnome-icon-theme  --force-yes  -y 
sudo apt-get install ibus ibus-gtk ibus-gtk3 ibus-qt4   --force-yes  -y 
sudo apt-get install ibus-pinyin  --force-yes  -y 
im-switch -s ibus

#安装英汉辞典
sudo apt-get install stardict

#安装影音工具
sudo apt-get install --force-yes  -y "gnome-MPlayer"
#sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get install audacious -y
  
#安装VLC ,mplayer
sudo apt-get install vlc mplayer-nogui mozilla-mplayer mplayerthumbs smplayer
#rmvb格式用smplayer放，其他用VLC,或者你可以安装kde下的播放器kplayer。
#sudo apt-get install kplayer

#-------------------------------------------
#  yakuake 终端工具
#  htop    用来查看进程，内存和IO负载。
#  curl    传输下载文件工具
#  krusader超好用的kde下的多窗口文件管理器
#-------------------------------------------
sudo apt-get install --force-yes  -y yakuake htop lrzsz sysstat sshpass curl wget nmap nload tree lynx iptraf
sudo apt-get install krusader
#安装ubuntu-tweak
#sudo add-apt-repository ppa:tualatrix/ppa
sudo apt-get install ubuntu-tweak --force-yes  -y

#阅读CHM文件，chmsee对某些不规范的chm文件支持效好
sudo apt-get install chmsee --force-yes  -y

#和Visio类似的dia（默认只能在命令行启动）
sudo apt-get install dia  --force-yes  -y
#画UML图的umbrello
sudo apt-get install umbrello  --force-yes  -y
 
#安装gnome3
#sudo add-apt-repository ppa:gnome3-team/gnome3
#sudo apt-get dist-upgrade
#sudo apt-get install --force-yes  -y gnome-shell

#右键鼠标终端  
sudo apt-get -y install nautilus-open-terminal

#可以打开多个终端的工具,和yakuake差不多
#sudo apt-get install byobu

#多媒体播放器  
sudo apt-get -y install vlc  

#安装rar支持  
sudo apt-get -y install rar unrar  

#g++  
sudo apt-get -y install g++

#java  
sudo apt-get -y install openjdk-7-jdk 

# 安装ruby ，在github上写blog需要安装jekyll
sudo apt-get install ruby1.9.1
gem install jekyll

#安装 latex
sudo apt-get install texlive-full
#latex的一个编辑器，可以不用安装，直接用vim替代
#sudo apt-get install texmaker


#git  
sudo apt-get -y install git 
sudo apt-get -y install git-doc git-el git-arch git-svn git-email git-gui gitk gitweb

#svn  
sudo apt-get -y install subversion  

#eclipse  
sudo apt-get -y install eclipse-platform  

#pdf reader  
sudo apt-get -y install okular  

#linux photoshop  
sudo apt-get -y install gimp  

#qt  
sudo apt-get -y install qt4-qmake

####  
#vi ~/.config/user-dirs.dirs为了修改默认中文的几个目录，
#变为英文的方便在命令行中操作,如果安装的是英文系统，忽略。
#       vi .config/user-dirs.dirs  

####  
echo -e "All install Over!!\n"  

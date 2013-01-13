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
 
#---------     删除一些没用的软件 ------------
#----------   force-yes  -y-------
#sudo apt-get remove totem totem-gstreamer totem-mozilla --force-yes  -y
#sudo apt-get remove rhythmbox evolution bittorrent empathy --force-yes  -y
 
 
#-------------------------------------------
#---------     常用软件     ---------------------
#-------------------------------------------
 
#安装压缩类软件
#sudo apt-get install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar  --force-yes  -y

#安装 RSS 新闻阅读器
#sudo apt-get install akregator  --force-yes  -y

#安装互联网常用工具
#sudo apt-get install filezilla amsn iptux --force-yes  -y

#sudo add-apt-repository ppa:emesene-team/emesene-stable
#sudo add-apt-repository ppa:happyaron/ppa
#sudo add-apt-repository ppa:nilarimogard/webupd8
#sudo add-apt-repository ppa:tualatrix/ppa
#sudo add-apt-repository ppa:gnome3-team/gnome3
#sudo apt-get update

#安装emesene
#sudo add-apt-repository ppa:emesene-team/emesene-stable
#sudo apt-get install --force-yes -y emesene

#安装飞信
#sudo add-apt-repository ppa:happyaron/ppa
#sudo apt-get install --force-yes  -y openfetion

#安装影音工具
#sudo apt-get install --force-yes  -y "gnome-MPlayer"
#sudo add-apt-repository ppa:nilarimogard/webupd8
#sudo apt-get install audacious -y

#安装系统工具
#sudo apt-get install --force-yes  -y yakuake htop lrzsz sysstat sshpass curl wget nmap nload tree lynx iptraf

#安装ubuntu-tweak
#sudo add-apt-repository ppa:tualatrix/ppa
#sudo apt-get install ubuntu-tweak --force-yes  -y

#阅读CHM文件，chmsee对某些不规范的chm文件支持效好
#sudo apt-get install chmsee --force-yes  -y

#和Visio类似的dia（默认只能在命令行启动）
#sudo apt-get install dia  --force-yes  -y
#画UML图的umbrello
#sudo apt-get install umbrello  --force-yes  -y
 
#安装gnome3
#sudo add-apt-repository ppa:gnome3-team/gnome3
#sudo apt-get dist-upgrade
#sudo apt-get install --force-yes  -y gnome-shell

#右键鼠标终端  
#sudo apt-get -y install nautilus-open-terminal  
#多媒体播放器  
#sudo apt-get -y install vlc  
#安装rar支持  
#sudo apt-get -y install rar unrar  
#g++  
#sudo apt-get -y install g++  
#java  
#sudo apt-get -y install openjdk-7-jdk  
#git  
#sudo apt-get -y install git 
#sudo apt-get -y install git-doc git-el git-arch git-svn git-email git-gui gitk gitweb

#svn  
#sudo apt-get -y install subversion  

#eclipse  
#sudo apt-get -y install eclipse-platform  

#pdf reader  
#sudo apt-get -y install okular  

#linux photoshop  
sudo apt-get -y install gimp  

#qt  
#sudo apt-get -y install qt4-qmake  
####  
#       vi .config/user-dirs.dirs  
####  
echo -e "All install Over!!\n"  

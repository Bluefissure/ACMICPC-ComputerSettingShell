#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
DesktopPATH=/home/syc/桌面
export PATH
#===============================================================================================
#   System Required: Ubuntu
#   Description: One click ACM-ICPC Setting Shell
#   Author: Bluefissure
#   Thanks: @Teddysun <i@teddysun.com>  
#===============================================================================================

clear
echo ""
echo "#############################################################"
echo "# One click ACM-ICPC Setting Shell                          #"
echo "# Author: Bluefissure                                       #"
echo "# Thanks: @@Teddysun <i@teddysun.com>                       #"
echo "#############################################################"
echo ""

# Make sure only root can run our script
function rootness(){
    if [[ $EUID -ne 0 ]]; then
       echo "Error:This script must be run as root!" 1>&2
       exit 1
    fi
}

# Check OS
function checkos(){
    if [ ! -z "`cat /etc/issue | grep Ubuntu`" ];then
        OS=Ubuntu
    else
        echo "Not supported OS, Please reinstall OS as Ubuntu and retry!"
        exit 1
    fi
}

#Change Sources
function change_sources(){
	echo "Changing Sources......"
    cp /etc/apt/sources.list /etc/apt/sources.list_backup
	rm /etc/apt/sources.list
    cat > /etc/apt/sources.list<<-EOF
## Major bug fix updates produced after the final release of the
## distribution.
deb http://old-releases.ubuntu.com/ubuntu/ maverick main restricted
deb-src http://old-releases.ubuntu.com/ubuntu/ maverick main restricted
deb http://old-releases.ubuntu.com/ubuntu/ maverick-updates main restricted
deb-src http://old-releases.ubuntu.com/ubuntu/ maverick-updates main restricted

deb http://old-releases.ubuntu.com/ubuntu/ maverick universe
deb-src http://old-releases.ubuntu.com/ubuntu/ maverick universe
deb http://old-releases.ubuntu.com/ubuntu/ maverick-updates universe
deb-src http://old-releases.ubuntu.com/ubuntu/ maverick-updates universe

deb http://old-releases.ubuntu.com/ubuntu/ maverick multiverse
deb-src http://old-releases.ubuntu.com/ubuntu/ maverick multiverse
deb http://old-releases.ubuntu.com/ubuntu/ maverick-updates multiverse
deb-src http://old-releases.ubuntu.com/ubuntu/ maverick-updates multiverse

# deb http://us.old-releases.ubuntu.com/ubuntu/ maverick-backports main restricted universe multiverse
# deb-src http://us.old-releases.ubuntu.com/ubuntu/ maverick-backports main restricted universe multiverse
#remastersys for backup installed system
deb http://www.remastersys.com/ubuntu maverick main
EOF
	echo "Already changed to uestc sources."
	apt-get update
	#apt-get dist-upgrade
}

#Install Java
function install_Java(){
	echo "Installing Java......"
	apt-get -y install openjdk-6-jdk
	echo "Already Installed Java"
}

#Install gcc/g++
function install_C(){
	echo "Installing C/C++......"
	apt-get -y install gcc
	apt-get -y install g++
	echo "Already Installed C/C++"
}

#Install vim
function install_Vim(){
	echo "Installing Vim......"
    
	apt-get -y install vim

	echo "Already Installed Vim"
}
#Install Emacs
function install_Emacs(){
	echo "Installing emacs......"
	apt-get -y install emacs
	echo "Already Installed emacs"
}
#Install Eclipse
function install_Eclipse(){
	echo "Installing eclipse......"
	apt-get -y install eclipse-platform
	apt-get -y install eclipse
	apt-get -y install eclipse-pde
    apt-get -y install eclipse-jdt
	
	 
	cat > $DesktopPATH/eclipse.desktop<<-EOF
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/usr/bin/eclipse
Name=Eclipse
Icon=eclipse
EOF
	chmod 777 $DesktopPATH/eclipse.desktop
	
	echo "Already Installed eclipse"
}


function install_Codeblocks(){
	echo "Installing Codeblocks......"
	apt-get -y install codeblocks
	
	cat > $DesktopPATH/codeblocks.desktop<<-EOF
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/usr/bin/codeblocks
Name=Codeblocks
Icon=codeblocks
EOF
	chmod 777 $DesktopPATH/codeblocks.desktop
	
	echo "Already Installed Codeblocks"
}

rootness
checkos
change_sources
install_C
install_Java
install_Vim
install_Emacs
install_Eclipse
install_Codeblocks




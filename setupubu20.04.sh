#!/bin/bash

#-#-#-#-#-#-#-#-#-#-#
#--Made:by:0n1cOn3--#
#                   #
#      Made in      #
#    Switzerland    #
#        <3         #
#-#-#-#-#-#-#-#-#-#-#

## Environment Config!

clear
home=$(pwd)

exit_on_signal_SIGINT () {
    echo -e "\n\n\e\$[✗] Installation has been abort!\e[0m"
    exit 0
}
trap exit_on_signal_SIGINT SIGINT

## Color the shell a bit :)) 

White='\033[0;97m'
Green='\033[0;32m'
Red='\033[0;91m'
Reset='\033[0m'

## Root Check

if ! [ $(id -u) = 0 ]; then
   	clear
   	echo -e " ${Red}***************************************************************"
   	echo -e " ${Red}* ${Green}SetupUbu20.04 requires to be executed with root permission!${Red}"
   	echo -e " ${Red}***************************************************************${Reset}"
   	sleep 2
   	clear
  	ls
  	exit 0
	else
   	echo -e " ${Red}**********************************"
   	echo -e " ${Red}* ${Green}Executed with root permission!"
   	echo -e " ${Red}**********************************"
   	sleep 2
fi

## Preparing System:

clear
echo -e " ${Red}****************************************************"
echo -e " ${Red}* ${Green}Preparing System to continue OS User Installation${Red}"
echo -e " ${Red}****************************************************${Reset}"
sleep 2
echo -e ${Reset}

if ! hash git 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	echo -e ${Reset} sudo apt install git -y
else
	echo -e $Green " git installed [✓]"
   echo -e ${Reset}
   sleep 2
fi
echo -e ${Reset}

if ! hash wget 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
   echo -e ${Reset} sudo apt install wget -y
else
	echo -e $Green "wget installed [✓]"
   echo -e ${Reset}
   sleep 2
fi

echo -e ${Reset}
clear

## Update Sources & Upgrade to the lastest Packages

clear
echo -e " ${Red}********************************************************"
echo -e " ${Red}* ${Green}Update source and upgrade to the lastest OS packages ${Red}*"
echo -e " ${Red}********************************************************"
sleep 2
echo -e ${Reset}
apt update -y
apt upgrade -y
clear

## Install Tools for daily usage: 0n1 Daily App Tools

clear
echo -e " ${Red}****************************************************"
echo -e " ${Red}* ${Green}Preparing System to continue OS User Installation${Red}"
echo -e " ${Red}****************************************************echo -e ${Reset}"
sleep 2
echo -e ${Reset}

if ! hash plasma-desktop 2>/dev/null;then
	echo -e $Red "plasma-desktop Not Installed [✗]"
	echo -e ${Reset}
	sudo apt install kde-plasma-desktop
	git clone https://github.com/yeyushengfan258/Win11OS-kde
	cd Win11OS-kde
	bash install.sh
	cd ..
	rm -rf Win11OS-kde
	set home="pwd"
	cd ${home}profile_settings
	cp -rf .* $HOME
	unset home
	sleep 2
else
	echo -e $Green "plasma-desktop installed [✓]"
    echo -e ${Reset}
    sleep 2
fi
echo -e ${Reset}

## here comes a check if the installer got interrupt. e.g.: Reboot

clear
echo -e " ${Red}****************************************************"
echo -e " ${Red}* ${Green}Preparing System to continue OS User Installation${Red}"
echo -e " ${Red}****************************************************"
sleep 2
echo -e ${Reset}

if ! hash vlc 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	echo -e ${Reset}apt install vlc -y
else
	echo -e $Green "vlc installed [✓]"
    echo -e ${Reset}
    sleep 2
fi
echo -e ${Reset}

if ! hash fail2ban 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	echo -e ${Reset}
	apt install fail2ban -y
	else
	echo -e $Green "fail2ban installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi
echo -e ${Reset}

if ! hash mpv 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	echo -e ${Reset}
	apt install mpv -y
	else
	echo -e $Green "mpv installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi
echo -e ${Reset}

if ! hash firefox 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	echo -e ${Reset}
	apt install firefox -y
	else
	echo -e $Green "mpv installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi
echo -e ${Reset}

if ! hash espeak-ng 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	echo -e ${Reset}
	sudo apt install espeak-ng -y
	else
	echo -e $Green "espeak-ng installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi
echo -e ${Reset}
clear

## local package required #dpkg -i teamviewer_15.16.8_amd64.deb

echo -e " ${Red}****************************************************"
echo -e " ${Red}* ${Green}local package required...downloading...${Red}"
echo -e " ${Red}****************************************************"
sleep 2
echo -e ${Reset}

if ! hash teamviewer 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	echo -e ${Reset}
	wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
   	sudo dpkg -i teamviewer_amd64.deb
   	sudo apt install -f
	else
	echo -e $Green "Teamviewer installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

echo -e ${Reset}

## same as above #dpkg -i anydesk_6.1.0-1_amd64.deb

if ! hash anydesk 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	echo -e ${Reset}
	wget https://download.anydesk.com/linux/anydesk_6.1.0-1_amd64.deb
   	sudo dpkg -i anydesk_6.1.0-1_amd64.deb
   	sudo apt install -f
	else
	echo -e $Green "Anydesk installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

sudo apt autoremove -y
clear
echo -e ${Reset}

## Additional Stuff...

echo -e " ${Red}*********************"
echo -e " ${Red}* ${Green}Additional Stuff..."
echo -e " ${Red}*********************"
sleep 2

if ! [ -f "~/.local/share/fonts/AppleColorEmoji.ttf" ] 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
   	wget https://github.com/samuelngs/apple-emoji-linux/releases/download/latest/AppleColorEmoji.ttf
   	mv AppleColorEmoji.ttf  /usr/local/share/fonts
   	rm AppleColorEmoji.ttf
   	fc-cache -f -v
	else
	echo -e $Green "Apple Emoji Font installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

clear
echo -e ${Reset}

## Kernel Developer requirements

echo -e " ${Red}*********************"
echo -e " ${Red}* ${Green}Kernel Development Stuff..."
echo -e " ${Red}*********************"
sleep 2

sudo apt-get update --fix-missing -y

if ! hash bc 2>/dev/null;then
	echo -e $Red "bc not Installed [✗]"
	sudo apt-get install bc -y
	else
	echo -e $Green "bc Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash bison 2>/dev/null;then
	echo -e $Red "bison not Installed [✗]"
	sudo apt-get install bison -y
	else
	echo -e $Green "bison Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash build-essential 2>/dev/null;then
	echo -e $Red "build-essential not Installed [✗]"
	sudo apt-get install build-essential -y
	else
	echo -e $Green "bc Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash zstd 2>/dev/null;then
	echo -e $Red "zstd not Installed [✗]"
	sudo apt-get install zstd -y
	else
	echo -e $Green "zstd Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash clang 2>/dev/null;then
	echo -e $Red "clang not Installed [✗]"
	sudo apt-get install bc -y
	else
	echo -e $Green "clang Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash flex 2>/dev/null;then
	echo -e $Red "flex not Installed [✗]"
	sudo apt-get install flex -y
	else
	echo -e $Green "flex Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash gnupg 2>/dev/null;then
	echo -e $Red "gnupg not Installed [✗]"
	sudo apt-get install gnupg -y
	else
	echo -e $Green "gnupg Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash gperf 2>/dev/null;then
	echo -e $Red "gperf not Installed [✗]"
	sudo apt-get install gperf -y
	else
	echo -e $Green "gperf Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash ccache 2>/dev/null;then
	echo -e $Red "ccache not Installed [✗]"
	sudo apt-get install ccache -y
	else
	echo -e $Green "ccache Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash liblz4-tool 2>/dev/null;then
	echo -e $Red "liblz4-tool not Installed [✗]"
	sudo apt-get install liblz4-tool -y
	else
	echo -e $Green "gnupg Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash libncurses5-dev 2>/dev/null;then
	echo -e $Red "libncurses5-dev not Installed [✗]"
	sudo apt-get install libncurses5-dev -y
	else
	echo -e $Green "libncurses5-dev Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash libsdl1.2-dev 2>/dev/null;then
	echo -e $Red "libsdl1.2-dev not Installed [✗]"
	sudo apt-get install libsdl1.2-dev -y
	else
	echo -e $Green "libsdl1.2-dev Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash libstdc++6 2>/dev/null;then
	echo -e $Red "libstdc++6 not Installed [✗]"
	sudo apt-get install libstdc++6 -y
	else
	echo -e $Green "libstdc++6 Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash libxml2 2>/dev/null;then
	echo -e $Red "libxml2 not Installed [✗]"
	sudo apt-get install libxml2 -y
	else
	echo -e $Green "libxml2 Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash libxml2-utils 2>/dev/null;then
	echo -e $Red "libxml2-utils not Installed [✗]"
	sudo apt-get install libxml2-utils -y
	else
	echo -e $Green "libxml2-utils Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash lzop 2>/dev/null;then
	echo -e $Red "lzop not Installed [✗]"
	sudo apt-get install lzop -y
	else
	echo -e $Green "lzop Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash pngcrush 2>/dev/null;then
	echo -e $Red "pngcrush not Installed [✗]"
	sudo apt-get install pngcrush -y
	else
	echo -e $Green "pngcrush Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash schedtool 2>/dev/null;then
	echo -e $Red "schedtool not Installed [✗]"
	sudo apt-get install schedtool -y
	else
	echo -e $Green "lzop Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash squashfs-tools 2>/dev/null;then
	echo -e $Red "squashfs-tools not Installed [✗]"
	sudo apt-get install squashfs-tools -y
	else
	echo -e $Green "squashfs-tools Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash xsltproc 2>/dev/null;then
	echo -e $Red "xsltproc not Installed [✗]"
	sudo apt-get install xsltproc -y
	else
	echo -e $Green "xsltproc Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash zlib1g-dev 2>/dev/null;then
	echo -e $Red "zlib1g-dev not Installed [✗]"
	sudo apt-get install zlib1g-dev -y
	else
	echo -e $Green "zlib1g-dev Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash libncurses5-dev 2>/dev/null;then
	echo -e $Red "libncurses5-dev not Installed [✗]"
	sudo apt-get install libncurses5-dev -y
	else
	echo -e $Green "libncurses5-dev Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash bzip2 2>/dev/null;then
	echo -e $Red "bzip2 not Installed [✗]"
	sudo apt-get install bzip2 -y
	else
	echo -e $Green "bzip2 Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash git 2>/dev/null;then
	echo -e $Red "git not Installed [✗]"
	sudo apt-get install git -y
	else
	echo -e $Green "git Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash gcc 2>/dev/null;then
	echo -e $Red "gcc not Installed [✗]"
	sudo apt-get install gcc -y
	else
	echo -e $Green "gcc Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash g++ 2>/dev/null;then
	echo -e $Red "g++ not Installed [✗]"
	sudo apt-get install g++ -y
	else
	echo -e $Green "g++ Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash libssl-dev 2>/dev/null;then
	echo -e $Red "libssl-dev not Installed [✗]"
	sudo apt-get install libssl-dev -y
	else
	echo -e $Green "libssl-dev Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash openssl 2>/dev/null;then
	echo -e $Red "openssl not Installed [✗]"
	sudo apt-get install openssl -y
	else
	echo -e $Green "openssl Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash gcc-aarch64-linux-gnu 2>/dev/null;then
	echo -e $Red "gcc-aarch64-linux-gnu not Installed [✗]"
	sudo apt-get install gcc-aarch64-linux-gnu -y
	else
	echo -e $Green "gcc-aarch64-linux-gnu Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash gcc-arm-linux-gnueabihf 2>/dev/null;then
	echo -e $Red "gcc-arm-linux-gnueabihf not Installed [✗]"
	sudo apt-get install gcc-arm-linux-gnueabihf -y
	else
	echo -e $Green "gcc-arm-linux-gnueabihf Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash lld 2>/dev/null;then
	echo -e $Red "lld not Installed [✗]"
	sudo apt-get install lld -y
	else
	echo -e $Green "lld Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash gcc-arm-linux-gnueabi 2>/dev/null;then
	echo -e $Red "gcc-arm-linux-gnueabi not Installed [✗]"
	sudo apt-get install gcc-arm-linux-gnueabi -y
	else
	echo -e $Green "gcc-arm-linux-gnueabi Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash llvm 2>/dev/null;then
	echo -e $Red "llvm not Installed [✗]"
	sudo apt-get install llvm -y
	else
	echo -e $Green "llvm Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

echo -e ${Reset}""

## install Github Desktop

if ! hash gdebi 2>/dev/null;then
	echo -e $Red "gdebi not Installed [✗]"
	sudo apt-get install gdebi-core -y
	else
	echo -e $Green "gdebi Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if ! hash github-desktop 2>/dev/null;then
	echo -e $Red "Github-Desktop not Installed [✗]"
	wget https://github.com/shiftkey/desktop/releases/download/release-2.6.3-linux1/GitHubDesktop-linux-2.6.3-linux1.deb 
    sudo gdebi GitHubDesktop-linux-2.6.3-linux1.deb
    rm gdebi GitHubDesktop-linux-2.6.3-linux1.deb
	else
	echo -e $Green "Github Desktop Installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

clear
echo -e ${Reset}

## Snap Installations...

echo -e " ${Red}************************"
echo -e " ${Red}* ${Green}Snap Installations... "
echo -e " ${Red}************************"
sleep 2
echo -e ${Reset}
sudo snap install code --classic
#snap install icq-im
sudo snap install telegram-desktop
#snap install handbrake-jz
sudo snap install mailspring
#snap install bitwarden
sudo snap install bitwarden
clear

## Add Lutris PPA

echo -e " ${Red}************************"
echo -e " ${Red}* ${Green}Adding Lutris PPA..."
echo -e " ${Red}************************"
sleep 2
echo -e ${Reset}

if ! [ -f "/etc/apt/sources.list.d/lutris-team-ubuntu-lutris-focal.list" ] 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
  	sudo add-apt-repository ppa:lutris-team/lutris
  	sudo apt update -y
	else
	echo -e $Green "Lutris-Repo installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

clear

## Install Lutris

echo -e " ${Red}************************"
echo -e " ${Red}* ${Green}Lutris Installation... "
echo -e " ${Red}************************"
sleep 2
echo -e ${Reset}

if ! hash lutris 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	echo -e ${Reset}sudo apt install lutris -y
	else
	echo -e $Green "Lutris installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi
clear
sleep 2

## Check current Projects folder & Cloning current Git Projects

echo -e "-----------------------------"
echo -e "${Green}Cloning current Git Projects"
echo -e "-----------------------------"
echo -e ${Reset}
sleep 2
cd ${HOME}Dokumente

if ! [ -d "${HOME}Dokumente/Github" ] 2>/dev/null;then
	echo -e $Red "Directory not availble [✗]"
   	sleep 1
   	cd ${home}Dokumente
   	mkdir Github
   	echo -e $Red "Directory created"
	else
	echo -e $Green "Directory already existing [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

cd "${HOME}"Dokumente/Github || return
clear

echo -e "Cloning Current Git Projects now..."
sleep 2
if ! [ -d "${HOME}Dokumente/Github/thunderstrike-framework" ] 2>/dev/null;then
   	git clone https://gitlab.com/cyberknight777/thunderstrike-framework.git -b dev
	else
	echo -e $Green "Thunderstrike-Framework folder already existing [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if [ -d "${HOME}Dokumente/Github/TBomb" ] 2>/dev/null;then
   	git clone https://github.com/TheSpeedX/TBomb.git -b dev
	else
   	echo -e $Green "TBomb folder already existing [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

echo -e "Fertig!"
espeak-ng -vde "Installation abgeschlossen. Verlauf prüfen!"
sleep 3

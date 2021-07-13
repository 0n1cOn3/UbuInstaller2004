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
${Reset}

if ! hash git 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	${Reset} apt install git -y
else
	echo -e $Green " git installed [✓]"
   ${Reset}
   sleep 2
fi
${Reset}

if ! hash wget 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
   ${Reset} apt install wget -y
else
	echo -e $Green "wget installed [✓]"
   ${Reset}
   sleep 2
fi

${Reset}
clear

## Update Sources & Upgrade to the lastest Packages

clear
echo -e " ${Red}********************************************************"
echo -e " ${Red}* ${Green}Update source and upgrade to the lastest OS packages ${Red}*"
echo -e " ${Red}********************************************************"
sleep 2
${Reset}
apt update -y
apt upgrade -y
clear

## Install Tools for daily usage: 0n1 Daily App Tools

clear
echo -e " ${Red}****************************************************"
echo -e " ${Red}* ${Green}Preparing System to continue OS User Installation${Red}"
echo -e " ${Red}****************************************************${Reset}"
sleep 2
${Reset}

if ! hash plasma-desktop 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	${Reset}apt install plasma-desktop -y
else
	echo -e $Green "plasma-desktop installed [✓]"
   ${Reset}
   sleep 2
fi
${Reset}

if ! hash plasma-nm 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	${Reset}apt install plasma-nm -y
else
	echo -e $Green "plasma-nm installed [✓]"
   ${Reset}
   sleep 2
fi
${Reset}

## here comes a check if the installer got interrupt. e.g.: Reboot

clear
echo -e " ${Red}****************************************************"
echo -e " ${Red}* ${Green}Preparing System to continue OS User Installation${Red}"
echo -e " ${Red}****************************************************"
sleep 2
${Reset}

if ! hash vlc 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	${Reset}apt install vlc -y
else
	echo -e $Green "vlc installed [✓]"
   ${Reset}
   sleep 2
fi
${Reset}

if ! hash fail2ban 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	${Reset}
	apt install fail2ban -y
	else
	echo -e $Green "fail2ban installed [✓]"
   	${Reset}
   	sleep 2
fi
${Reset}

if ! hash mpv 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	${Reset}
	apt install mpv -y
	else
	echo -e $Green "mpv installed [✓]"
   	${Reset}
   	sleep 2
fi
${Reset}

if ! hash bitwarden 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	${Reset}
	sudo snap install bit
	else
	echo -e $Green "espeak-ng installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash espeak-ng 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	${Reset}
	apt install espeak-ng -y
	else
	echo -e $Green "espeak-ng installed [✓]"
   	${Reset}
   	sleep 2
fi
${Reset}
clear

## local package required #dpkg -i teamviewer_15.16.8_amd64.deb

echo -e " ${Red}****************************************************"
echo -e " ${Red}* ${Green}local package required...downloading...${Red}"
echo -e " ${Red}****************************************************"
sleep 2
${Reset}

if ! hash teamviewer 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	${Reset}wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
   	sudo dpkg -i teamviewer_amd64.deb
   	sudo apt install -f
	else
	echo -e $Green "Teamviewer installed [✓]"
   	${Reset}
   	sleep 2
fi

${Reset}

## same as above #dpkg -i anydesk_6.1.0-1_amd64.deb

if ! hash anydesk 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	${Reset}wget https://download.anydesk.com/linux/anydesk_6.1.0-1_amd64.deb
   	sudo dpkg -i anydesk_6.1.0-1_amd64.deb
   	sudo apt install -f
	else
	echo -e $Green "Anydesk installed [✓]"
   	${Reset}
   	sleep 2
fi

sudo apt autoremove -y
clear
${Reset}

## Additional Stuff...

echo -e " ${Red}*********************"
echo -e " ${Red}* ${Green}Additional Stuff..."
echo -e " ${Red}*********************"
sleep 2

if ! [ -f "~/.local/share/fonts/AppleColorEmoji.ttf" ] 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
   	wget https://github.com/samuelngs/apple-emoji-linux/releases/download/latest/AppleColorEmoji.ttf
   	mv AppleColorEmoji.ttf  ~/.local/share/fonts
   	rm AppleColorEmoji.ttf
   	fc-cache -f -v
	else
	echo -e $Green "Apple Emoji Font installed [✓]"
   	${Reset}
   	sleep 2
fi

clear
${Reset}

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
   	${Reset}
   	sleep 2
fi

if ! hash bison 2>/dev/null;then
	echo -e $Red "bison not Installed [✗]"
	sudo apt-get install bison -y
	else
	echo -e $Green "bison Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash build-essential 2>/dev/null;then
	echo -e $Red "build-essential not Installed [✗]"
	sudo apt-get install build-essential -y
	else
	echo -e $Green "bc Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash zstd 2>/dev/null;then
	echo -e $Red "zstd not Installed [✗]"
	sudo apt-get install zstd -y
	else
	echo -e $Green "zstd Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash clang 2>/dev/null;then
	echo -e $Red "clang not Installed [✗]"
	sudo apt-get install bc -y
	else
	echo -e $Green "clang Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash flex 2>/dev/null;then
	echo -e $Red "flex not Installed [✗]"
	sudo apt-get install flex -y
	else
	echo -e $Green "flex Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash gnupg 2>/dev/null;then
	echo -e $Red "gnupg not Installed [✗]"
	sudo apt-get install gnupg -y
	else
	echo -e $Green "gnupg Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash gperf 2>/dev/null;then
	echo -e $Red "gperf not Installed [✗]"
	sudo apt-get install gperf -y
	else
	echo -e $Green "gperf Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash ccache 2>/dev/null;then
	echo -e $Red "ccache not Installed [✗]"
	sudo apt-get install ccache -y
	else
	echo -e $Green "ccache Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash liblz4-tool 2>/dev/null;then
	echo -e $Red "liblz4-tool not Installed [✗]"
	sudo apt-get install liblz4-tool -y
	else
	echo -e $Green "gnupg Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash libncurses5-dev 2>/dev/null;then
	echo -e $Red "libncurses5-dev not Installed [✗]"
	sudo apt-get install libncurses5-dev -y
	else
	echo -e $Green "libncurses5-dev Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash libsdl1.2-dev 2>/dev/null;then
	echo -e $Red "libsdl1.2-dev not Installed [✗]"
	sudo apt-get install libsdl1.2-dev -y
	else
	echo -e $Green "libsdl1.2-dev Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash libstdc++6 2>/dev/null;then
	echo -e $Red "libstdc++6 not Installed [✗]"
	sudo apt-get install libstdc++6 -y
	else
	echo -e $Green "libstdc++6 Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash libxml2 2>/dev/null;then
	echo -e $Red "libxml2 not Installed [✗]"
	sudo apt-get install libxml2 -y
	else
	echo -e $Green "libxml2 Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash libxml2-utils 2>/dev/null;then
	echo -e $Red "libxml2-utils not Installed [✗]"
	sudo apt-get install libxml2-utils -y
	else
	echo -e $Green "libxml2-utils Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash lzop 2>/dev/null;then
	echo -e $Red "lzop not Installed [✗]"
	sudo apt-get install lzop -y
	else
	echo -e $Green "lzop Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash pngcrush 2>/dev/null;then
	echo -e $Red "pngcrush not Installed [✗]"
	sudo apt-get install pngcrush -y
	else
	echo -e $Green "pngcrush Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash schedtool 2>/dev/null;then
	echo -e $Red "schedtool not Installed [✗]"
	sudo apt-get install schedtool -y
	else
	echo -e $Green "lzop Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash squashfs-tools 2>/dev/null;then
	echo -e $Red "squashfs-tools not Installed [✗]"
	sudo apt-get install squashfs-tools -y
	else
	echo -e $Green "squashfs-tools Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash xsltproc 2>/dev/null;then
	echo -e $Red "xsltproc not Installed [✗]"
	sudo apt-get install xsltproc -y
	else
	echo -e $Green "xsltproc Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash zlib1g-dev 2>/dev/null;then
	echo -e $Red "zlib1g-dev not Installed [✗]"
	sudo apt-get install zlib1g-dev -y
	else
	echo -e $Green "zlib1g-dev Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash libncurses5-dev 2>/dev/null;then
	echo -e $Red "libncurses5-dev not Installed [✗]"
	sudo apt-get install libncurses5-dev -y
	else
	echo -e $Green "libncurses5-dev Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash bzip2 2>/dev/null;then
	echo -e $Red "bzip2 not Installed [✗]"
	sudo apt-get install bzip2 -y
	else
	echo -e $Green "bzip2 Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash git 2>/dev/null;then
	echo -e $Red "git not Installed [✗]"
	sudo apt-get install git -y
	else
	echo -e $Green "git Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash gcc 2>/dev/null;then
	echo -e $Red "gcc not Installed [✗]"
	sudo apt-get install gcc -y
	else
	echo -e $Green "gcc Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash g++ 2>/dev/null;then
	echo -e $Red "g++ not Installed [✗]"
	sudo apt-get install g++ -y
	else
	echo -e $Green "g++ Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash libssl-dev 2>/dev/null;then
	echo -e $Red "libssl-dev not Installed [✗]"
	sudo apt-get install libssl-dev -y
	else
	echo -e $Green "libssl-dev Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash openssl 2>/dev/null;then
	echo -e $Red "openssl not Installed [✗]"
	sudo apt-get install openssl -y
	else
	echo -e $Green "openssl Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash gcc-aarch64-linux-gnu 2>/dev/null;then
	echo -e $Red "gcc-aarch64-linux-gnu not Installed [✗]"
	sudo apt-get install gcc-aarch64-linux-gnu -y
	else
	echo -e $Green "gcc-aarch64-linux-gnu Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash gcc-arm-linux-gnueabihf 2>/dev/null;then
	echo -e $Red "gcc-arm-linux-gnueabihf not Installed [✗]"
	sudo apt-get install gcc-arm-linux-gnueabihf -y
	else
	echo -e $Green "gcc-arm-linux-gnueabihf Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash lld 2>/dev/null;then
	echo -e $Red "lld not Installed [✗]"
	sudo apt-get install lld -y
	else
	echo -e $Green "lld Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash gcc-arm-linux-gnueabi 2>/dev/null;then
	echo -e $Red "gcc-arm-linux-gnueabi not Installed [✗]"
	sudo apt-get install gcc-arm-linux-gnueabi -y
	else
	echo -e $Green "gcc-arm-linux-gnueabi Installed [✓]"
   	${Reset}
   	sleep 2
fi

if ! hash llvm 2>/dev/null;then
	echo -e $Red "llvm not Installed [✗]"
	sudo apt-get install llvm
	else
	echo -e $Green "llvm Installed [✓]"
   	${Reset}
   	sleep 2
fi

clear
${Reset}

## Snap Installations...

echo -e " ${Red}************************"
echo -e " ${Red}* ${Green}Snap Installations... "
echo -e " ${Red}************************"
sleep 2
${Reset}
sudo snap install code --classic
#snap install icq-im
sudo snap install telegram-desktop
#snap install handbrake-jz
sudo snap install mailspring
#snap install bitwarden
clear

## Add Lutris PPA

echo -e " ${Red}************************"
echo -e " ${Red}* ${Green}Adding Lutris PPA..."
echo -e " ${Red}************************"
sleep 2
${Reset}

if [ -f "/etc/apt/sources.list.d/lutris-team-ubuntu-lutris-focal.list" ] 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
  	sudo add-apt-repository ppa:lutris-team/lutris
  	sudo apt update -y
	else
	echo -e $Green "Lutris-Repo installed [✓]"
   	${Reset}
   	sleep 2
fi

clear

## Install Lutris

echo -e " ${Red}************************"
echo -e " ${Red}* ${Green}Lutris Installation... "
echo -e " ${Red}************************"
sleep 2
${Reset}

if ! hash lutris 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	${Reset}apt install lutris -y
	else
	echo -e $Green "Lutris installed [✓]"
   	${Reset}
   	sleep 2
fi
clear
sleep 2

## Check current Projects folder & Cloning current Git Projects

echo -e "-----------------------------"
echo -e "${Green}Cloning current Git Projects"
echo -e "-----------------------------"
${Reset}
sleep 2
cd ${home}Dokumente

if ! [ -d "${home}/Dokumente/Github" ] 2>/dev/null;then
	echo -e $Red "Directory not availble [✗]"
   	sleep 1
   	cd ${home}Dokumente
   	mkdir Github
   	echo -e $Red "Directory created"
	else
	echo -e $Green "Directory already existing [✓]"
   	${Reset}
   	sleep 2
fi

cd "${home}"Dokumente/Github || return
clear

echo -e "Cloning Current Git Projects now..."
sleep 2
if ! [ -d "${home}/Dokumente/Github/thunderstrike-framework" ] 2>/dev/null;then
   	git clone https://gitlab.com/cyberknight777/thunderstrike-framework.git -b dev
	else
	echo -e $Green "Thunderstrike-Framework folder already existing [✓]"
   	${Reset}
   	sleep 2
fi

if [ -d "${home}/Dokumente/Github/TBomb" ] 2>/dev/null;then
   	git clone https://github.com/TheSpeedX/TBomb.git -b dev
	else
   	echo -e $Green "TBomb folder already existing [✓]"
   	${Reset}
   	sleep 2
fi

echo -e "Fertig!"
espeak-ng -vde "Installation abgeschlossen. Verlauf prüfen!"
sleep 3

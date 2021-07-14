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
	echo -e ${Reset}
	sudo apt install git -y
else
	echo -e $Green " git installed [✓]"
   echo -e ${Reset}
   sleep 2
fi
echo -e ${Reset}

if ! hash wget 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
   echo -e ${Reset} 
   sudo apt install wget -y
else
	echo -e $Green "wget installed [✓]"
   echo -e ${Reset}
   sleep 2
fi

echo -e ${Reset}
clear

## Update Sources & Upgrade to the lastest Packages

clear
echo -e " ${Red}***************************************************************"
echo -e " ${Red}* ${Green}Update source and upgrade to the latest OS packages ${Red}*"
echo -e " ${Red}***************************************************************"
sleep 2
echo -e ${Reset}
apt update -y
apt upgrade -y
clear

## Install Tools for daily usage: 0n1 Daily App Tools

clear
echo -e " ${Red}*************************************************************"
echo -e " ${Red}* ${Green}Preparing System to continue OS User Installation${Red}*"
echo -e " ${Red}*************************************************************"
sleep 2
echo -e ${Reset}

if ! hash plasma-desktop 2>/dev/null;then
	echo -e $Red "plasma-desktop Not Installed [✗]"
	echo -e ${Reset}
	sudo apt install kde-plasma-desktop -y
	sleep 2 
	echo -e "Continue Installation of GUI Environment..."
	sleep 2
	git clone https://github.com/yeyushengfan258/Win11OS-kde
	cd Win11OS-kde
	bash install.sh
	cd ..
	rm -rf Win11OS-kde
	set home="pwd"
	cd profile_settings
	cp -rf .* $HOME
	unset home
	cd ..
	sleep 2
else
	echo -e $Green "plasma-desktop installed [✓]"
    echo -e ${Reset}
    sleep 2
fi
echo -e ${Reset}

## here comes a check if the installer got interrupt. e.g.: Reboot

clear
echo -e " ${Red}*************************************************************"
echo -e " ${Red}* ${Green}Preparing System to continue OS User Installation ${Red}*"
echo -e " ${Red}*************************************************************"
sleep 2
echo -e ${Reset}

if ! hash vlc 2>/dev/null;then
	echo -e $Red "VLC not Installed [✗]"
	echo -e ${Reset}
	apt install vlc -y
else
	echo -e $Green "vlc installed [✓]"
    	echo -e ${Reset}
    	sleep 2
fi
echo -e ${Reset}

if ! hash fail2ban 2>/dev/null;then
	echo -e $Red "fail2ban not Installed [✗]"
	echo -e ${Reset}
	apt install fail2ban -y
else
	echo -e $Green "fail2ban installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi
echo -e ${Reset}

if ! hash mpv 2>/dev/null;then
	echo -e $Red "mpv not Installed [✗]"
	echo -e ${Reset}
	apt install mpv -y
else
	echo -e $Green "mpv installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi
echo -e ${Reset}

if ! hash firefox 2>/dev/null;then
	echo -e $Red "Firefox not Installed [✗]"
	echo -e ${Reset}
	apt install firefox -y
else
	echo -e $Green "Firefox installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi
echo -e ${Reset}

if ! hash espeak-ng 2>/dev/null;then
	echo -e $Red "espeak-ng not Installed [✗]"
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
echo -e " ${Red}* ${Green}local package required...downloading... ${Red}*"
echo -e " ${Red}****************************************************"
sleep 2
echo -e ${Reset}

if ! hash teamviewer 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
	echo -e ${Reset}
	wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
   	sudo dpkg -i teamviewer_amd64.deb
   	sudo apt install -f
	rm teamviewer_amd64.deb
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
	rm anydesk_6.1.0-1_amd64.deb
else
	echo -e $Green "Anydesk installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

sudo apt autoremove -y
clear
echo -e ${Reset}

## Additional Stuff...

echo -e " ${Red}*************************"
echo -e " ${Red}* ${Green}Additional Stuff... ${Red}*"
echo -e " ${Red}*************************"
sleep 2

if ! [ -f "/usr/local/share/fonts/AppleColorEmoji.ttf" ] 2>/dev/null;then
	echo -e $Red "Not Installed [✗]"
   	wget https://github.com/samuelngs/apple-emoji-linux/releases/download/latest/AppleColorEmoji.ttf
   	mv AppleColorEmoji.ttf  /usr/local/share/fonts
   	fc-cache -f -v
else
	echo -e $Green "Apple Emoji Font installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

clear
echo -e ${Reset}

## Kernel Developer requirements

echo -e " ${Red}*******************************"
echo -e " ${Red}* ${Green}Kernel Development Stuff... ${Red}*"
echo -e " ${Red}*******************************"
sleep 2

sudo apt-get update --fix-missing -y

pkg=(squashfs-tools bc bison gcc make python3-dev python3 wget curl build-essential zstd clang flex gnupg gperf ccache liblz4-tool libncurses5-dev libsdl1.2-dev libstdc++6 libxml2 libxml2-utils lzop pngcrush schedtool xsltproc zlib1g-dev libncurses5-dev bzip2 git g++ libssl-dev openssl gcc-aarch64-linux-gnu gcc-arm-linux-gnueabihf lld gcc-arm-linux-gnueabi llvm )
for i in "${pkg[@]}"
do
		echo -e $Reset "" 
		echo -ne "${Reset}${i}... -> "
		sleep 0.3
		if ! hash "${i}" 2>/dev/null;then
		echo -e "${i} not Installed ${Red}[✗]"
		sudo apt install "${i}" -y
	else
		echo -e "${i} Installed ${Green}[✓]"
fi
done
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

echo -e " ${Red}*************************"
echo -e " ${Red}* ${Green}Snap Installations... ${Red}*"
echo -e " ${Red}*************************"
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

## Python Package installation for Plasma Profile backups/restores
echo -e " ${Red}*************************"
echo -e " ${Red}* ${Green}Installing Konsave... ${Red}*"
echo -e " ${Red}*************************"
sleep 2
git clone https://github.com/Prayag2/konsave prosave
cd prosave
python3 setup.py build
sudo python3 setup.py install
cd ..
bash ./restore.sh

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

echo -e " ${Red}*****************************"
echo -e " ${Red}* ${Green}Lutris Installation... ${Red}*"
echo -e " ${Red}*****************************"
sleep 2
echo -e ${Reset}

if ! hash lutris 2>/dev/null;then
	echo -e $Red "Lutris not Installed [✗]"
	echo -e ${Reset}
	sudo apt install lutris -y
else
	echo -e $Green "Lutris installed [✓]"
   	echo -e ${Reset}
   	sleep 2
fi
clear
sleep 2

## Check current Projects folder & Cloning current Git Projects

echo -e "************************************"
echo -e "${Green}Cloning current Git Projects ${Red}*"
echo -e "************************************"
echo -e ${Reset}
sleep 2
cd ${HOME}Dokumente

if ! [ -d "${HOME}/Dokumente/Github" ] 2>/dev/null;then
	echo -e $Red "Directory not availble [✗]"
   	sleep 1
   	cd ${home}/Dokumente
   	mkdir Github
   	echo -e $Red "Directory created"
else
	echo -e $Green "Directory already existing [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

cd "${HOME}"/Dokumente/Github || return
clear

echo -e "Cloning Current Git Projects now..."
sleep 2
if ! [ -d "${HOME}/Dokumente/Github/thunderstrike-framework" ] 2>/dev/null;then
	cd ${HOME}/Dokumente/Github
   	git clone https://gitlab.com/cyberknight777/thunderstrike-framework.git -b dev
else
	echo -e $Green "Thunderstrike-Framework folder already existing [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

if [ -d "${HOME}/Dokumente/Github/TBomb" ] 2>/dev/null;then
   	cd ${HOME}Dokumente/Github
   	git clone https://github.com/TheSpeedX/TBomb.git -b dev
else
   	echo -e $Green "TBomb folder already existing [✓]"
   	echo -e ${Reset}
   	sleep 2
fi

echo -e "Fertig!"
espeak-ng -vde "Installation abgeschlossen. Verlauf prüfen!"
sleep 2

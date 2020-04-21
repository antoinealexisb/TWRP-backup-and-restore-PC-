#!/bin/bash
###########################################
#
# adb TWRP
#
# Author : Antoine-Alexis Bourdon
# Link : https://github.com/antoinealexisb/TWRP-backup-and-restore-PC-
# Version : 0.1.1
# Year : 2020-04
# documentation command TWRP : https://twrp.me/faq/openrecoveryscript.html
# Dependency : adb
#
###########################################

if [ "`which adb`" = "" ]
then
  echo "Install adb please !"
  exit 1
fi

function menu ()
{
  echo '           # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #'
  echo '           #                                                                       #'
  echo '           #                   _     _      _     _                                #'
  echo '           #                  (c).-.(c)    (c).-.(c)    (c).-.(c)                  #'
  echo '           #                   / ._. \      / ._. \      / ._. \                   #'
  echo '           #                 __\( Y )/__  __\( Y )/__  __\( Y )/__                 #'
  echo "           #                (_.-/'-'\\-._)(_.-/'-'\\-._)(_.-/'-'\\-._)                #"
  echo '           #                   || H ||      || I ||      || ! ||                   #'
  echo "           #                 _.' \`-' '._  _.' \`-' '._  _.' \`-' '._                 #"
  echo "           #                (.-./\`-'\.-.)(.-./\`-'\.-.)(.-./\`-'\.-.)                #"
  echo "           #                 \`-'     \`-'  \`-'     \`-'  \`-'     \`-'                 #"
  echo '           #                                                                       #'
  echo '           #                                                                       #'
  echo '           #                          Backup and Resore  v0.1.1                    #'
  echo '           #                           by antoinealexisb                           #'
  echo '           #                                                                       #'
  echo '           #                                                                       #'
  echo '           #                  https://github.com/antoinealexisb/                   #'
  echo '           #                                                                       #'
  echo '           # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # '

echo ""
echo "                                   1. Backup (all)"
echo "                                   2. Backup (System Only)"
echo "                                   3. Backup (Data Only)"
echo "                                   4. Backup (Boot Only)"
echo "                                   5. Restore"
echo "                                   6. Boot Into Recovery"
echo "                                   7. Reboot System"
echo "                                   8. Shutdwon"
echo "                                   9. exit"
echo ""



read -p "                Enter your choice : " num;

}

function menuOptions ()
{
	case $num in

	1) 	echo "Backup (all)"
		adb shell twrp backup SDCBO
		;;

	2) echo "Backup (System Only)"
		adb shell twrp backup SO
		;;

    3) echo "Backup (Data Only)"
			adb shell twrp backup DO
			;;

    4) echo "Backup (Boot Only)"
			adb shell twrp backup BO
			;;

	5) read -p "directory of the backup files (example : /sdcard/TWRP/RAINBOW4G/20042020/): " name;

		echo ""

		adb shell twrp restore "${name}"
		;;

	6) echo " Booting into recovery..."

		echo ""

		adb shell reboot recovery
		exit 0
		;;

	7) echo " Rebooting your device..."

		echo ""

		adb shell reboot
		exit 0
		;;

    8) echo " Poweroff your device..."

			echo ""

			adb shell reboot -p
			exit 0
			;;

    9) echo " Bye Bye !"
      exit 0
      ;;
	esac
	clear
}

function pause(){
   read -p "$*"
}

while [ 1 = 1 ];
do
  menu
  menuOptions $num
done

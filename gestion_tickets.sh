#! /bin/bash

whiptail --title "Bienvenue $USER !" --msgbox "    PROGRAMME DE GESTION DES TICKETS" 0 0 10

consulter_menu()
{
	whiptail --title "Gestion" --nocancel --menu "      MENU " 0 10 5 "1)" "STOCKAGE" "2)" "TABLEAUX" "3)" "QUITTER" 3>&1 1>&2 2>&3 | cut -d')' -f1 > tag_menu.txt
}

continuer_script=true

while $continuer_script
do
	consulter_menu
	case $(cat tag_menu.txt) in
	
	1 )
		whiptail --title "STOCKAGE" --msgbox "Espace utilisé sur votre machine : \n$(df -h | awk '/sda1/ {print $5}') par $(basename -a $(df -h | awk '/sda1/ {print $1}'))\n$(df -h | awk '/sda2/ {print $5}') par $(basename -a $(df -h | awk '/sda2/ {print $1}'))\n" 0 0 0
		;;
	2 ) 
		whiptail --title "TITRE" --msgbox "CHOIX 2" 0 0 0
		whiptail --title " TICKETS " --inputbox "Quelle tickets ? : " 0 0  3>&1 1>&2 2>&3 
		;;
	3 )
		whiptail --title "QUITTER" --msgbox "VOUS AVEZ QUITTÉ LE SCRIPT." 0 0 0
		continuer_script=false
		;;
	* )
		whiptail --title "EN COURS / ERREUR" --msgbox "Vous éssayez d'accéder à une fonctionnalité qui n'est peut-être pas encore implémentée..." 0 0 0
		;;
	esac
done




#!/bin/bash

# PS3='Digite a ação de Docker que deseja realizar:'

read -p "Digite a ação de Docker que deseja realizar : " selected_opt

options=(
	"Listar Containers"
	"Listar Containers inativos"
	"Rodar Containers"
	"Quit"
)

select opt in "${options[$selected_opt]}"
do
    case $opt in
        "Option 1")
            echo "you chose choice 1"
	    echo `git status`
	    git status
            ;;
        "Option 2")
            echo "you chose choice 2"
            ;;
        "Option 3")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

https://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script
https://askubuntu.com/questions/38661/how-do-i-run-sh-scripts
https://stackoverflow.com/questions/5762233/how-can-i-run-git-commands-via-shell-script
https://bash.cyberciti.biz/guide/Getting_User_Input_Via_Keyboard
https://www.youtube.com/watch?v=OZJZMbxSiuQ&list=PLf-O3X2-mxDkiUH0r_BadgtELJ_qyrFJ_&index=9

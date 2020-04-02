#!/bin/sh
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Listar Containers ${normal}\n"
    printf "${menu}**${number} 2)${menu} Listar Containers inativos ${normal}\n"
    printf "${menu}**${number} 3)${menu} Rodar Containers ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Escolha sua opção de comando ou ${fgred}pressione 'x' para sair${normal}: "
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    bgred=`echo "\033[41m"`
    message=${@:-"${normal}Error: No message passed"}
    printf "${bgred}Comando realizado: \n${normal}"
    printf "${msgcolor}${message}${normal}"
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      clear

      case $opt in
        1) 
          sudo docker ps
          option_picked "sudo docker ps";
        ;;

        2)
          sudo docker ps -a 
          option_picked "sudo docker ps -a";
        ;;

        3) 
          printf "Nome do container:";
          read container_name;
          printf "\n LISTA DE IMAGENS: \n";
          printf "*********************************************\n"
          sudo docker images
          printf "\n Nome da imagem:";
          read iso_name;
          sudo docker run --name $container_name $iso_name
          option_picked "sudo docker run --name $container_name $iso_name";
        ;;

        x)exit;
        ;;

        \n)exit;
        ;;

        *)
          option_picked "Escolha uma opções do menu";
        ;;
      esac

      show_menu
    fi
done
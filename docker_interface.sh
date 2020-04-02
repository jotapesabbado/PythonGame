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
    printf "${menu}**${number} 4)${menu} Iniciar Containers ${normal}\n"
    printf "${menu}**${number} 5)${menu} Parar Containers ${normal}\n"
    printf "${menu}**${number} 6)${menu} Pusar Containers ${normal}\n"
    printf "${menu}**${number} 7)${menu} DesPausar Containers ${normal}\n"
    printf "${menu}**${number} 8)${menu} Remover Containers ${normal}\n"
    printf "${menu}**${number} 9)${menu} Status do Container ${normal}\n"
    printf "${menu}**${number} 10)${menu} Processos do Container ${normal}\n"
    printf "${menu}**${number} 11)${menu} Logs do Container ${normal}\n"
    printf "${menu}**${number} 12)${menu} Informações do Container ${normal}\n"
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

docker_images(){
  printf "\n LISTA DE IMAGENS: \n";
  printf "*********************************************\n"
  sudo docker images
}

docker_containers(){
  printf "\n LISTA DE CONTAINERS: \n";
  printf "*********************************************\n"
  sudo docker ps -a
}

read_container_name(){
  docker_containers;
  printf "Nome do container:";
  read container_name;
  clear;
  echo $container_name
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
          docker_images;
          printf "\n Nome da imagem:";
          read iso_name;
          sudo docker run -ti --name $container_name $iso_name
          option_picked "sudo docker run -ti --name $container_name $iso_name";
        ;;

        4)
          read_container_name;
          sudo docker start $(sudo docker ps -a -f "name=$container_name" -q)
          option_picked "sudo docker start 'container_id'";
        ;;

        5)
          container_name=read_container_name;
          sudo docker stop $(sudo docker ps -a -f "name=$container_name" -q)
          option_picked "sudo docker stop 'container_id'";
        ;;
        
        6)
          container_name=read_container_name;
          sudo docker pause $(sudo docker ps -a -f "name=$container_name" -q)
          option_picked "sudo docker pause 'container_id'";
        ;;

        7)
          container_name=read_container_name;
          sudo docker unpause $(sudo docker ps -a -f "name=$container_name" -q)
          option_picked "sudo docker unpause 'container_id'";
        ;;

        8)
          container_name=read_container_name;
          sudo docker rm -f $(sudo docker ps -a -f "name=$container_name" -q)
          option_picked "sudo docker rm -f 'container_id'";
        ;;

        9)
          container_name=read_container_name;
          sudo docker stats $(sudo docker ps -a -f "name=$container_name" -q)
          option_picked "sudo docker stats 'container_id'";
        ;;

        10)
          container_name=read_container_name;
          sudo docker top $(sudo docker ps -a -f "name=$container_name" -q)
          option_picked "sudo docker top 'container_id'";
        ;;

        11)
          container_name=read_container_name;
          sudo docker logs $(sudo docker ps -a -f "name=$container_name" -q)
          option_picked "sudo docker logs 'container_id'";
        ;;

        12)
          container_name=read_container_name;
          sudo docker start $(sudo docker ps -a -f "name=$container_name" -q)
          option_picked "sudo docker inspect 'container_id'";
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
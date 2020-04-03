#!/bin/sh
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}\nCOMANDOS PARA TODOS OS CONTAINERS:${normal}\n\n"
    printf "${menu}**${number} 1)${menu} Listar Containers ${normal}\n"
    printf "${menu}**${number} 2)${menu} Listar Containers inativos ${normal}\n"
    printf "${menu}**${number} 3)${menu} Listar Imagens ${normal}\n"
    printf "${menu}**${number} 4)${menu} Remover todos os Containers inativos ${normal}\n"
    printf "${menu}\nCOMANDOS PARA CONTAINERS EXPECIFICOS:${normal}\n\n"
    printf "${menu}**${number} 5)${menu} Rodar Containers ${normal}\n"
    printf "${menu}**${number} 6)${menu} Entrar em um Container ativo ${normal}\n"
    printf "${menu}**${number} 7)${menu} Iniciar Containers ${normal}\n"
    printf "${menu}**${number} 8)${menu} Parar Containers ${normal}\n"
    printf "${menu}**${number} 9)${menu} Pusar Containers ${normal}\n"
    printf "${menu}**${number} 10)${menu} DesPausar Containers ${normal}\n"
    printf "${menu}**${number} 11)${menu} Remover Containers ${normal}\n"
    printf "${menu}**${number} 12)${menu} Status do Container ${normal}\n"
    printf "${menu}**${number} 13)${menu} Processos do Container ${normal}\n"
    printf "${menu}**${number} 14)${menu} Logs do Container ${normal}\n"
    printf "${menu}**${number} 15)${menu} Inspecionar do Container ${normal}\n"
    printf "\n${menu}*********************************************${normal}\n"
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
          sudo docker ps;
          option_picked "sudo docker ps";
        ;;

        2)
          sudo docker ps -a; 
          option_picked "sudo docker ps -a";
        ;;

        3)
          sudo docker images; 
          option_picked "sudo docker images";
        ;;

        4)
          sudo docker rm -f $(sudo docker ps -a -q);
          option_picked "sudo docker rm $(sudo docker ps -a -q)";
        ;;

        5) 
          printf "Nome do container:";
          read container_name;
          docker_images;
          printf "\n Nome da imagem:";
          read iso_name;
          sudo docker run -ti --name $container_name $iso_name;
          option_picked "sudo docker run -ti --name $container_name $iso_name";
        ;;

        6)
          read_container_name;
          sudo docker attach $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker attach $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        7)
          read_container_name;
          sudo docker start $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker start $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        8)
          read_container_name;
          sudo docker stop $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker stop $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;
        
        9)
          read_container_name;
          sudo docker pause $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker pause $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        10)
          read_container_name;
          sudo docker unpause $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker unpause $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        11)
          read_container_name;
          sudo docker rm -f $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker rm -f $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        12)
          read_container_name;
          sudo docker stats $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker stats $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        13)
          read_container_name;
          sudo docker top $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker top $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        14)
          read_container_name;
          sudo docker logs $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker logs $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        15)
          read_container_name;
          sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q)";
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
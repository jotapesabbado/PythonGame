#!/bin/sh

## GLOBAL

###########################################
# Variaveis de estilização
###########################################
normal=`echo "\033[m"`
menu=`echo "\033[36m"` #Blue
number=`echo "\033[33m"` #yellow
bgred=`echo "\033[41m"`
fgred=`echo "\033[31m"`

###########################################
# Array's de Comandos
###########################################
declare -a comandos_para_todos_container=(
  "Listar Containers"
  "Listar Containers inativos"
  "Listar Imagens"
  "Remover todos os Containers inativos"
  "Buildar Imagem"
  "Remover Imagem"
);

declare -a comandos_para_container_expecificos=(
  "Rodar Containers"
  "Entrar em um Container ativo"
  "Iniciar Containers"
  "Parar Containers"
  "Pusar Containers"
  "DesPausar Containers"
  "Remover Containers"
  "Status do Container"
  "Processos do Container"
  "Logs do Container"
);

declare -a update_para_container_expecificos=(
  "Alterar memoria do Container"
  "Alterar CPU do Container"
);

declare -a inspecionar_container_expecificos=(
  "Inspecionar Container"
  "Consumo de memoria do Container"
  "Consumo de CPU do Container"
  "Volume montado corretamente"
);

###########################################
# Array's de Topicos
###########################################

declare -A topic0=(
  [title]='COMANDOS PARA TODOS OS CONTAINERS'
  [commands]='comandos_para_todos_container'
)

declare -A topic1=(
  [title]='COMANDOS PARA CONTAINERS EXPECIFICOS'
  [commands]='comandos_para_container_expecificos'
)

declare -A topic2=(
  [title]='UPDATE CONTAINERS EXPECIFICOS'
  [commands]='update_para_container_expecificos'
)

declare -A topic3=(
  [title]='INSPECIONAR CONTAINERS EXPECIFICOS'
  [commands]='inspecionar_container_expecificos'
)

###########################################
# Array's Switch Case
###########################################

declare -a switch_case_array=(
  "listar_containers"
  "listar_containers_inativos"
  "listar_imagens"
  "remover_todos_containers_inativos"
  "buildar_imagem"
  "remover_imagem"
  "rodar_containers"
  "entrar_em_container_ativo"
  "iniciar_containers"
  "parar_containers"
  "pusar_containers"
  "despausar_containers"
  "remover_containers"
  "status_container"
  "processos_container"
  "logs_container"
  "alterar_memoria_container"
  "alterar_cpu_container"
  "inspecionar_container"
  "consumo_memoria_container"
  "consumo_cpu_container"
  "volume_montado_corretamente"
);

###########################################
# Methods Switch Case
###########################################

listar_containers(){
  sudo docker ps;
  option_picked "sudo docker ps";
}

listar_containers_inativos(){
  sudo docker ps -a; 
  option_picked "sudo docker ps -a";
}

listar_imagens(){
  sudo docker images; 
  option_picked "sudo docker images";
}

remover_todos_containers_inativos(){
  sudo docker rm -f $(sudo docker ps -a -q);
  option_picked "sudo docker rm $(sudo docker ps -a -q)";
}

buildar_imagem(){
  read_image_build_info;
  sudo docker build -t $image_build_name:$image_build_version $image_build_dockerfile_dir
  option_picked "sudo docker build -t $image_build_name:$image_build_version $image_build_dockerfile_dir";
}

buildar_imagem(){
  read_image_name;
  sudo docker rmi $(sudo docker images $image_name)
  option_picked "sudo docker rmi $(sudo docker images $image_name)";
}

rodar_containers(){
  printf "Nome do container:";
  read container_name;
  
  docker_images;
  printf "\nNome da imagem:";
  read iso_name;

  printf "Consumo de memoria(usa a silga m, gb, etc):";
  read container_memory;
  if [ ! -z "$container_memory" -a "$container_memory" != " " ]; then
    command_memory="--memory $container_memory";
  else
    command_memory="";
  fi

  printf "Consumo de CPU:";
  read container_cpu;
  if [ ! -z "$container_cpu" -a "$container_cpu" != " " ]; then
    command_cpu="--cpu-shares $container_cpu";
  else
    command_cpu="";
  fi

  read_volume;

  #sudo docker run -ti --name $container_name --memory $container_memory --cpu-shares $container_cpu $iso_name;
  command_line="sudo docker run -ti --name $container_name $command_volume $command_memory $command_cpu $iso_name";
  eval $command_line;
  option_picked $command_line;
}

entrar_em_container_ativo(){
  read_container_name;
  sudo docker attach $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker attach $(sudo docker ps -a -f "name=$container_name" -q)";
}

iniciar_containers(){
  read_container_name;
  sudo docker start $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker start $(sudo docker ps -a -f "name=$container_name" -q)";
}

parar_containers(){
  read_container_name;
  sudo docker stop $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker stop $(sudo docker ps -a -f "name=$container_name" -q)";
}

pusar_containers(){
  read_container_name;
  sudo docker pause $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker pause $(sudo docker ps -a -f "name=$container_name" -q)";
}

despausar_containers(){
  read_container_name;
  sudo docker unpause $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker unpause $(sudo docker ps -a -f "name=$container_name" -q)";
}

remover_containers(){
  read_container_name;
  sudo docker rm -f $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker rm -f $(sudo docker ps -a -f "name=$container_name" -q)";
}

status_container(){
  read_container_name;
  sudo docker stats $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker stats $(sudo docker ps -a -f "name=$container_name" -q)";
}

processos_container(){
  read_container_name;
  sudo docker top $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker top $(sudo docker ps -a -f "name=$container_name" -q)";
}

logs_container(){
  read_container_name;
  sudo docker logs $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker logs $(sudo docker ps -a -f "name=$container_name" -q)";
}

alterar_memoria_container(){
  read_container_name;
  read_container_memory;
  sudo docker update -m $container_memory $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker update -m $container_memory $(sudo docker ps -a -f "name=$container_name" -q)";
}

alterar_cpu_container(){
  read_container_name;
  read_container_cpu;
  sudo docker update --cpu-shares $container_cpu $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker update --cpu-shares $container_cpu $(sudo docker ps -a -f "name=$container_name" -q)";
}

inspecionar_container(){
  read_container_name;
  sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q)";
}

consumo_memoria_container(){
  read_container_name;
  sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q) | grep -i memory;
  option_picked "sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q) | grep -i memory";
}

consumo_cpu_container(){
  read_container_name;
  sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q) | grep -i cpu;
  option_picked "sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q) | grep -i cpu";
}

volume_montado_corretamente(){
  read_container_name;
  sudo docker inspect -f {{.Mounts}} $(sudo docker ps -a -f "name=$container_name" -q);
  option_picked "sudo docker inspect -f {{.Mounts}} $(sudo docker ps -a -f "name=$container_name" -q)                              ";
}


## METHODS

show_menu(){
  ###########################################
  # Montagem do menu
  ###########################################

  declare -n topic

  printf "\n${menu}*********************************************${normal}\n"
  cont=1
  for topic in ${!topic@}; 
  do
    printf "${menu}\n${topic[title]}:${normal}\n\n"
    eval 'array_of_commands=("${'${topic[commands]}'[@]}");';
    
    for command in "${array_of_commands[@]}"
    do
      printf "${menu}**${number} $cont)${menu} $command ${normal}\n"
      ((cont+=1))
    done
  done
  printf "\n${menu}*********************************************${normal}\n"
  printf "Escolha sua opção de comando ou ${fgred}pressione 'x' para sair${normal}: "
  read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    bgred=`echo "\033[41m"`
    message=${@:-"${normal}Error: Opção escolhida não confere!!"}
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
  echo $container_name;
}

read_container_memory(){
  printf "\n CONSUMO ATUAL DE MEMÓRIA: \n";
  sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q) | grep -i memory;
  printf "\n Consumo de memoria(usa a silga m, gb, etc):";
  read container_memory;
  clear;
  echo $container_memory;
}

read_container_cpu(){
  printf "\n CONSUMO ATUAL DE CPU: \n";
  sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q) | grep -i cpu;
  printf "\n Consumo de CPU:";
  read container_cpu;
  clear;
  echo $container_cpu;
}

read_volume(){
  printf "\nDefinir volume(y/n):";
  read has_volume;
  if [ ! -z "$has_volume" -a "$has_volume" != " " -a "$has_volume" != "n" ]; then
    printf "\nDiretorio Host:";
    read host_dir;
    printf "\nDiretorio Container:";
    read container_dir;
    command_volume="-v $host_dir:$container_dir"
  else
    command_volume="";
  fi
}

read_image_build_info(){
  printf "Nome da image:";
  read image_build_name;
  
  printf "Versão do build:";
  read image_build_version;

  printf "Diretorio do Dockerfile:";
  read image_build_dockerfile_dir;
}

read_image_name(){
  docker_images;
  printf "Nome da image:";
  read image_build_name;
}

###########################################
# RUN
###########################################

clear
show_menu
while [[ ! -z "$opt" ]]
do
  clear;

  if [ $opt = 'x' ]; then
    exit;
  else

    exist_opt=0;
    for key in "${!switch_case_array[@]}"; 
    do
      if (( opt == (key + 1) )); then
        exist_opt=1;
        ${switch_case_array[key]}
      fi
    done

    if [ $exist_opt = 0 ]; then
      option_picked;  
    fi

    show_menu
  fi
done
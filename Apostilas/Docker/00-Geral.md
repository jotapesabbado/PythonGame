# Apostila Docker
### Esta apostila possui o intuito de ser o guia para dúvidas em relação a sintax, setup e soluções encontradas em Docker.

#

## Comandos:
### Listar Containers:
```
sudo docker ps
```

### Listar Containers inativos:
```
sudo docker ps -a
```

### Rodar Containers:
*Caso a imagem não seja encontrada na maquina ela será buscada no DockerHub e baixada*
```
sudo docker run "nome da imagem"
```
* Parametros de rede para o docker run
```shell
#Definir um dns para o container responder
sudo docker run --dns 8.8.8.8

#Define o hostname do container
sudo docker run --hostname nomelegal

#Criar vinculo entre container para conseguir pinga o link no linkado
# Se dentro do container linkado eu rodar ping container_link irá funcionar

sudo docker run --link container_link --name container_linkado

# Expor apenas a porta do container
sudo docker run --expose 80

# Bind da porta do container com a porta do host, esse redirecionamento será feito pelo iptables, se eu quiser verificar esse redirect posso rodar iptables -t nat -L -n. Fazerndo um DNAT. Não é necessário alterar na mão as regras do iptables, o dokcer já faz isso muito bem
sudo docker run --publish ou -p porta_host:porta_container

# Personalizar o mac address
sudo docker run --mac-address 12:34:de:b0:6b:61

# Fazer com que todas as config do network sejam a do host e não a do container 
sudo docker run --net=host
```

### Rodar Containers nomeado:
```
sudo docker run --name "nome" "nome da imagem"
```

### Rodar Containers tendo interface:
*O comando "-ti" serve para criar uma interface bash para que você possa estar dentro do container em funcionamento, como é gerada a interface dentro do bash, no momento que você matar o bash (CTRL + D), mata o containner, para sair do bash do container sem matalo use <b>CTRL + P + Q</b>*
```
sudo docker run -ti "nome da imagem" 
```

### Iniciar Containers:
```
sudo docker start ID
```

### Parar Containers:
```
sudo docker stop ID
```

### Pusar Containers:
```
sudo docker pause ID
```

### DesPausar Containers:
```
sudo docker unpause ID
```
### Remover Containers:
*Caso o container que deseja remover esteja em rodando, então o comando precisa ser forçado*
```
sudo docker rm ID

// Forçado
sudo docker rm -f ID
```

### Listar as Imagens:
```
sudo docker images
```

### Status do Container:
```
sudo docker stats ID
```

### Processos do Container:
```
sudo docker top ID
```

### Logs do Container:
```
sudo docker logs ID
```

### IDs dos Container parados:
```
sudo docker ps -a -q
```

### IDs dos Container buscando pelo nome:
```
sudo docker ps -f "name=nome_do_container" -q
```

### Remover todos os Container parados:
```
sudo docker rm $(sudo docker ps -a -q)
```

### Informações do Container:
```
sudo docker inspect ID
```

### Verificar consumo de memoria do container:
```
sudo docker inspect ID | grep -i memory
```

### Criar container definindo consumo de memoria:
```
sudo docker run --memory "memoria" 
```

### Alterar consumo de memoria em container existente:
```
sudo docker update -m "memoria" "container_id" 
```

### Verificar consumo de cpu do container:
```
sudo docker inspect ID | grep -i cpu
```

### Criar container definindo consumo de cpu:
```
sudo docker run --cpu-shares "consumo_cpu" 
```

### Alterar consumo de cpu em container existente:
```
sudo docker update --cpu-shares "consumo_cpu" "container_id" 
```

## Volumes:

### Inspecionar para valizar a montagem do volume:
```
sudo docker inspect -f {{.Mounts}} nome_container
```

### Container dataonly (criar container que utiliza um container dataonly como volume):
```
// Container dataonly
sudo docker create -v diretorio/host:diretorio/container --name container_dataonly

// Dessa forma o container sera criado utilizando o volume do container dataonly como centralizador dos dados
sudo docker run --volume-from container_dataonly 
```

## Dockerfile

### FROM:
Para determinar qual será a imagem base para o dockerfile

### MANTAINER:
Define que escreve o Dockerfile

### ADD:
Trazer arquivos do host para o container, podendo trazer um .tar

### CMD:

### LABEL:
Adicionar metadatas

### COPY:
Copia um elemento do host para o container

### ENTRYPOINT:
Para definir um processo como principal ´processo do seu container e casso esse processo morra o container tambem será finalizado

### ENV:
Para determinar variaveis de ambiente 
```
ENV teste="teste"
```

### EXPOSE:
Expoem uma porta do container

### RUN:
Serve para executar comandos no seu dockerfile
*OBS: Tentar rodar comando RUN apenas uma vez, concatenando os códigos. Pois rodar varios comandos RUN gera subcamadas de processamento que não interagem entre elas.

### USER:
Usuario default daquela imagem

### WORKDIR:
Definir o diretorio raiz do container

### VOLUME
Define o diretorio do volume

#

## Soluções
### *Comandos docker não funcionam*
* O CML "docker" precisa de nivel de permissinamento sudo para rodar, então todo comando docker deve possuir ``sudo docker COMAND``.

### *Virtual Box Linux não mostra todo o script*
* O virtual box tem umas tretas na hora de redimencionar uma maquina virtual, ai se tu tens uma interface que ocupa um espaço maior ela fica escondida. Esse link resolve tudo (https://www.youtube.com/watch?v=N6M1GUFw7R4)

### *CRIAR REGISTRY LOCAL*
* Registry local substitui a necessidade de baixar as imagens do docker hub e de fazer acesso a internet, pois esse é um repositório de registros de imagens local. Seguir o passo a passo utilizando o arquivo de configuração YML deste link: https://hub.docker.com/r/hyper/docker-registry-web/. Para fazer os testes basta subir os container de registry e de serviço web e por fim testar no browser o caminho http://maquina_host_ip:8080/


```shell
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
          sudo docker rm -f $(sudo docker ps -a -q);
          option_picked "sudo docker rm $(sudo docker ps -a -q)";
        ;;

        6) 
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
        ;;

        7)
          read_container_name;
          sudo docker attach $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker attach $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        8)
          read_container_name;
          sudo docker start $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker start $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        9)
          read_container_name;
          sudo docker stop $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker stop $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;
        
        10)
          read_container_name;
          sudo docker pause $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker pause $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        11)
          read_container_name;
          sudo docker unpause $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker unpause $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        12)
          read_container_name;
          sudo docker rm -f $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker rm -f $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        13)
          read_container_name;
          sudo docker stats $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker stats $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        14)
          read_container_name;
          sudo docker top $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker top $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        15)
          read_container_name;
          sudo docker logs $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker logs $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        16)
          read_container_name;
          read_container_memory;
          sudo docker update -m $container_memory $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker update -m $container_memory $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        17)
          read_container_name;
          read_container_cpu;
          sudo docker update --cpu-shares $container_cpu $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker update --cpu-shares $container_cpu $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        18)
          read_container_name;
          sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q)";
        ;;

        19)
          read_container_name;
          sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q) | grep -i memory;
          option_picked "sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q) | grep -i memory";
        ;;

        20)
          read_container_name;
          sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q) | grep -i cpu;
          option_picked "sudo docker inspect $(sudo docker ps -a -f "name=$container_name" -q) | grep -i cpu";
        ;;

        21)
          read_container_name;
          sudo docker inspect -f {{.Mounts}} $(sudo docker ps -a -f "name=$container_name" -q);
          option_picked "sudo docker inspect -f {{.Mounts}} $(sudo docker ps -a -f "name=$container_name" -q)                              ";
        ;;

        x)exit;
        ;;

        \n)exit;
        ;;

        *)
          option_picked "Escolha uma opções do menu";
        ;;
      esac
```

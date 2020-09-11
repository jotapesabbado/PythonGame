# Apostila Docker
### Esta apostila possui o intuito de ser o guia para dúvidas em relação a sintax, setup e soluções encontradas em Docker.

#
## Instalação

```shell
# Docker
sudo apt-get update -y
curl -fsSl http://get.docker.com/ | sh

# Docker Compose
# https://docs.docker.com/compose/install/
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# Tive que trocar os acessos as variaveis de ambiente pelos seus respectivos valores, no caso Linux($(echo uname -s)) e x86_64. Por algum motivo não formatou a string corretamente 

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Docker Machine
# https://github.com/docker/machine/releases
# Observar a versão para instalar a mais atualizada

curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine


# Git
sudo apt install -y git-all

```

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

## **Docker Machine (IMPORTANTE)**
Docker machine é basicamente uma maquina host para manter os seus containers, a grande questão é que dessa forma voce pode na mesma maquina ter varios host's de dockermachine com varios containers. Neste video da pra ver a isntalação e de onde eu tirei essa definição do docker machine https://www.youtube.com/watch?v=DERATbSlB0s&list=PLf-O3X2-mxDkiUH0r_BadgtELJ_qyrFJ_&index=17

## **Docker Compose (IMPORTANTE)**
É uma forma de containerizar o hambiente da aplicação. Quase como um agrupador de dockerfiles. Ele agrupa todos os containers que fazem parte da sua aplicação.

### build:

```yml
# Indica o caminho do seu Dockerfile
build: .
```

### command:

```yml
# Comando a ser executado
command: bundle exec thin -p 3000
```

### container_name:
```yml
# Indica um nome para o container
container_name: my-web-container 
```

### dns:
```yml
# Indica o dns do servidos
dns: 8.8.8.8
```

### dns_search:
```yml
# Expecifica um search domain
dns_search: example.com
```

### dockerfile:

```yml
# Expecifica um arquivo de Dockerfile com nome alternativo
dockerfile: Dokerfile-alternativo
```

### env_file:
```yml
# Expecifica um arquivo com variaveis de ambiente
env_file: .env
```

### environment:
```yml
# Adiciona variaveis de ambiente
environment: 
  RACK_ENV: development
```

### expose:
```yml
# Expoe uma porta do container
expose:
  - "3000"
  - "8000"
```

### external_links:
```yml
# "Linka" conteiners que não estão especificados no docker-compose atual
external_links: 
  - redis_1
  - project_db_1:mysql
```

### extra_hosts:
```yml
# Adiciona ema entrada no /etc/host do container
extra_hosts:
  - "somehost:162.242.195.82"
  - "otherhost:50.31.209.229"
```

### image:
```yml
# Indica uma imagem
image: ubuntu
```

### labels:
```yml
# Adiciona metadados ao container 
labels:
  - com.exemple.description: "Accounting webapp"
  - com.exemple.department: "Finance"
```

### links:
```yml
# Linka conteiners dentro do mesmo docker-compose
links:
  - db
  - db:database
```

### log_drive:
```yml
# Indica o formato do log que sera gerado, por ex: syslog, json-file,etc
log_drive: syslog

# OU

logging: 
  drive: syslog

```

### log_opt:
```yml
# Indica onde mandar os logs, pode ser local ou em um syslog remoto
log_opt:
  syslog-address: "tcp://192.168.0.42:123"

# OU

logging:
  drive: syslog
  options:
    syslog-address: "tcp://192.168.0.42:123"
```

### net:
```yml
# Modo de uso da rede
net: "bridge"
net: "host"
```

### ports:
```yml
# Expoe as portas do conteiner e do host
ports:
  - "3000"
  - "8000:8000"
```

### volumes:
```yml
# Monta volumes no container
volumes:
  - /var/lib/mysql

  - /opt/data:/var/lib/mysql

  - .cache:/tmp/cache
```

### volumes_from:
```yml
# Monta volumes atraves de outros containers
volumes_from:
  - service_name
  - service_name:ro
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

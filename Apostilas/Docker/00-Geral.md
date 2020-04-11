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




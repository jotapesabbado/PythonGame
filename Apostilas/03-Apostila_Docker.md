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

### Rodar Containers tendo interface:
*O comando "-ti" serve para criar uma interface bash para que você possa estar dentro do container em funcionamento, como é gerada a interface dentro do bash, no momento que você matar o bash (CTRL + D), mata o containner, para sair do bash do container sem matalo use <b>CTRL + P + Q</b>*
```
sudo docker run "nome da imagem" -ti
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
#

## Soluções
### *Comandos docker não funcionam*
* O CML "docker" precisa de nivel de permissinamento sudo para rodar, então todo comando docker deve possuir ``sudo docker COMAND``.




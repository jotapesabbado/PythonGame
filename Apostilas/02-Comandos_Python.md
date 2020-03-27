# Comandos Python
>Primeiramente, lembre-se de **IDENTAR**

>Comando para printar:
>>sendo "()" para colocar oq quer printar
```py
print()
```
>para fazer um comment, use o #
>>caso queira fazer um comment de mais de uma linha, use """
```py
#isto é um comment
"""
ba
ta
ta
"""
```
>Comando para descobrir o tipo da variável
```
type()
```
>Caso queira transformar uma varíavel em outro tipo de data, use o nome da data e a varíavel ex:
```py
int(my_float)
```
## String:
>Para fazer uma srt, use **"** nome **"** e caso queira fazer uma srt com mais linhas, use **"""**
>Caso queira ver apenas 1 letra da string, use os **["número da posição da letra na srt"]**:
>>caso queira ver oq existe entre a posição tal até a tal, use o **:**, para ir de trás pra frente, use o **-** OBS: dentro do **[]**
>>>Para ver quanto de espaço a string ocupa, use o comando **len()**

```py
print(my_srt[1])
print(my_srt[4:10])
print(len(my_srt)
``` 
>Comandos para a string
```py
my_srt.strip() #serve para tirar os espaços em branco
my_srt.lower() #serve para diminui a fonte da letra
my_srt.upper() #serve para aumentar a fonte da letra
my_srt.replace("A letra q será substituida", "a letra q substituirá") #serve para substituir uma letra por outra (caractere)
my_srt.split("a instancia") #separa a string em substring caso a instancia seja cumprida
```
>>Para checkar se algo está na string, use in ou not in 
```
x= "oque você procura" in my_str
print(x)
```
>Para inserir outro tipo de data numa string, use o comando format(), esse comando irá formatar oq você quer e colocar nos {}
>>Caso queira ordenar, use os 0,1,2
```py
quantity = 3
itemno = 567
price = 49.95
myorder = "I want {2} pieces of item {0} for {1} dollars."
print(myorder.format(quantity, itemno, price))
```
>Para usar um caracter ilegal em uma string, use **\** (conhecido como caracter de escape)seguido pelo o caracter q você deseja 

## Booleans

>Não são muitos valores q recebem False, mas os q recebem são: 
>>Valores vazios: (), [], {}, ""
>>O número 0, o valor None, e o valor False
>>Objetos q foram feitos com a função _len_ que retorna 0 ou False


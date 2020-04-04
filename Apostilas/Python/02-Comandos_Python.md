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
>Para usar um caracter ilegal em uma string, use **\\** (conhecido como caracter de escape)seguido pelo o caracter q você deseja 

## Booleans

>Não são muitos valores q recebem False, mas os q recebem são: 
>>Valores vazios: (), [], {}, ""
>>O número 0, o valor None, e o valor False
>>Objetos q foram feitos com a função _len_ que retorna 0 ou False

## Operators
>**	Exponentiation
>//	Floor division	
>%	Modulus
>/	Division
>* Multiplicacion 

## Assignment Operators (Assing values to variables):
>=
>+= igual à  x = x + 3
>-= igual à  x = x - 3
>**"tipo de operação"=** igual à: **x = x "operação" 3**

## Operadores de comparação:
>==     Equivalente
>!=     Não equivalente
><>     Maior que, Menor que
> <=>=  Maior que ou igual, Menor que ou igual

## Python Logical Operators: 
>and 	Returns True if both statements are true	              x < 5 and  x < 10
>or	    Returns True if one of the statements is true	          x < 5 or x < 4
>not	Reverse the result, returns False if the result is true	  not(x < 5 and x < 10)

## Python Identity Operators
>Compara objetos para ver se eles são iguais
>>is 	    Returns True if both variables are the same object
>>is not	Returns True if both variables are not the same object    
>>>x is y

## Python Membership Operators
>São usados para ver se o que você procura é apresentado na sequencia de um objeto
>>in 	Returns True if a sequence with the specified value is present in the object 
>>>x in y
>>not in  Returns True if a sequence with the specified value is not present in the object

## Python Bitwise Operators:
> São usados para comparar valores binários
Operator	Name	             Description
& 	         AND	             Sets each bit to 1 if both bits are 1
|	         OR	                 Sets each bit to 1 if one of two bits is 1
^	         XOR	             Sets each bit to 1 if only one of two bits is 1
<<	  Zero fill left shift     	 Shift left by pushing zeros in from the right and let the leftmost bits fall off
\>>	  Signed right shift	     Shift right by pushing copies of the leftmost bit in from the left, and let the rightmost bits fall off

# Data Types para listas
>List
>>é uma lista q é ordenada e modificavel. Permite membros duplicados
>>>use **[]**
>Tuple
>> é uma lista ordenada mas não modificavel. Permite membros duplicados
>>>use **()**
>Set
>>é uma lista sem ordem, e inindexavel. Sem membros dúplicados
>>>use **{}**
>Dictionary
>>é uma lista sem ordem, modificavel e indexavel. Sem membros dúplicados
{
  "alguma coisa": "oq vai ser essa uma coisa"
}
# A maioria das data types de collectione
## List:
>Para criar uma lista no python, use os "brackets []"
>Para printar apenas um item da lista, pode-se usar os [] tbm
```py
print(my_list[0]) #printou o primeiro objeto da sua my_list
```
>>Use sempre o **-**"número" para fazer de trás pra frente
>>Use os **:** dentro dos "brackets" [] para falar de tal posição até tal
>>>Ex:
```py
print(my_list[0:10])  #vai ir da posição 0 até 10
```
>Para mudar um item da lista, use:
```py
my_list[1] = "NegoNey" #mudou o 2° item da lista para NegoNey
```
>Para adicionar um item no final da lista, use o metodo **append()**
>>Ex:
```py
thislist = ["Nego", "Ney", "Ruim"]
thislist.append("ARROMBADO")
print(thislist)
```
>>Para adicionar um item em um lugar especifico, use o metodo insert()
>>>Ex:
```py
thislist = ["apple", "banana", "cherry"]
thislist.insert(1, "orange") #vai substituir o segundo item por orange
print(thislist)
```
## Remover
>Para remover um item de uma lista, há alguns comandos:
>>Método **remove()** para remover itens especificos
```py
thislist = ["apple", "banana", "cherry"]
thislist.remove("banana") #PARA USER UM MÉTODO USE O "variável"."método"
print(thislist)
```
>>Método **pop()** para remover um item em um lugar especifico da variavel (caso n seja especificado o lugar,  ele removerá o último item)
>>>Ex: 
```py
thislist = ["apple", "banana", "cherry"]
thislist.pop()
print(thislist)
```
>>A keyword **del** para remover um item em um lugar especifico da variavel
```py
thislist = ["apple", "banana", "cherry"]
del thislist[0] #No caso de keywords, você terá de usar no começo
print(thislist)
```
>>> caso você digite **del "sua lista"** ele deletará a lista por completo

>>O método **clear** esvazia a lista
 ## Copiar uma lista
 >Para copiar uma lista, você pode usar o método **copy()**
 >>Ex:
 ```py
 thislist = ["apple", "banana", "cherry"]
mylist = thislist.copy()
print(mylist)
```
>>Você pode usar também o **list()** method:
>>>Ex:
```py
thislist = ["apple", "banana", "cherry"]
mylist = list(thislist)
print(mylist)
```
## Concatenar uma lista
>use o +

## Tuples
>tuple é uma lista imodificavel, sendo mais difícil para o usuário mexer. 
>>Como mudar os valores de um tuple
>>Você deve transforma-lo em uma list, depois de volta para o tuple
```py
x = ("apple", "banana", "cherry")
y = list(x)
y[1] = "kiwi"
x = tuple(y)
print(x)
```
### Tuples methods:
>count()
>>retorna o número de vezes que um valor específico ocorre em uma tuple
>index()
>>Procura na tuple por um valor específico e depois retorna a posição onde foi encontrado.
## Set
>uma boa forma de conseguir fazer uma lista bem segura, é oo Set, mas com essa segurança tu acaba por limitar muito o funcionamento da sua lista.
>Para adicionar mais de um item no tuple
>>**update("1item", "2item")**
### Set methods 
>Returns a set contendo a diferença entre dois ou mais sets
>>diference()
>Remove os itens nesse set que também estão incluídos em outros set específicados
>>difference_update()
>Remove o item especificado
>>discord()
> Returns a set, que é  interseção de dois ou outros sets
>>intersection()
>Removes the items in this set que não estão presente em outros sets específicados
>>intersection_update()
>Compara dois sets e procura se tem interseção entre eles, caso tenha, será false
>>isdisjoint()
>Retorna um set com todos itens do outro set, mas sem aqueles que estão presente nos 2
>>symmetric_difference()
>>>Ex: 
>>>my_set3 = "my_set".**symmetric_difference("my_set2")**
>Remove os itens iguais dos sets e retorna com um set com todos itens que eram diferentes
>>symmetric_difference_updat()
>>>Ex
```py


x = {"apple", "banana", "cherry"}
y = {"google", "microsoft", "apple"}

x.symmetric_difference_update(y) 

print(x) #vai printar um set assim (sem o apple): 'google', 'banana', 'cherry', 'microsoft'
```
>Retorna um set contendo a união de sets
>>union()
>Atualiza os itens do set especificado adicionando os itens de outro set especificado
>>update()
>>>Ex: "set que vai atualizar".update("set atualizador")










## Dictionary
>com o dict você pode extrair informações direto dele apenas pedindo ao index (que é uma string).
```py
my_dick = {
    "ob1": "banana", #"ob1" é uma key, enquanto "banana" é um value
    "ob2": "maça",
    "ob3": "batata"
}
```
### Dictionary methods
>Cria um dictonary com as keys e valores específicados
>>fromkeys()
>>>Ex:
```py
x = ('key1', 'key2', 'key3') #keys que serão usadas
y = 0 #valor que será atribuido às keys

thisdict = dict.fromkeys(x, y) #criou a key

print(thisdict) #printara key1:0, key2:0, key3:0
```	
#### Retorna com o value da key específicada
>get("key")	
####	Retorna um tuple contendo cada par de key e value
>items()
#### Retorna uma lista contendo todas a keys do dict
>keys()
#### Remove o último key-value inserido
>popitem()
#### Retorna o valor de uma key específicada, caso a key não exista ele insere a key com o valor específicado
>setdefault("a key", "o valor caso não exista a key")
#### Dá update no dict com o key-value específicados
>update("key", "value")
#### Retorna com uma lista de todos valores do dict
>>values()


## if ... else
>Python suporta a lógica usual da matemática
>>Igual:      
>>>**==**
>>Não é igual
>>>**!=**
>>Menor que
>>> **<**
>>Menor que ou igual que
>>> **<=**
>>Maior que
>>> **>**
>>Maior que ou igual que
>>> **>=**
### if statement
>Ex:
>>
```py
a = 33
b = 200
if b > a:
  print("b é maior que a") #como b é realmente maior que a (true), ele vai printar oq está escrito
  ```
### elif statement
>a keyword **elif** teria o mesmo significado de: se a condição anterior não for verdade, então tente essa
>>Ex
```py
a = 33
b = 33
if b > a:
  print("b é maior que a")
elif a == b:
  print("a e b são iguais")
```
### else statement
>a keyword **else** pega tudo que não foi pego pelas condições anteriores
>caso o **if** der errado, ele rodará o else
>>
```py
a = 200
b = 33
if b > a:
  print("b é maior que a")
elif a == b:
  print("a e b são iguais")
else:
  print("a é maior que b")
  ```
### short hand if ... else
>caso você queira apenas escrever um statement curto, você pode fazer tudo em uma mesma linha
>>Ex:
```py
a = 2
b = 330
print("A") if a > b else print("B")
```
### and  
> é usado para combinar 2 statement
>>Ex
```py
a=30
b=30
c=60

if a = b and c > a:
 print("carai mermão ta certo :)")
```
### or
> também é usado para combinar 2 statement, mas se caso o primeiro esteja errado e o segundo certo, ele dará True mesmo assim


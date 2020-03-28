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
>==   Equivalente
>!=   Não equivalente
><>   Maior que, Menor que
> <=>=  Maior que ou igual, Menor que ou igual

## Python Logical Operators: 
>and 	Returns True if both statements are true	x < 5 and  x < 10
>or	Returns True if one of the statements is true	x < 5 or x < 4
>not	Reverse the result, returns False if the result is true	  not(x < 5 and x < 10)

## Python Identity Operators
>Compara objetos para ver se eles são iguais
>>is 	Returns True if both variables are the same object
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

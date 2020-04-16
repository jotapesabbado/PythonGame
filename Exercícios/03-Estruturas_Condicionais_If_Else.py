"""
Exercício 1, 2, 3, 4, 5
"""
# são estruturas que rodarão o que está dentro dela caso a condição da estrutura seja cumprida

x = 30
y = 30
z = 29
if x == y and y != z or y > z:
    print("comi o cu de quem ta lendo")
"""
#ela dá erro
if x == y:
print("comi o cu de quem ta lendo")
"""
#caso a condição anterior não for verdade, tente essa aqui

if x != y:
    print("x é diferente de y")
elif x == y:
    print("x é igual y")
elif x > y:
    print("x é maior que y")

"""
Exercício 6, 7, 8, 9, 10, 11
"""
#caso o if de errado, ele irá rodar o else

#ambos são estruturas de escape, mas o elif possui uma condição enquanto o else não possui

#é pra aumentar a qualidade do seu código, fazendo mais coisas em menos espaço

x = True
z = '' 
z = "sou um bosta:" + str(x) if x else "TOMA GARAI NÃO SOU UM BOSTA:" + str(x)
print(z)

x = True
z = '' 
z = "sou um bosta:{0}" if x else "TOMA GARAI NÃO SOU UM BOSTA:{0}"
print (z.format(x)) 

"""
Exercício 12 e 14
"""
#aumenta a qualidade do seu cod mas ao mesmo tempo ele fica limitado 
x3 = 10
if x3 > 10:
 pass
#use a palavra a keyword "pass" na estutura de condição


x4 = 3
if x4 > 2:
    "cu"
else:
    if x4 < 2:
        print("cuzin")

if x4 == 2:
    print("2")
elif x4 == 5:
    print("5")

#if e if não podem ser encadeados, já o if / elif podem ser encadeados (switch case)

#O python tem um switch case diferenciado, conhecido como if / elif




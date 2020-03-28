import math
""" 
Exercício 1
"""

a = 1
b = 3
c = -4
delta = math.sqrt((b ** 2) -4 * a * c)

print("x1", (-b -delta)/2*a) 
print("x2", (-b +delta)/2*a)


""" 
Exercício 2
"""
a = 5
a*= a 
a+= a 
print(a)

""" 
Exercício 3
"""
#Quis são operados que comparam uma variavel, tendo o resultado como True or False
y = 20
print(a == y)
 
""" 
Exercício 4
"""
#Na verdade, tem tudo na apostila, mas vou colocar os cod de exemplo
print(y == 20 and y > 5)
print(y > 5 or y < 5)
print(not(y>5))

#Tabela verdade, porra é essa mermão?

""" 
Exercício 5
"""
#São operadores que comparam elementos para ver se eles são iguais, tendo o resultado em True of False
print (y is a)
 
""" 
Exercício 6
"""
#São usados para ver se o que você procura é apresentado na sequencia de um objeto
nego_ney = ["Corona Vírus", "Rei do Inferno", "Mal supremo", "Criador da peste negra", "Matou o miranha", "Criou hentai de zoofilia"]
print("Bondade" in nego_ney)

""" 
Exercício 7
"""
#Pois o == analisa o conteúdo do elemento, procurando ver se é igual, enquanto is analisa o espaço de memóra(não quantidade, mas sim o local).
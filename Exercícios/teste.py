"""
faça um programa 
que preencha uma matriz 20x10 com numeros inteiros, 
e some cada uma das colunas, 
armazenando o resultado da soma em um vetor. 
A seguir o programa devera multiplicar 
cada elemento da matriz pela soma da coluna e mostrar a matriz resultante.
"""

matriz=[]
vetorSoma=[]
matrizFinal=[]

for index in range(20):
    matriz.append(range(index, index+10))
    
for item in matriz:
    soma = 0
    
    for value in item:
        soma += value

    vetorSoma.append(soma)

for index in range(len(matriz)):
    vetor_aux=[]
    for item in matriz[index]: 
        vetor_aux.append(vetorSoma[index] * item)

    matrizFinal.append(vetor_aux)


print(matrizFinal)






# for index in range(len(matriz)):
#     matrix[index]




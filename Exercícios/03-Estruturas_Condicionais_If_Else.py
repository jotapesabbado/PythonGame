
# range(5)
# [0,1,2,3,4,5]


# range(2,4)
# [2,3,4]

# range(2,6,2)
# [2,4,6]


# range(len(familia))
# lista=[0,1,2]
# lista=range(len(familia))



# lista=range(len(familia))
# # lista=[0, 1, 2]

# familia[lista[1]]
# familia[1]
# "tua mae"

# familia[lista[1]] += " é xeroza"
# range(len(familia))
# [0, 1, 2]

# familia[0] += "é xerozo(a)"
# familia[1] += "é xerozo(a)"
# familia[2] += "é xerozo(a)"


familia = ["teu pai",  "tua mãe", "teu tio", "teu cachorro", "teu cu"]
adjetivo = ["é maroto",  "é supimpa", "é tesudo", "é viril", "é sacana"]
familia_adjetivo=[]



#
# for index in range(0, len(familia), 2):
#     familia[index] += " é xeroza(o)"

# print("vetor:" + str(familia))

#
# for index in range(len(familia)):
#     familia_adjetivo.append(familia[index] + " " + adjetivo[index])

# print(range(len(adjetivo), -1)[1])


# adjetivos_ao_contrario=[]
# for index in range(len(adjetivo) -1, 0 -1, -1):
#     adjetivos_ao_contrario.append(adjetivo[index])

adjetivo.reverse()
for index in range(len(familia)):
    familia_adjetivo.append(familia[index] + " " + adjetivo[index])

print("vetor:" + str(familia_adjetivo))

 
# print("vetor:" + str(familia_adjetivo))



# for index in range(len(familia)):
#    familia[index] += ":)"


# x = 0

# # len(familia)

# while x < len(familia):
#     print(familia[x])
#     x+=1



# # for familiar in familia:
# #    print("meu familiar é: " + familiar)
# #    familiar += " :)"
# #    print("dentro familiar:" + familiar)
# #    (familiar == "teu pai") True
# #    (familia[0] == "teu pai") True

# #    familia[2]



# # print("---------------------------------------")

# # print("tamanho:" + str(len(familia)))
# # print("fora familiar:" + familiar)
# # print("familia[0]:" + familia[0])
# # print("familia[1]:" + familia[1])
# # print("familia[2]:" + familia[2])

# # print("---------------------------------------")

# # # print("fora temmer:" + familiar)


# # for familiar in familia:
# #     print("meu familiar alterado: " + familiar)
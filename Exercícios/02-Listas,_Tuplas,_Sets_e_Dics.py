"""
Exercício 1
"""
#list é um elemento sequencial q é ordenvel e modificavel, permite membros dúplicados
#a list é uma boa forma de tu conseguir acessar todos os dados e modificalos facilmente, permitindo diversas possibilidades de uso, mas com por esses dados serem de facil acesso, eles podem ser facilmente alterados.
my_list = ["banana", "maça","vibrador replica real do michael jackson"]
print (my_list)
my_list.clear()
print (my_list)
#Tuple é um elemento sequencial ordenavel mas não modificavel, permite membros duplicados
#Tuple é uma lista imodificavel, sendo mais difícil para o usuário mexer.  
my_tuple = ("banana", "maça", "boneco sexual replica do Justin Bieber")
for xis in my_tuple: 
    print(xis)

#Set é um elemento sequencial sem ordem, e inindexavel, sem membros dúplicados
#uma boa forma de conseguir fazer uma lista bem segura, é oo Set, mas com essa segurança tu acaba por limitar muito o funcionamento da sua lista.
my_set = {"banana", "maça", "vagina elástica tamanho bufalo fêmea"}
my_set2 = my_set.copy()
print(my_set == my_set2)

#Dictionary é um elemento sequencial sem ordem, modificavel e indexavel via string, sem membros dúplicados
#com o dict você pode extrair informações direto dele apenas pedindo a o index que é uma string
my_dick = {
    "ob1": "banana",
    "ob2": "maça",
    "ob3": "batata"
}
my_dick["ob4"] ="Adam Sandler"
print(my_dick)


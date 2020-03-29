"""
Exercício 1
"""
#list é um elemento sequencial q é ordenada e modificavel, permite membros dúplicados
my_list = ["banana", "maça","vibrador replica real do michael jackson"]
print (my_list)
my_list.clear()
print (my_list)
#Tuple é um elemento sequencial ordenada mas não modificavel, permite membros duplicados
my_tuple = ("banana", "maça", "boneco sexual replica do Justin Bieber")
for xis in my_tuple: 
    print(xis)

#Set é um elemento sequencial sem ordem, e inindexavel, sem membros dúplicados
my_set = {"banana", "maça", "vagina elástica tamanho bufalo fêmea"}
my_set2 = my_set.copy()
print(my_set == my_set2)

#Dictionary é um elemento sequencial sem ordem, modificavel e indexavel, sem membros dúplicados
my_dick = {
    "ob1": "banana",
    "ob2": "maça",
    "ob3": "batata"
}
my_dick["ob4"] ="Adam Sandler"
print(my_dick)
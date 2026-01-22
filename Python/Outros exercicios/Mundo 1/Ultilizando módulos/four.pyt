import math

comprimentoCO = float(input("Digite o comprimento do Cateto Oposto: "))
comprimentoCA = float(input("Digite o comprimento do Cateto Adjacente: "))

print(f"O comrpimento da hipotenusa é {math.hypot(comprimentoCO, comprimentoCA)}")

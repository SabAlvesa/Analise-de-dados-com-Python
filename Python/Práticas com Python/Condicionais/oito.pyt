distancia = int(input("Digite a distÂncia percorrida(em km): "))

valor1 = 10.00
valor2 = 20.00
valor3 = 30.00

if distancia <= 100:
    print("Valor do pedágio:", valor1)
elif 100 < distancia <= 200:
    print("Valor do pedágio:", valor2)

else:
    print("Valor do pedágio:", valor3)
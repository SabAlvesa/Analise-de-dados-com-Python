print('*=' *10)
print('RESULTADO DE UMA PA')
print('*=' *10)
p = int(input("Primeiro termo: "))
r = int(input("A razão: "))
#d = p + (10-1) * r #calculando o décimo termo
termo = p
cont = 1

while cont <=10:
    print(termo)
    termo += r
    cont +=1
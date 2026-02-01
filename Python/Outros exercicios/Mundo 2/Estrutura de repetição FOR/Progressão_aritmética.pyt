print('*=')
print('RESULTADO DE UMA PA')
print('*=')
p = int(input("Primeiro termo: "))
r = int(input("Segundo termo: "))
d = p + (10-1) * r #calculando o décimo termo

for i in range(p,d +r ,r):
    print(i)
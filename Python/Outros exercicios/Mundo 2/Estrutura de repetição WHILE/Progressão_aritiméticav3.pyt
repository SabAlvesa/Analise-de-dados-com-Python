print('*=' * 10)
print('RESULTADO DE UMA PA')
print('*=' * 10)

p = int(input("Primeiro termo: "))
r = int(input("A razão: "))

termo = p
cont = 1
total = 0
mais = 10 

while mais != 0:
    total = total + mais
    while cont <= total:
        print(f'{termo} -> ', end='')
        termo += r
        cont += 1
    print('PAUSA')
    mais = int(input("Quantos termos você quer mostrar a mais? "))

print(f"Progressão finalizada com {total} termos mostrados.")
n1 = float(input("Digite o 1° valor: "))
n2 = float(input("Digite o 2° valor: "))
n3 = float(input("Digite o 3° valor: "))

menor = n1

if n2<n1 and n2<n3:
    menor = n2
if n3<n1 and n3<n2:
    menor = n3
    
print(f"O menor valor digitado foi: {menor:.2f}")

maior = n1

if n2>n1 and n2>n3:
    maior = n2
if n3>n1 and n3>n2:
    maior = n3
    
print(f"O maior valor digitado foi: {maior:.2f}")

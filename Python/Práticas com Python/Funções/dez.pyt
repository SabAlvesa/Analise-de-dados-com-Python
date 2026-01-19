
def soma_recursiva(n): 
    if n == 1: 
        return 1 
    return n + soma_recursiva(n - 1) 
 
numero = int(input("Digite um número: ")) 
print(f"A soma de 1 a {numero} é: {soma_recursiva(numero)}") 
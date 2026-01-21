n = input("Digite o seu noome").strip()

nome = n.split()
print("Seu primeiro nome é", nome[0])
print("Seu último nome é", nome[len(nome)-1])
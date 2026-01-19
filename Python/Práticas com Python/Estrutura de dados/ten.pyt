usuarios = {
    "João": 25,
    "Maria": 17,
    "Ana": 19,
    "Carlos": 16,
    "Beatriz": 22,
    "Pedro": 15,
    "Luiza": 18
}


classificacao_usuarios = {
    nome: "adulto" if idade >= 18 else "menor"
    for nome, idade in usuarios.items()
}


print("Classificação dos usuários:")
print(classificacao_usuarios)
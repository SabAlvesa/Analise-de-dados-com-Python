while True:
    nome = input("Digite o nome de usuário: ")
    senha = input("Digite a sua senha: ")

    if len(nome) < 5:
        print("O nome de usuário deve ter pelo menos 5 caracteres.")
        continue

    if len(senha) < 8:
        print("A senha deve ter pelo menos 8 caracteres.")
        continue

    print("Cadastro realizado com sucesso!")
    break
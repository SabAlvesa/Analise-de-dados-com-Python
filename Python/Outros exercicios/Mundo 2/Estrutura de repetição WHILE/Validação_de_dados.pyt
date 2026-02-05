sexo = input("Informe o seu sexo: ").strip().upper()[0]
while sexo not in 'MF':
    sexo = (input("Dados inválidos. Por favor, informe seu sexo: ")).strip().upper()
print('Sexo', sexo, 'Registrado com sucesso. ')



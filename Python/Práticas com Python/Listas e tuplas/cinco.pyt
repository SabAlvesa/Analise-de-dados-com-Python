convidados = ['Ana', 'Pedro', 'Carlos']

print(f"Lista atual de convidados: {convidados}")

novo_convidado = input("Digite o nome do novo convidado: ")
posicao = int(input("Digite a posição na qual deseja inserir o convidado: "))
convidados.insert(posicao - 1, novo_convidado)  

print(f"Lista atualizada de convidados: {convidados}")
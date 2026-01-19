
convidados = set() 
  
while True: 
    nome = input("Digite o nome do convidado ou 'sair' para encerrar: ") 

    if nome.lower() == "sair": 
        break 

    convidados.add(nome) 

print(f"Convidados confirmados: {', '.join(convidados)}") 
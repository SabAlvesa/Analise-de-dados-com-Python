nome = input ("Digite o seu nome: ")

nome_maisculo = nome.upper()
nome_minusculo = nome.lower()
nome_primeiro = nome.split()


print(f"Maiúsculo: {nome.upper()}\nMinúsculo: {nome.lower()}\nTotal de letras: {len(nome.replace(' ', ''))}\nLetras do 1º nome: {len(nome_primeiro[0])}")
def saudacao(hora):
    if hora < 12:
        return "Bom dia!"
    
    elif hora < 18:
        return "Boa tarde!"
    else:
        return "Boa noite!"
    
horaA = int(input("Digite a hora atual:"))
print(saudacao(horaA))

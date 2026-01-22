s = float(input("Digite o seu salário: "))

if s <= 1250:
    novo = s  + (s *15/100)
else:
    novo = s + (s *10/100)
    
print(f"Quem ganhava {s:.2f} passa a receber: {novo:.2f}")
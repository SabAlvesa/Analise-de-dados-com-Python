livros = [
    ("Dom Quixote", "Miguel de Cervantes", 1605),
    ("Orgulho e Preconceito", "Jane Austen", 1813),
    ("O Grande Gatsby", "F. Scott Fitzgerald", 1925),
    ("Cem Anos de Solidão", "Gabriel García Márquez", 1967),
    ("1984", "George Orwell", 1949),
    ("Harry Potter e a Pedra Filosofal", "J.K. Rowling", 1997),
    ("O Senhor dos Anéis", "J.R.R. Tolkien", 1954),
    ("A Revolução dos Bichos", "George Orwell", 1945),
    ("O Apanhador no Campo de Centeio", "J.D. Salinger", 1951),
    ("O Código Da Vinci", "Dan Brown", 2003),
]

catalogo = {
    livro[0]: {"autor": livro[1], "ano": livro[2]}
    for livro in livros
}
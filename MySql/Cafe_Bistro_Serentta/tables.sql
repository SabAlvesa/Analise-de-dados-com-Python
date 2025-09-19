create database cafe_bistro_serenatto;

use cafe_bistro_serenatto;

CREATE TABLE produtos (
  id_produtos INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255),
  preco DECIMAL(10,2) NOT NULL,
  categoria VARCHAR(50)
);

CREATE TABLE colaboradores (
  id_colaborador INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  cargo VARCHAR(100),
  data_contratacao DATE,
  telefone VARCHAR(20),
  email VARCHAR(100),
  rua VARCHAR(100) NOT NULL,
  bairro VARCHAR(100) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  estado VARCHAR(2) NOT NULL,
  cep VARCHAR(8) NOT NULL
);

CREATE TABLE fornecedores (
  id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  contato VARCHAR(100) NOT NULL,
  telefone VARCHAR(20),
  email VARCHAR(100),
  rua VARCHAR(100) NOT NULL,
  bairro VARCHAR(100) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  estado VARCHAR(2) NOT NULL,
  cep VARCHAR(8) NOT NULL
);

CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  telefone VARCHAR(20),
  email VARCHAR(100) DEFAULT 'Sem email',
  endereco VARCHAR(255)
);

CREATE TABLE pedidos (
  id_pedido INT PRIMARY KEY AUTO_INCREMENT,
  id_cliente INT,
  datahora_pedido DATETIME,
  status VARCHAR(50),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

CREATE TABLE itens_pedidos (
  id_pedido INT,
  id_produto INT,
  quantidade INT,
  preco_unitario DECIMAL(10,2),
  PRIMARY KEY (id_pedido, id_produto),
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
  FOREIGN KEY (id_produto) REFERENCES produtos(id_produtos) ON DELETE CASCADE
);


INSERT INTO colaboradores (nome, cargo, data_contratacao, telefone, email, rua, bairro, cidade, estado, cep) VALUES
('Marta Sousa', 'Chef de Cozinha', '2022-05-10', '215555678', 'marta.sousa@email.com', 'Rua dos Sabores - 456', 'Saboroso', 'São Paulo', 'SP', '20000001'),
('Pedro Almeida', 'Barista', '2022-07-20', '315557890', 'pedro.almeida@email.com', 'Avenida do Café - 789', 'Centro', 'São Paulo', 'SP', '01000001'),
('Sofia Rodrigues', 'Garçom', '2022-01-12', '415552345', 'sofia.rodrigues@email.com', 'Rua da Hospitalidade - 101', 'Boas Maneiras', 'São Paulo', 'SP', '40000001'),
('João Pereira', 'Atendente', '2022-09-05', '515558765', 'joao.pereira@email.com', 'Rua das flores - 210', 'Centro', 'São Paulo', 'SP', '20000001'),
('Inês Lima', 'Barista', '2022-04-02', '615553421', 'ines.lima@email.com', 'Rua das Entregas - 280', 'Entregas Rápidas', 'São Paulo', 'SP', '90000001'),
('Antonio Artur', 'Entregador', '2023-01-10', '568442577', 'antonio.artur@email.com', 'Rua das flores - 210', 'Centro', 'São Paulo', 'SP', '20000001');

INSERT INTO fornecedores (id_fornecedor, nome, contato, telefone, email, rua, bairro, cidade, estado, cep) VALUES
(1, 'Café do Brasil Ltda.', 'Maria Oliveira', '115551234', 'cafebrasil@email.com', 'Rua do Café - 123', 'Centro', 'São Paulo', 'SP', '01000000'),
(2, 'Laticínios Sabor Puro', 'João Santos', '215555678', 'laticinios@email.com', 'Avenida das Vacas - 456', 'Leite Feliz', 'Rio de Janeiro', 'RJ', '20000000'),
(3, 'Frutas Frescas S.A.', 'Carlos Ferreira', '315557890', 'frutasfrescas@email.com', 'Rua das Maçãs - 789', 'Pomar Verde', 'Belo Horizonte', 'MG', '30000000'),
(4, 'Padaria da Cidade', 'Sofia Alves', '415552345', 'padariacidade@email.com', 'Rua dos Pães - 101', 'Pão Quentinho', 'Salvador', 'BA', '40000000'),
(5, 'Fornecedor de Chocolate', 'Rui Lima', '515558765', 'chocolatelovers@email.com', 'Rua do Cacau - 210', 'Chocolateira', 'Florianópolis', 'SC', '88000000'),
(6, 'Distribuidora de Bebidas', 'Ana Pereira', '615553421', 'bebidaspremium@email.com', 'Avenida das Garrafas - 35', 'Copo Cheio', 'Porto Alegre', 'RS', '90000000');

INSERT INTO produtos (nome, descricao, preco, categoria) VALUES
('Espresso', 'Um shot de espresso forte e encorpado.', 2.50, 'Café'),
('Cappuccino', 'Espresso, leite vaporizado e espuma de leite.', 3.50, 'Café'),
('Latte Macchiato', 'Leite vaporizado, espresso e espuma de leite.', 4.00, 'Café'),
('Mocha', 'Espresso, leite vaporizado, chocolate e chantilly.', 4.50, 'Café'),
('Café da Casa', 'Café da casa especial com sabor suave.', 2.00, 'Café'),
('Chá de Camomila', 'Chá de camomila com mel e limão.', 2.00, 'Chá'),
('Omelete de Queijo', 'Omelete recheada com queijo e ervas.', 7.50, 'Almoço'),
('Quiche de Espinafre', 'Quiche de espinafre e queijo de cabra.', 8.00, 'Almoço'),
('Frango ao Curry', 'Frango ao curry com arroz basmati.', 9.00, 'Jantar'),
('Tiramisu', 'Sobremesa italiana com café e mascarpone.', 5.00, 'Sobremesa'),
('Croissant de Chocolate', 'Croissant recheado com chocolate belga.', 3.50, 'Sobremesa'),
('Cappuccino Gelado', 'Cappuccino gelado com chantilly e canela.', 4.50, 'Café'),
('Salada de Quinoa', 'Salada de quinoa com vegetais frescos.', 7.00, 'Almoço'),
('Sanduíche de Peru', 'Sanduíche de peru com queijo e mostarda.', 6.00, 'Almoço'),
('Salmão Grelhado', 'Salmão grelhado com legumes da estação.', 11.00, 'Jantar'),
('Cheesecake de Framboesa', 'Cheesecake de framboesa com calda.', 5.50, 'Sobremesa'),
('Smoothie de Frutas', 'Smoothie refrescante de frutas da estação.', 4.00, 'Bebidas'),
('Chá Verde', 'Chá verde com gengibre e limão.', 2.50, 'Chá'),
('Baguete de Presunto', 'Baguete fresca recheada com presunto e queijo.', 10.00, 'Almoço'),
('Salada de Frutas', 'Salada de frutas frescas com iogurte.', 4.00, 'Sobremesa'),
('Caprese Wrap', 'Wrap recheado com tomate, mozzarella e manjericão.', 6.50, 'Almoço'),
('Muffin de Mirtilo', 'Muffin de mirtilo recém-assado.', 3.00, 'Café'),
('Smoothie de Manga', 'Smoothie refrescante de manga e banana.', 4.50, 'Bebidas'),
('Misto Quente', 'Sanduíche misto quente de presunto e queijo.', 5.50, 'Almoço'),
('Tarte Tatin de Maçã', 'Tarte de maçã caramelizada.', 5.00, 'Sobremesa'),
('Sanduíche de Frango', 'Sanduíche de frango grelhado e abacate.', 7.00, 'Almoço'),
('Batido de Morango', 'Batido cremoso de morango com chantilly.', 4.50, 'Bebidas'),
('Croissant de Amêndoa', 'Croissant recheado com chocolate belga.', 3.50, 'Sobremesa'),
('Tofu Scramble', 'Scramble de tofu com vegetais e espinafre.', 6.50, 'Sobremesa'),
('Salada de Atum', 'Salada de atum com feijão e pimentão.', 8.00, 'Almoço');


INSERT INTO clientes (nome, telefone, email, endereco) VALUES
('Maria Silva', '115551234', 'maria.silva@email.com', 'Rua das Flores, 123, Cidade A'),
('João Pereira', '215555678', 'joao.pereira@email.com', 'Av. Principal, 456, Cidade B'),
('Ana Rodrigues', '315557890', 'ana.rodrigues@email.com', 'Rua Central, 789, Cidade C'),
('Pedro Alves', '415552345', 'pedro.alves@email.com', 'Travessa dos Sonhos, 56, Cidade D'),
('Sofia Santos', '515558765', 'sofia.santos@email.com', 'Alameda das Artes, 321, Cidade E'),
('Jorge Lima', '615553421', 'jorge.lima@email.com', 'Praça das Estrelas, 987, Cidade F'),
('Luisa Ferreira', '715559876', 'luisa.ferreira@email.com', 'Rua das Palmeiras, 789, Cidade G'),
('Carlos Gomes', '815552345', 'carlos.gomes@email.com', 'Avenida dos Ventos, 123, Cidade H'),
('Marta Ribeiro', '915555432', 'marta.ribeiro@email.com', 'Travessa das Maravilhas, 56, Cidade I');


INSERT INTO clientes (nome, telefone, email, endereco) VALUES
('Ana Maria Silva', '1515557890', 'ana.silva@email.com', 'Rua Central, 567, Cidade O');

INSERT INTO clientes (nome, telefone, endereco) VALUES
('André Almeida', '1015556789', 'Praça da Felicidade, 456, Cidade J');

INSERT INTO clientes (nome, telefone, email, endereco) VALUES
('João Carlos Rodrigues', '1615552345', 'joao.rodrigues@email.com', 'Praça dos Poetas, 321, Cidade P');

INSERT INTO clientes (nome, telefone, endereco) VALUES
('Isabela Pereira', '1115558765', 'Rua das Araras, 789, Cidade K');


INSERT INTO clientes (nome, telefone, email, endereco) VALUES
('Isabel Gonçalves', '1715558765', 'isabel.goncalves@email.com', 'Alameda das Gaivotas, 654, Cidade Q'),
('Ricardo Ferreira', '1815554321', 'ricardo.ferreira@email.com', 'Avenida da Paz, 987, Cidade R'),
('Mariana Costa', '1915551234', 'mariana.costa@email.com', 'Travessa das Mariposas, 234, Cidade S'),
('Luís Carlos Sousa', '2015555678', 'luis.sousa@email.com', 'Rua dos Sonhos, 456, Cidade T'),
('Silvia Ribeiro', '2115557890', 'silvia.ribeiro@email.com', 'Alameda dos Sorrisos, 765, Cidade U'),
('Artur Santos', '2215552345', 'artur.santos@email.com', 'Praça das Alegrias, 987, Cidade V'),
('Carolina Lima', '2315558765', 'carolina.lima@email.com', 'Avenida da Felicidade, 654, Cidade W'),
('Pedro Almeida', '2415554321', 'pedro.almeida@email.com', 'Rua das Estrelas, 123, Cidade X'),
('Inês Gonçalves', '2515551234', 'ines.goncalves@email.com', 'Travessa das Maravilhas, 234, Cidade Y');

INSERT INTO clientes (nome, telefone, endereco) VALUES
('Rui Santos', '1215554321', 'Alameda das Estrelas, 654, Cidade L');

INSERT INTO clientes (nome, telefone, email, endereco) VALUES
('Diogo Fernandes', '2615555678', 'diogo.fernandes@email.com', 'Praça dos Desejos, 987, Cidade Z');

INSERT INTO clientes (nome, telefone, endereco) VALUES
('Helena Lima', '1315551234', 'Avenida dos Sonhos, 234, Cidade M');

INSERT INTO clientes (nome, telefone, endereco) VALUES
('Paulo Sousa', '1415555678', 'Travessa das Marés, 876, Cidade N');


INSERT INTO pedidos (id_pedido, id_cliente, datahora_pedido, status) 
VALUES (1, 10, '2023-01-02 08:15:00', 'Em Andamento');

INSERT INTO pedidos (id_pedido, id_cliente, datahora_pedido, status) 
VALUES (2, 3, '2023-01-02 08:45:00', 'Concluído');

INSERT INTO pedidos (id_pedido, id_cliente, datahora_pedido, status) 
VALUES (3, 8, '2023-01-02 09:30:00', 'Entregue');

INSERT INTO pedidos (id_pedido, id_cliente, datahora_pedido, status) 
VALUES (4, 14, '2023-01-02 10:00:00', 'Em Andamento');

INSERT INTO pedidos (id_pedido, id_cliente, datahora_pedido, status) 
VALUES (5, 7, '2023-01-02 11:30:00', 'Concluído');


INSERT INTO itens_pedidos (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES (1, 5, 1, 2.0);

INSERT INTO itens_pedidos (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES (1, 2, 2, 7.0);

INSERT INTO itens_pedidos (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES (2, 12, 3, 13.5);

INSERT INTO itens_pedidos (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES (3, 8, 1, 8.0);

INSERT INTO itens_pedidos (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES (3, 20, 1, 4.0);

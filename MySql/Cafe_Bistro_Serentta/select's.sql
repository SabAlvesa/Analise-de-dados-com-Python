use cafe_bistro_serenatto;

SELECT * FROM pedidos;
select * from clientes;
SELECT * FROM colaboradores;
SELECT * FROM fornecedores;

SELECT nome, rua, bairro, cidade, estado, cep FROM colaboradores 
UNION ALL
SELECT nome, rua, bairro, cidade, estado, cep FROM fornecedores;

SELECT nome, telefone 
FROM clientes 
WHERE id_cliente = (
    SELECT id_cliente 
    FROM pedidos 
    WHERE datahora_pedido = '2023-01-02 08:15:00'
);


SELECT id_cliente 
FROM pedidos 
WHERE MONTH(datahora_pedido) = 1;

SELECT nome
FROM clientes
WHERE id IN (
    SELECT id_cliente
    FROM pedidos
    WHERE strftime('%m', datahora_pedido) = '01');
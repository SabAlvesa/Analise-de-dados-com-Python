-- CONSULTAS PROJETO PRÁTICO SQL - ALURA
use projeto_pratico_sql;


-- SELECT FROM, WHERE, Operadores de comparação, LIMIT, ORDER BY.
SELECT * FROM TabelaDepartamento;
SELECT * FROM TabelaColaboradores;
SELECT * FROM TabelaClientes;
SELECT * FROM TabelaTelefones;
SELECT * FROM TabelaEmprestimo;
SELECT * FROM TabelaPagamentos;
SELECT * FROM TabelaScoreCredito;
SELECT * FROM TabelaConta;
SELECT * FROM TabelaClienteConta;

--
SELECT * FROM TabelaClientes;

--
SELECT NomeColaborador, cargo FROM TabelaColaboradores;

--
SELECT * FROM TabelaEmprestimo
WHERE Status = true;

--
SELECT nome, estado FROM TabelaClientes
WHERE Estado = 'SP';

--
SELECT NomeColaborador, Salario FROM TabelaColaboradores
WHERE salario > 5000;

--
SELECT * FROM TabelaEmprestimo
WHERE valor >= 10000;

-- A a z
SELECT NomeColaborador, cargo  FROM TabelaColaboradores 
ORDER BY NomeColaborador;

--
SELECT * FROM TabelaColaboradores 
ORDER BY NomeColaborador 
limit 5 ;

--
SELECT * FROM TabelaEmprestimo 
ORDER BY Valor desc;

--
SELECT * FROM TabelaColaboradores
WHERE salario > 5000
ORDER BY id_colaborador DESC
LIMIT 2;


-- ULTILIZANDO OPERADORES LÓGICOS WHERE, AND, OR, NOT, IN,  SELECT DISTINCT, BETWEEN  
SELECT * FROM TabelaColaboradores
WHERE salario > 4500 AND id_departamento = 'D03';

--
SELECT Nome, DataNascimento, Estado FROM TabelaClientes
WHERE  DataNascimento < '1990-01-01' OR Estado = 'SP';

--
SELECT id_emprestimo, DataInicio, tipo, valor FROM TabelaEmprestimo
WHERE DataInicio  between '2023-01-01' and '2023-12-31';

--
SELECT Nome, DataNascimento, CPF FROM TabelaClientes
WHERE YEAR(CURDATE()) - YEAR(DataNascimento) >= 18
    AND ( DATE_FORMAT(CURDATE(), '%m%d') >= DATE_FORMAT(DataNascimento, '%m%d')
	OR YEAR(CURDATE()) - YEAR(DataNascimento) > 18
    );
    
--
select id_emprestimo, tipo, valor  from TabelaEmprestimo
where tipo in ('Pessoal', 'Imobiliário');

--
SELECT id_emprestimo, Tipo, Valor FROM TabelaEmprestimo
WHERE tipo in  ('Automóvel', 'Consignado') is not null and valor between 10000 and 50000;

--
SELECT DISTINCT Estado FROM TabelaClientes;

--
select Nome, CPF, Cidade, Estado  from TabelaClientes
Where Cidade = 'Rio de Janeiro' or 'Salvador' is not null and CPF like '6%';

--
SELECT id_pagamento, DataPagamento, Valor, Status  FROM TabelaPagamentos
WHERE DataPagamento between '2023-01-01' and '2023-12-31' and valor between 500 and 1000;

--
SELECT id_cliente, Pontuacao, Fonte FROM TabelaScoreCredito
where not (Pontuacao >  700);

-- FUNÇÕES DE STRING, CONCAT, LENGHT, SUBTRING, LOWER, TRIM, REPLACE

SELECT 
UPPER (nome) as NomeMaisculo
from TabelaClientes;

--
SELECT 
LOWER (NomeColaborador) as NomeMinusculo
from TabelaColaboradores;

--
SELECT CONCAT(SUBSTR(Nome, 1, 3), SUBSTRING(CPF, 1, 3)) AS Identificador
FROM TabelaClientes;

--
SELECT Nome,
CHAR_LENGTH (nome) as comprimento
from TabelaClientes;

--
SELECT CONCAT(NomeColaborador, '-', Cargo ) AS Nome_Completo_Cargo
FROM TabelaColaboradores;

--
SELECT CONCAT(TRIM(Tipo), ' - ', Status, '  -', Valor ) AS DescricaoEmprestimo
FROM TabelaEmprestimo;

--
SELECT id_pagamento, CONCAT(SUBSTR(Status, 1, 3), SUBSTRING(id_pagamento, 1, 3)) AS IdentificadorPagamento
FROM TabelaPagamentos;

--
SELECT id_score, Fonte,
    REPLACE(REPLACE(Fonte, 'Serasa', 'SER'), 'Boa vista', 'BOA') AS FonteAbreviada
FROM TabelaScoreCredito;

--
SELECT id_emprestimo, TRIM (Tipo) as Tipo
FROM TabelaEmprestimo;

-- FUNÇÕES DE DATA - NOW, DATE, STRTIME, DATEDIFF, EXTRACT, DATE_ADD, CURDATE CASE WHEN

SELECT NOW() data_atual
FROM TabelaPagamentos LIMIT1;

--
SELECT Nome, DATE_FORMAT(DataNascimento, '%d-%m-%Y') AS data_formatada 
FROM TabelaClientes;

--
SELECT id_emprestimo, DATEDIFF(DATE_ADD(DataInicio, INTERVAL Prazo DAY), DataInicio) AS Dias_Totais
from TabelaEmprestimo;

--
SELECT Nome, EXTRACT(YEAR FROM DataNascimento ) AS AnoNascimento FROM TabelaClientes;

--
SELECT *
FROM TabelaEmprestimo
WHERE DataInicio between  '2023-01-01' and '2023-03-31';

--
SELECT id_emprestimo, DataInicio, DATE_ADD(DataInicio,  INTERVAL Prazo DAY) AS DataVencimento
from TabelaEmprestimo;

--
Select * from TabelaPagamentos 
order by DataPagamento asc;

--
SELECT Nome, 
TIMESTAMPDIFF(YEAR, DataNascimento, CURDATE()) AS Idade 
FROM TabelaClientes;

--
SELECT id_emprestimo,
    CASE WHEN DATEDIFF(CURDATE(), DataInicio) > Prazo THEN 'Vencido'
	ELSE 'No Prazo'
    END AS categoria
FROM TabelaEmprestimo;

--
SELECT id_emprestimo, DataInicio, DATE_ADD(DataInicio , INTERVAL 30 DAY) AS PróximoPagamento
from TabelaEmprestimo;

-- OPERADORES ARITIMETICOS (+ - /* ), ROUD, CEIL, FLOOR, ABS, POWER, SRT

SELECT * FROM TabelaVendasMensais;
SELECT * FROM TabelaPedidos;
SELECT * FROM TabelaEstimativaCrescimento;
SELECT * FROM TabelaMetasVendasMensais;

--
Select Mes, Ano,
    (PrecoUnitario * Quantidade ) AS Receita, (CustoUnitario * Quantidade) as Despesas
    FROM TabelaVendasMensais
    Where Ano = 2024;
    
--
Select Mes, Ano,
    (Quantidade * PrecoUnitario) - (Quantidade * CustoUnitario) as LucroBruto
    FROM TabelaVendasMensais
    Where Ano = 2024;
    
  --
 SELECT Mes, Ano,
       ROUND(100.0 * ((Quantidade * PrecoUnitario) - (Quantidade * CustoUnitario)) / 
             (Quantidade * PrecoUnitario), 1)  AS MargemLucroBruto
FROM TabelaVendasMensais;

--
SELECT Mes, Ano,
       ROUND((Quantidade * PrecoUnitario) - (Quantidade * CustoUnitario) - (Quantidade * CustoUnitario) * 0.30, 2) AS LucroLiquido
FROM TabelaVendasMensais;

--
SELECT id_pedido, QuantidadeVendida,
       CEIL(QuantidadeVendida / 8.0) as QtdCaixas
FROM TabelaPedidos;

--
SELECT id_pedido, QuantidadeVendida, PrecoUnitario,Desconto,
       FLOOR((PrecoUnitario * QuantidadeVendida) * (1 - Desconto)) as PrecoTotal
FROM TabelaPedidos;

--
SELECT Mes, Ano,
       ABS(VendasMensais - MediaVendas5Anos) AS DiferencaAbsolutaVendas
from TabelaMetasVendasMensais;

--
SELECT Ano, VendasBase,
   FLOOR(POWER(1 + TaxaCrescimento, 5) * VendasBase) AS VendasProjecao5Anos
FROM TabelaEstimativaCrescimento;

--
SELECT id_pedido, CidadeCliente,
       ROUND(SQRT(POWER(Latitude - (-23.588161), 2) + POWER(Longitude - (-46.632344), 2)) * 111.19, 1) AS Distancia,
       CASE WHEN ROUND(SQRT(POWER(Latitude - (-23.588161), 2) + POWER(Longitude - (-46.632344), 2)) * 111.19, 1) < 60 
            THEN 'Entrega gratuita'
            ELSE 'Cobrar entrega'
       END AS StatusEntrega
FROM TabelaPedidos;

--
SELECT id_pedido, CidadeCliente,
       ROUND(SQRT(POWER(Latitude - (-23.588161), 2) + POWER(Longitude - (-46.632344), 2)) * 111.19, 1) AS Distancia,
       CASE WHEN ROUND(SQRT(POWER(Latitude - (-23.588161), 2) + POWER(Longitude - (-46.632344), 2)) * 111.19, 1) < 60 
            THEN 0
            ELSE CEIL(QuantidadeVendida / 8.0) * 50
       END AS Frete
FROM TabelaPedidos;
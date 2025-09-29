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

-- Funções de agregação - SUM, AVG, COUNT, MAX, MIN, GROUP BY, HAVING

SELECT SUM(Valor) AS TotalEmprestimo 
FROM TabelaEmprestimo;

--
SELECT AVG(Salario) AS MediaSalarial 
FROM TabelaColaboradores;

--
SELECT Max(Valor) AS MaiorEmprestimo 
FROM TabelaEmprestimo;

--
SELECT Min(Valor) AS MenorEmprestimo 
FROM TabelaEmprestimo;

--
SELECT Count(*) AS TotalColaboradores 
FROM TabelaColaboradores;

--
SELECT AVG(Valor) AS MediaEmprestimo
FROM TabelaEmprestimo;

--
SELECT id_departamento,
    SUM(salario) AS TotalSalarios -- Corrigido: Função SUM em maiúsculas
FROM TabelaColaboradores
GROUP BY id_departamento;

--
SELECT Tipo, SUM(Valor) AS TotalporTipo
FROM TabelaEmprestimo
GROUP BY tipo
HAVING SUM(Valor) > 20000;

--
SELECT Tipo, SUM(Valor) AS TotalValor, count(*) as QuantidadeEmprestimo
FROM TabelaEmprestimo
GROUP BY Tipo;

--
SELECT 
	Sum(valor) as TotalEmprestimo,
	AVG(valor) AS MediaEmprestimo, 
	MAX(valor) AS MaiorEmprestimo, 
	MIN(valor) as MenorEmprestimo 
 FROM TabelaEmprestimo;


-- SUBCONSULTAS = Consultas dentro de uma consulta
SELECT
    d.NomeDepartamento, 
    (SELECT AVG(c.salario)
        FROM TabelaColaboradores c 
        WHERE c.id_departamento = d.id_departamento) AS salariomedio
FROM TabelaDepartamento d; 

--
SELECT Nome, Valor
FROM TabelaClientes
JOIN TabelaEmprestimo ON TabelaClientes.id_cliente = TabelaEmprestimo.id_cliente
WHERE Valor > (SELECT AVG(Valor) FROM TabelaEmprestimo);

--
SELECT  Cidade, 
    COUNT(*) AS TotalEmprestimosAtivos
FROM TabelaClientes
JOIN TabelaEmprestimo ON TabelaClientes.id_cliente = TabelaEmprestimo.id_cliente
WHERE Status = 1
GROUP BY Cidade;

--
SELECT Nome,  Email,  Valor
FROM TabelaClientes
JOIN TabelaEmprestimo ON TabelaClientes.id_cliente = TabelaEmprestimo.id_cliente
WHERE NOT EXISTS (
    SELECT 1 
    FROM TabelaPagamentos 
    WHERE TabelaPagamentos.id_emprestimo = TabelaEmprestimo.id_emprestimo AND Status != 'Pago'
);

--
SELECT c.Nome, s.Pontuacao -- Adicionado o apelido 's' para clareza
FROM TabelaClientes c -- Apelido 'c'
JOIN TabelaScoreCredito s -- Apelido 's'
    ON c.id_cliente = s.id_cliente
WHERE s.Pontuacao > ( -- Compara a pontuação do cliente...
        SELECT AVG(Pontuacao) -- CORRIGIDO: Pontuacao, não Potuacao
        FROM TabelaScoreCredito
    );
    
    --
 SELECT 
    NomeDepartamento,
    (SELECT MAX(Salario) 
     FROM TabelaColaboradores 
     WHERE TabelaColaboradores.id_departamento = TabelaDepartamento.id_departamento) AS MaiorSalario
FROM TabelaDepartamento;


--
SELECT  Nome, 
    COUNT(*) AS TotalEmprestimosAtivos
FROM TabelaClientes
JOIN TabelaEmprestimo ON TabelaClientes.id_cliente = TabelaEmprestimo.id_cliente
WHERE Status = 1
GROUP BY Nome;

--
select tipo, (select avg (valor)
from tabelaPagamentos
WHERE TabelaPagamentos.id_emprestimo = TabelaEmprestimo.id_emprestimo AND Status = 'Pago') AS MediaPagamentos
FROM TabelaEmprestimo;

--
SELECT 
    Nome, 
    (SELECT NumeroConta 
     FROM TabelaConta 
     WHERE TabelaConta.id_conta = TabelaClienteConta.id_conta) AS NumeroConta, 
    (SELECT TipoConta 
     FROM TabelaConta 
     WHERE TabelaConta.id_conta = TabelaClienteConta.id_conta) AS TipoConta, 
    (SELECT Saldo 
     FROM TabelaConta 
     WHERE TabelaConta.id_conta = TabelaClienteConta.id_conta) AS Saldo
FROM TabelaClientes
JOIN TabelaClienteConta ON TabelaClientes.id_cliente = TabelaClienteConta.id_cliente;

--
SELECT 
    c.Cidade,
    (SELECT SUM(e.Valor) 
     FROM TabelaEmprestimo e 
     WHERE e.id_cliente IN (
         SELECT cl.id_cliente 
         FROM TabelaClientes cl 
         WHERE cl.Cidade = c.Cidade
     )) AS ValorTotalEmprestimos
FROM TabelaClientes c
GROUP BY c.Cidade;

-- CLÁUSULAS JOIN - INNER JOIN, RIGHT JOIN, LEFT JOIN, FULL JOIN, CROSS JOIN
select n.NomeColaborador, d.NomeDepartamento 
from tabelaColaboradores n
join tabelaDepartamento d on n.id_departamento = d.id_departamento;

--
select c.id_cliente, c.Nome, t.Telefone
from tabelaClientes c
left join tabelaTelefones t on c.id_cliente = t.id_cliente;

--
select c.NomeColaborador, d.Nome as NomeCliente
from tabelaClientes d
right join TabelaColaboradores c on d.id_colaborador = c.id_colaborador;

--
select c.nome, e.tipo, e.valor
from tabelaEmprestimo e,
full join tabelaClientes c on c.id_cliente = e.id_cliente;
 
--  em mysql
SELECT c.Nome, e.Tipo, e.Valor
FROM TabelaClientes c
LEFT JOIN TabelaEmprestimo e ON c.id_cliente = e.id_cliente

UNION 

SELECT c.Nome, e.Tipo, e.Valor
FROM TabelaClientes c
RIGHT JOIN TabelaEmprestimo e ON c.id_cliente = e.id_cliente
WHERE c.id_cliente IS NULL;

--
SELECT 
    cl.Nome AS NomeCliente, 
    e.Tipo AS TipoEmprestimo, 
    e.Valor AS ValorEmprestimo, 
    p.DataPagamento, 
    p.Valor AS ValorPago
FROM TabelaClientes cl
INNER JOIN TabelaEmprestimo e ON cl.id_cliente = e.id_cliente
INNER JOIN TabelaPagamentos p ON e.id_emprestimo = p.id_emprestimo;

--
select n.nome as Cliente, sum(e.Valor) as TotalEmprestimo
from tabelaClientes n
inner join TabelaEmprestimo e on n.id_cliente = e.id_cliente
group by n.nome
having sum(e.valor) > 10000;


--
SELECT Tipo AS TipoEmprestimo, Valor,
    CASE 
        WHEN Status THEN 'Ativo'
        ELSE 'Inativo'
    END AS Status
FROM TabelaEmprestimo;
 
 --
 SELECT  cl.Nome AS NomeCliente, cl.Cidade, col.NomeColaborador, dep.NomeDepartamento
FROM  TabelaClientes cl
INNER JOIN  TabelaColaboradores col ON cl.id_colaborador = col.id_colaborador
INNER JOIN  TabelaDepartamento dep ON col.id_departamento = dep.id_departamento
WHERE cl.Cidade = 'São Paulo';

--
select n.nome as NomeCliente, sum(e.Valor) as TValorEmprestimo
from tabelaClientes n
join TabelaEmprestimo e on n.id_cliente = e.id_cliente
Where e.valor > (select avg(valor) from tabelaEmprestimo)
group by n.nome;

--

select n.NomeColaborador, d.NomeDepartamento, n.EmailColaborador
from tabelaColaboradores n
join tabelaDepartamento d on n.id_departamento = d.id_departamento;


-- COMMON TABLE EXPRESSIONS - CTE SIMPLES, CTE MULTIPLAS CONSULTAS

WITH EmprestimosPendentes AS (
    SELECT Valor
    FROM TabelaEmprestimo
    WHERE Status = 0
)
SELECT SUM(Valor) AS TotalEmprestimosPendentes
FROM EmprestimosPendentes;

--
WITH ClientesBomCredito AS (
    SELECT sc.id_cliente, cl.Nome, sc.Pontuacao
    FROM TabelaScoreCredito sc
    JOIN TabelaClientes cl ON sc.id_cliente = cl.id_cliente
    WHERE sc.Pontuacao > 700
)
SELECT id_cliente, Nome, Pontuacao
FROM ClientesBomCredito;

--
WITH SalariosPorDepartamento AS (
    SELECT id_departamento, SUM(Salario) AS TotalSalarios
    FROM TabelaColaboradores
    GROUP BY id_departamento
)
SELECT id_departamento, TotalSalarios
FROM SalariosPorDepartamento;

--
WITH ClientesPorEstado AS (
    SELECT Estado, COUNT(*) AS QuantidadeClientes
    FROM TabelaClientes
    GROUP BY Estado
)
SELECT Estado, QuantidadeClientes
FROM ClientesPorEstado;

--
WITH IdadesClientes AS (
    SELECT Nome,
        YEAR(CURDATE()) - YEAR(DataNascimento) AS Idade
    FROM TabelaClientes),
MediaIdade AS (
    SELECT AVG(Idade) AS IdadeMedia
    FROM IdadesClientes)
SELECT ic.Nome, ic.Idade
FROM IdadesClientes ic
CROSS JOIN 
    MediaIdade mi
WHERE ic.Idade < mi.IdadeMedia;

--
WITH ClientesMultiplasContas AS (
    SELECT id_cliente
    FROM TabelaClienteConta
    GROUP BY id_cliente
    HAVING COUNT(id_conta) > 1
),
EmprestimosClientesMultiplasContas AS (
    SELECT e.id_emprestimo, e.id_cliente, e.Valor
    FROM TabelaEmprestimo e
    WHERE e.id_cliente IN (SELECT id_cliente FROM ClientesMultiplasContas)
)
SELECT id_emprestimo, id_cliente, Valor
FROM EmprestimosClientesMultiplasContas;


--
WITH PagamentosPorEmprestimo AS (
    SELECT id_emprestimo, SUM(Valor) AS TotalPagamentos
    FROM TabelaPagamentos
    GROUP BY id_emprestimo
),
EmprestimosComPagamentosAltos AS (
    SELECT id_emprestimo, TotalPagamentos
    FROM PagamentosPorEmprestimo
    WHERE TotalPagamentos >= 1000
)
SELECT ep.id_emprestimo, ep.TotalPagamentos
FROM EmprestimosComPagamentosAltos ep;

--
WITH MediaSalariosPorDepartamento AS (
    SELECT id_departamento, AVG(Salario) AS MediaSalarial
    FROM TabelaColaboradores
    GROUP BY id_departamento
),
DepartamentosComSalarioAlto AS (
    SELECT id_departamento, MediaSalarial
    FROM MediaSalariosPorDepartamento
    WHERE MediaSalarial > 4500
)
SELECT id_departamento, MediaSalarial
FROM DepartamentosComSalarioAlto;

--
WITH ClientesComEmprestimosPendentes AS (
    SELECT id_cliente
    FROM TabelaEmprestimo
    WHERE Status = 0
),
ClientesComCreditoBaixo AS (
    SELECT id_cliente
    FROM TabelaScoreCredito
    WHERE Pontuacao < 500
)
SELECT cl.Nome
FROM ClientesComEmprestimosPendentes ce
JOIN ClientesComCreditoBaixo cb ON ce.id_cliente = cb.id_cliente
JOIN TabelaClientes cl ON ce.id_cliente = cl.id_cliente;

--
WITH ContasAbertasRecentes AS (
    SELECT id_conta, Saldo
    FROM TabelaConta
    WHERE DataAbertura > '2023-01-01'
),
SaldoMedio AS (
    SELECT AVG(Saldo) AS MediaSaldo
    FROM ContasAbertasRecentes
)
SELECT COUNT(*) AS TotalContas, (SELECT MediaSaldo FROM SaldoMedio) AS MediaSaldo
FROM ContasAbertasRecentes;

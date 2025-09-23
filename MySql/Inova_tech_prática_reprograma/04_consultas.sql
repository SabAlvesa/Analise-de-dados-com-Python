-- CONSULTAS

-- 1º Qual região tem mais mulheres recebendo a remuneração mais alta segundo a pesquisa?
-- regiao_onde mora, faixa_salarial e genero

SELECT s.regiao_onde_mora AS regiao,
    COUNT(*) AS total_mulheres
FROM state_of_data_2022 AS s
WHERE s.genero = 'Feminino'
    AND s.faixa_salarial IN ('16–20k', '20–40k', '>40k') is not null 
    AND s.regiao_onde_mora IS NOT NULL
GROUP BY s.regiao_onde_mora  
ORDER BY total_mulheres DESC;


-- 2º Entre os profissionais com nível superior, quais são as 5 áreas de formação mais comuns?
 select *  from state_of_data_2022;
-- area_de_formacao e nivel_ensino

SELECT s.area_de_formacao,
    COUNT(*) AS total_profissionais
FROM state_of_data_2022 AS s
WHERE s.nivel_ensino = 'Graduação/Bacharelado'
GROUP BY s.area_de_formacao
ORDER BY total_profissionais DESC
LIMIT 5;


-- 3º Qual a representatividade de cada grupo étnico e de gênero em cargos de liderança da área de dados?
-- cor_raca_etnia, genero,
-- cargo_como_gestor like %dados%

select cargo_como_gestor from state_of_data_2022;

SELECT s.cor_raca_etnia, s.genero,
    COUNT(*) AS representatividade
FROM state_of_data_2022 AS s
WHERE s.cargo_como_gestor IS NOT NULL
    AND (
        s.cargo_como_gestor LIKE '%gerente%'
        OR s.cargo_como_gestor LIKE '%Chapter Lead%'
        OR s.cargo_como_gestor LIKE '%supervisor%'
        OR s.cargo_como_gestor LIKE '%coordenador%'
        OR s.cargo_como_gestor LIKE '%sócio%'
		OR s.cargo_como_gestor LIKE '%C-level%'
        OR s.cargo_como_gestor LIKE '%diretor%'
		OR s.cargo_como_gestor LIKE '%gerente%'
    )
GROUP BY s.cor_raca_etnia, s.genero
ORDER BY representatividade DESC;


-- 4º Qual a diferença na média salarial entre profissionais com menos de 5 anos de experiência, comparando aqueles com e sem graduação formal?
 select *  from state_of_data_2022;
 -- faixa_salarial avg , anos_experiecia_na_area_dados e nivel_ensino
 
SELECT 'Sem graduação formal' AS grupo,
    AVG(s.ponto_medio_faixa_salarial) AS salario_medio
FROM state_of_data_2022 d
JOIN vw_experiencia_area_dados e
    ON d.anos_experiencia_na_area_dados = e.anos_experiencia_na_area_dados
JOIN vw_media_salarial_por_faixa s
    ON d.faixa_salarial = s.faixa_salarial
WHERE
    e.media_experiencia_em_anos <= 5
    AND d.nivel_ensino IN ('Não tenho graduação formal', 'Prefiro não informar')

UNION ALL

SELECT 'Com graduação formal' AS grupo,
    AVG(s.ponto_medio_faixa_salarial) AS salario_medio
FROM state_of_data_2022 d
JOIN vw_experiencia_area_dados e
    ON d.anos_experiencia_na_area_dados = e.anos_experiencia_na_area_dados
JOIN vw_media_salarial_por_faixa s
    ON d.faixa_salarial = s.faixa_salarial
WHERE
    e.media_experiencia_em_anos <= 5
    AND d.nivel_ensino NOT IN ('Não tenho graduação formal', 'Prefiro não informar');
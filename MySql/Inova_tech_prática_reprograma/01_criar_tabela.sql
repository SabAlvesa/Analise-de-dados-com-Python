
create database inova_tech;
use inova_tech;


-- criando tabelas
CREATE TABLE state_of_data_2022 (
    id VARCHAR(35) PRIMARY KEY,
    idade INTEGER,
    genero TEXT,
    cor_raca_etnia TEXT,
    pcd TEXT,
    vive_no_brasil BOOL,
    estado_onde_mora TEXT,
    uf_onde_mora VARCHAR(2),
    regiao_onde_mora TEXT,
    regiao_de_origem TEXT,
    nivel_ensino TEXT,
    area_de_formacao TEXT,
    situacao_atual_de_trabalho TEXT,
    setor TEXT,
    gestor BOOL,
    cargo_como_gestor TEXT,
    cargo_atual TEXT,
    nivel_senioridade TEXT,
    faixa_salarial TEXT,
    anos_experiencia_na_area_dados TEXT,
    anos_experiencia_anterior_ti TEXT,
    linguagens_no_trabalho TEXT,
    linguagem_preferida TEXT,
    bancos_de_dados_no_trabalho TEXT,
    cloud_no_trabalho TEXT,
    cloud_preferida TEXT
); 
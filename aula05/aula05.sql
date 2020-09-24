-- Comentario linha (equivale //)
/*Comentario de bloco*/

-- Exibe a lista de banco de dados criados
\l

-- DDL
-- DML
-- DQL
-- DTL

-- Cria um novo banco de dados
CREATE DATABASE aula05_npxi;

-- Conectar a uma database
\c aula05_npxi;

--Apaga um banco de dados
DROP DATABASE aula05_npxi;

-- TIPOS DADOS
    -- NUMERICOS
        -- INTEIROS
            -- INT ou INTEGER (4 BYTES)
            -- BIGINT 
        -- REAL
            -- FLOAT         ==> 4.4657584
            -- NUMERIC(5, 2) ==> 4.47
    
    -- CARACTERE
        -- CHAR(5)         ==>  A N A _ _
        -- VARCHAR(5)      ==>  A N A
        -- TEXT            ==>

    -- TEMPORAIS
        -- TIMESTAMP    ==> DD-MM-YYYY HH:MM:SS
        -- DATE         ==> DD-MM-YYYY

-- Criar uma tabela
    -- Produto
        -- descricao    ==> CARACTERE 
        -- fabricante   ==> CARACTERE
        -- quantidade   ==> NUMERICO INTEIRO
        -- preco        ==> NUMERICO REAL

CREATE TABLE produto(
    descricao VARCHAR(50),
    fabricante VARCHAR(50),
    quantidade INTEGER,
    preco NUMERIC(9,2)
);

-- Exibe a descricao de uma tabela (DESC)
\d produto;

-- inserir registros

INSERT INTO produto
VALUES ('Notebook', 'Sony', 330, 2299.99);


-- consultando dados de uma tabela
SELECT * FROM produto;



-- Encerra o SQL SHELL 
\q
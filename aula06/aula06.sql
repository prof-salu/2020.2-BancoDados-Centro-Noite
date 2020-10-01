CREATE DATABASE aula06_npxi;

-- Atalho para execução ==> F5
SELECT now();

-- Uma empresa requer armazenar os dados de seus clientes, 
-- esses clientes são proprietarios de bens, cujo o armazenamento das informações tbm sao requeridos. 
-- Dados dos proprietario: nome, email, sexo e endereço. 
-- Dados dos bens: nome, tipo(movel ou imovel) e valor. 
-- Cada proprietario pode nao ter bens ou ter N bens, ja um bem, obrigatoriamente deve ser de um, 
-- e somente um proprietario.

-- proprietario			-- Bens
	-- nome					-- nome
	-- email				-- tipo
	-- sexo					-- valor
	-- endereço

-- ***REGRA*** ==> Toda tabela deve obrigatoriamente possuir uma chave primaria (PK).
-- SEQUENCE 
-- CONSTRAINT ==> Restrição
	-- NOT NULL ==> preenchimento obrigatorio
	-- UNIQUE ==> permite apenas valores unicos
	-- CHECK ==> restringe o dominio

DROP TABLE proprietario;
ALTER TABLE proprietario RENAME TO prop2;

CREATE TABLE proprietario(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(40) UNIQUE NOT NULL,
	sexo CHAR(1) CHECK(sexo='f' OR sexo='m' OR sexo='F' OR sexo='M') NOT NULL,
	endereco VARCHAR(100) NOT NULL
);

--Implicito
INSERT INTO proprietario VALUES (101, 'Ana', 'ana@email.com', 'F', 'Rua ABC, 33');

--Explicito
INSERT INTO proprietario (id, nome, sexo, email, endereco) VALUES
(102, 'Pedro', 'M', 'pedro@email.com', 'Rua XYZ, 77');

--multiplos inserts
INSERT INTO proprietario VALUES
(103, 'Augusto', 'gugu@email.com', 'm', 'Rua EFG, 11'),
(104, 'maria', 'maria@email.com', 'F', 'Rua IOP, 16'),
(105, 'Ana', 'ana_clara@email.com', 'F', 'Rua TYU, 11');

SELECT * FROM proprietario;

INSERT INTO proprietario VALUES (106, 'Jose', 'jose@email.com', 'M', 'Rua ABC, 33');

-- APAGA registros
DELETE FROM proprietario WHERE id = 105;
DELETE FROM proprietario WHERE email='ana_clara@email.com';

-- UPDATE
	-- atualiza registros
UPDATE proprietario 
SET endereco='Rua XYZ, 12'
WHERE id =103 OR id=102 OR id=99;

UPDATE proprietario
set endereco=''
WHERE id=102;

CREATE TABLE bens(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	tipo varchar(6) CHECK(tipo='movel' OR tipo='imovel') NOT NULL,
	valor NUMERIC(10,2) NOT NULL,
	id_prop INTEGER NOT NULL,
	FOREIGN KEY (id_prop) REFERENCES proprietario(id)
);

SELECT * FROM bens;
SELECT * FROM proprietario;
INSERT INTO bens VALUES (201, 'Carro', 'movel', 25000, 101);
INSERT INTO bens VALUES (202, 'Apartamento', 'imovel', 250000, 103);
INSERT INTO bens VALUES (203, 'Moto', 'movel', 10000, 104);
INSERT INTO bens VALUES (204, 'Sitio', 'imovel', 350000, 104);
INSERT INTO bens VALUES (205, 'Apartamento', 'imovel', 250000000, 101);

DELETE FROM proprietario WHERE id = 104;

ALTER TABLE bens ADD COLUMN situacao VARCHAR(10);

-- JUncao de tabelas
--JOIN

SELECT p.id AS "ID PROP", p.nome AS "Proprietario", b.id AS "ID BEM", b.nome AS "Bem", b.valor
from proprietario p inner join bens b
on p.id = b.id_prop;

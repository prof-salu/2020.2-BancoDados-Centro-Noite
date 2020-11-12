 /*Criando consultas*/

/*Exibir todas as informacoes de todos os empregados*/
SELECT * FROM EMPREGADO;
SELECT * FROM CLIENTE;
SELECT * FROM DEPARTAMENTO;

/*ORDENAÇÃO DE CONSULTAS */
SELECT * FROM EMPREGADO ORDER BY CARGO ASC;
SELECT * FROM EMPREGADO ORDER BY SALARIO ASC;
SELECT * FROM EMPREGADO ORDER BY DT_ADMISSAO ASC;

SELECT * FROM EMPREGADO ORDER BY CARGO DESC;
SELECT * FROM EMPREGADO ORDER BY SALARIO DESC;
SELECT * FROM EMPREGADO ORDER BY DT_ADMISSAO DESC;

/*Filtrando colunas*/
/*Exibir o primeiro e ultimo nome de todos os empregados*/
SELECT PRIM_NOME, ULT_NOME FROM EMPREGADO;

/*Exibir o primeiro e ultimo nome, SALARIO E O COD DEPARTAMENTO de todos os empregados*/
SELECT PRIM_NOME, ULT_NOME, SALARIO, ID_DEPTO FROM EMPREGADO;
SELECT SALARIO, ULT_NOME, PRIM_NOME, ID_DEPTO FROM EMPREGADO;
SELECT SALARIO, ULT_NOME, PRIM_NOME, ID_DEPTO FROM EMPREGADO ORDER BY DT_ADMISSAO;

/*Escrevendo expressoes*/
/*Exibir o nome completo de todos os empregados e o salario anual*/
SELECT PRIM_NOME, ULT_NOME, SALARIO FROM EMPREGADO;
-- CONCATENAR
SELECT PRIM_NOME || ' ' || ULT_NOME, SALARIO FROM EMPREGADO;
-- EXPRESSOES
SELECT PRIM_NOME || ' ' || ULT_NOME, SALARIO * 12 FROM EMPREGADO;

/*Criando ALIAS*/
/*Exibir o nome completo de todos os empregados com o cabecalho (Nome completo) e o salario anual com o cabecalho (Salario Anual)*/
SELECT PRIM_NOME || ' ' || ULT_NOME AS "Nome completo", SALARIO * 12 AS "Salario anual" FROM EMPREGADO;

SELECT PRIM_NOME || ' ' || ULT_NOME AS "Nome completo", SALARIO * 12 AS "Salario anual" FROM EMPREGADO ORDER BY 2 ASC;

SELECT PRIM_NOME || ' ' || ULT_NOME AS "Nome completo", SALARIO * 12 AS "Salario anual" FROM EMPREGADO ORDER BY "Salario anual" ASC;

/*Distinct*/
/*Exibir os cargos unicos dos funcionarios*/
SELECT DISTINCT CARGO FROM EMPREGADO;

SELECT CARGO, SALARIO FROM EMPREGADO;

SELECT DISTINCT CARGO, SALARIO FROM EMPREGADO;

/*Filtrando linhas WHERE*/
/*Exibir todos os empregados que possuem ID maior que 3*/
SELECT * FROM EMPREGADO WHERE ID > 3;

/*Exibir todos os empregados que possuem salario menor que 8000*/
SELECT * FROM EMPREGADO WHERE SALARIO < 8000;

/*Exibir todos os empregados que trabalham no departamento de id 30*/
SELECT * FROM EMPREGADO WHERE ID_DEPTO = 30;

/*Exibir todos os empregados que não trabalham no departamento de id 20*/
SELECT * FROM EMPREGADO WHERE ID_DEPTO != 20;
SELECT * FROM EMPREGADO WHERE ID_DEPTO <> 20;

/*Exibir todos os empregados que possuem o sobrenome Ugarte*/

-- LOWER --> MINUSCULA
-- UPPER --> MAIUSCULA

SELECT * FROM EMPREGADO WHERE UPPER(ULT_NOME) = 'UGARTE';
SELECT * FROM EMPREGADO WHERE ULT_NOME = 'Ugarte';
SELECT * FROM EMPREGADO WHERE LOWER(ULT_NOME) = 'ugarte';
SELECT * FROM EMPREGADO WHERE UPPER(ULT_NOME) = UPPER('UgArTe');

/*Trabalhando com datas*/
/*Exibir os empregados contratados no dia 07/04/2010*/
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO = '07/04/2010';
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO = '07-04-2010';
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO = '07-04-1910';

/*Operadores logicos*/
/*Exibir todos os empregados que foram contratados depois de 2008 E que recebem salario maior que 10000*/
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO >= '01-01-2009' AND SALARIO > 10000;

/*Exibir todos os empregados que foram contratados depois de 2008 OR que recebem salario maior que 10000*/
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO >= '01-01-2009' OR SALARIO > 10000;


/*Operadores relacionais*/
/*IN*/
/*Exibir todos os empregados que trabalham no departamento 10 ou 30*/
SELECT * FROM EMPREGADO WHERE ID_DEPTO = 10 OR ID_DEPTO = 30;
SELECT * FROM EMPREGADO WHERE ID_DEPTO IN (10, 30);

/*Exibir todos os empregados que NÃO trabalham no departamento 10 ou 30*/
SELECT * FROM EMPREGADO WHERE ID_DEPTO != 10 AND ID_DEPTO != 30;
SELECT * FROM EMPREGADO WHERE ID_DEPTO NOT IN (10, 30);

/*BETWEEN*/
/*Exibir todos os empregados que possuem um salario entre 8000 e 19500*/
SELECT * FROM EMPREGADO WHERE SALARIO >= 8000 AND SALARIO <= 19500;
SELECT * FROM EMPREGADO WHERE SALARIO BETWEEN 8000 AND 19500;

/*Exibir todos os empregados que NÃO possuam um salario entre 8000 e 19500*/
SELECT * FROM EMPREGADO WHERE SALARIO < 8000 OR SALARIO > 19500;
SELECT * FROM EMPREGADO WHERE SALARIO NOT BETWEEN 8000 AND 19500;

/*LIKE*/
/*Exibir todos os empregados cujo sobrenome comece com a letra N*/
-- (%) ==> NENHUM OU VARIOS CARACTERES
-- (_) ==> APENAS UM CARACTERE

SELECT * FROM EMPREGADO WHERE ULT_NOME LIKE 'N%';

/*Exibir todos os empregados cujo sobrenome termine com a letra S*/
SELECT * FROM EMPREGADO WHERE ULT_NOME LIKE '%s';

/*Exibir todos os empregados cujo sobrenome tenha a letra U*/
SELECT * FROM EMPREGADO WHERE UPPER(ULT_NOME) LIKE '%U%';

/*Exibir todos os empregados cujo sobrenome tenha a letra O como segunda letra*/
SELECT * FROM EMPREGADO WHERE UPPER(ULT_NOME) LIKE '_O%';

SELECT * FROM EMPREGADO WHERE PRIM_NOME LIKE '_____';

SELECT * FROM EMPREGADO WHERE PRIM_NOME LIKE '_____%';

/*Exibir todos os empregados cujo sobrenome NÃO tenha a letra U*/
SELECT * FROM EMPREGADO WHERE UPPER(ULT_NOME) NOT LIKE '%U%';

/*NULL*/
/*Exibir todos os empregados que NÃO tenham gerentes*/
SELECT * FROM EMPREGADO WHERE ID_GERENTE IS NULL;

/*Exibir todos os empregados que tenham gerentes*/
SELECT * FROM EMPREGADO WHERE ID_GERENTE IS NOT NULL;




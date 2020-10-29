CREATE DATABASE aula08_npxi;

CREATE TABLE professor(
	id_prof INTEGER PRIMARY KEY,
	nome VARCHAR(25)
);

CREATE TABLE disciplina(
	id_disc INTEGER PRIMARY KEY,
	nome VARCHAR(25)
);

CREATE TABLE aluno(
	id_aluno INTEGER PRIMARY KEY,
	nome VARCHAR(25)
);

CREATE TABLE leciona(
	professor INTEGER,
	disciplina INTEGER,
	PRIMARY KEY (professor, disciplina),
	FOREIGN KEY (professor) REFERENCES professor (id_prof),
	FOREIGN KEY (disciplina) REFERENCES disciplina (id_disc)
);

CREATE TABLE prova(
	id_prova INTEGER,
	id_aluno INTEGER,
	id_disc INTEGER,
	nota NUMERIC(2,1),
	PRIMARY KEY (id_prova, id_aluno, id_disc),
	FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
	FOREIGN KEY (id_disc) REFERENCES disciplina(id_disc)
);

CREATE TABLE assiste(
	id_disc INTEGER,
	id_aluno INTEGER,
	data DATE,
	faltas INTEGER,
	PRIMARY KEY (id_disc, id_aluno, data),
	FOREIGN KEY (id_disc) references disciplina(id_disc),
	FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

DROP TABLE professor;

INSERT INTO professor VALUES (1, null), (2, 'Ana'), (3, 'Carlos');

SELECT * FROM professor WHERE nome is null;







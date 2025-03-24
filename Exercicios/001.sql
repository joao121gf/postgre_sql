CREATE TABLE projetos(
	id SERIAL PRIMARY KEY,
	nome_projeto VARCHAR(100) NOT NULL,
	descricao TEXT,
	data_inicio DATE,
	data_fim DATE
)

SELECT * FROM projetos
INSERT INTO projetos (nome_projeto, descricao, data_inicio, data_fim)
VALUES ('Natural Piscina', 'Site de empresa de piscina com foco em responsividade',
'2024-02-02', '2024-02-20')


SELECT nome_projeto, data_inicio FROM projetos

ALTER TABLE projetos ADD COLUMN em_andamento VARCHAR(20)



ALTER TABLE projetos RENAME COLUMN em_andamento TO status
SELECT * FROM projetos
UPDATE projetos SET status = 'Em andamento'
SELECT * FROM projetos
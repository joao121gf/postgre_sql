CREATE TABLE usuarios(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT UNIQUE NOT NULL,
	date_register DATE NOT NULL,
	plane TEXT CHECK(plane IN ('Básico','Padrão','Premium')) NOT NULL,
	status TEXT CHECK (status IN ('Ativo','Cancelado')) NOT NULL
)

CREATE TABLE assinaturas(
 id SERIAL PRIMARY KEY,
 user_id INT NOT NULL,
 FOREIGN KEY (user_id) REFERENCES usuarios(id) ON DELETE CASCADE,
 date_init DATE NOT NULL,
 plane TEXT NOT NULL,
 pay_value NUMERIC(10,2) NOT NULL
)

CREATE TABLE visualizacoes (
	id SERIAL PRIMARY KEY,
	usuario_id INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
	video_id TEXT NOT NULL,
	data_visualizacao TIMESTAMP NOT NULL,
	tempo_assistido_segundos INTEGER NOT NULL
)


CREATE TABLE videos (
	id SERIAL PRIMARY KEY,
	titulo TEXT NOT NULL,
	categoria TEXT NOT NULL,
	duracao_segundos INTEGER NOT NULL,
	data_publicacao DATE NOT NULL
)

CREATE TABLE categorias (
	id SERIAL PRIMARY KEY,
	nome TEXT UNIQUE NOT NULL
)

CREATE TABLE pagamentos (
	id SERIAL PRIMARY KEY,
	usuario_id INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
	data_pagamento DATE NOT NULL,
	valor_pago NUMERIC NOT NULL,
	metodo_pagamento TEXT CHECK (metodo_pagamento IN ('Cartão de Crédito', 'Pix', 'Boleto', 'PayPal')) NOT NULL
)

CREATE TABLE historico_recomendacoes(
	id SERIAL PRIMARY KEY,
	usuario_id INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
	video_id INT NOT NULL,
	FOREIGN KEY (video_id) REFERENCES videos(id),
	data_recomendacao TIMESTAMP,
	foi_assistido BOOLEAN
)

CREATE TABLE avaliacoes (
	id SERIAL PRIMARY KEY,
	usuario_id INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
	video_id INT NOT NULL,
	FOREIGN KEY (video_id) REFERENCES videos(id),
	nota NUMERIC(2,1) CHECK(nota BETWEEN 1 and 5) NOT NULL,
	comentario TEXT NOT NULL,
	data_avaliacao TIMESTAMP NOT NULL	
)

CREATE TABLE suporte_chamados(
	id SERIAL PRIMARY KEY,
	usuario_id INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
	categoria TEXT check(categoria IN ('Cobrança', 'Técnico', 'Sugestão', 'Outro')),
	status TEXT check (status in ('Aberto', 'Em andamento', 'Resolvido', 'Fechado')),
	descricao TEXT NOT NULL,
	data_abertura TIMESTAMP NOT NULL,
	data_fechamento TIMESTAMP NULL DEFAULT NULL
)

CREATE TABLE logs_acesso (
	id SERIAL PRIMARY KEY,
	usuario_id INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
	ip TEXT NOT NULL,
	data_acesso TIMESTAMP NOT NULL,
	dispositivo TEXT NOT NULL,
	localizacao TEXT NOT NULL
)


CREATE TABLE preferencias_usuarios (
	id SERIAL PRIMARY KEY,
	usuario_id INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
	idioma TEXT NOT NULL,
	legendas BOOLEAN NOT NULL,
	tema_interface TEXT CHECK(tema_interface IN ('Claro','Escuro')),
	notificacoes BOOLEAN NOT NULL
)

CREATE TABLE feedback_usuarios(
	id SERIAL PRIMARY KEY,
	usuario_id INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
	satisfacao NUMERIC(1,10),
	comentario TEXT NOT NULL,
	data_envio TIMESTAMP
	
)



CREATE TABLE historico_acesso (
	id SERIAL PRIMARY KEY,
	usuario_id INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
	data_login TIMESTAMP,
	plano_na_epoca TEXT NOT NULL,
	status_na_epoca TEXT NOT NULL
)
SELECT * FROM suporte_chamados


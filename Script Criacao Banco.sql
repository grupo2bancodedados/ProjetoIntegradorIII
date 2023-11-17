CREATE DATABASE projeto_integrador2;

USE projeto_integrador2;


CREATE TABLE estados (
	uf_estado CHAR(2) PRIMARY KEY,
	uf_nome VARCHAR(30) NOT NULL
);

CREATE TABLE usuarios (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	nome_usuario VARCHAR(45) NOT NULL,
	email_usuario VARCHAR(45) NOT NULL,
	genero_usuario ENUM('F','M') NOT NULL,
	data_nasc_usuario DATE NOT NULL,
	uf_estado CHAR(2) NOT NULL,
    senha_usuario varchar(32) not null
);


ALTER TABLE usuarios ADD (
   	CONSTRAINT usuarios_estados_fk FOREIGN KEY (uf_estado) REFERENCES estados (uf_estado)
);

CREATE TABLE contas (
	id_conta TINYINT PRIMARY KEY AUTO_INCREMENT,
    nome_conta VARCHAR(45) NOT NULL,
    id_usuario INT NOT NULL
);

ALTER TABLE contas ADD (
    	CONSTRAINT contas_usuarios_fk FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

CREATE TABLE categorias (
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(45)
);

CREATE TABLE subcategorias (
	id_subcategoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_subcategoria VARCHAR(45),
    id_categoria INT NOT NULL
);

ALTER TABLE subcategorias ADD CONSTRAINT subcategorias_categorias_fk FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria);

CREATE TABLE transacoes (
	id_transacao INT PRIMARY KEY AUTO_INCREMENT,
    data_transacao DATE NOT NULL,
    valor_transacao DECIMAL(10,2) NOT NULL,
    tipo_transacao ENUM ('C', 'D'),
    descricao VARCHAR(100),
    id_conta TINYINT NOT NULL,
    id_categoria INT NOT NULL,
    id_subcategoria INT
);

ALTER TABLE transacoes ADD (
   CONSTRAINT transacoes_contas_fk FOREIGN KEY (id_conta) REFERENCES contas (id_conta),
   CONSTRAINT transacoes_categorias_fk FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria),
    CONSTRAINT transacoes_subcategorias_fk FOREIGN KEY (id_subcategoria) REFERENCES subcategorias (id_subcategoria)
);	
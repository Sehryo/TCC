CREATE DATABASE db_culturama;

USE db_culturama;

CREATE TABLE tb_usuario(
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(255) NOT NULL,
    senha_usuario VARCHAR(256) NOT NULL,
    email_usuario VARCHAR(255) NOT NULL,
    telefone_usuario CHAR(13) NOT NULL,
    dataNasc_usuario DATE NOT NULL,
    tags_usuario VARCHAR(255)
);

CREATE TABLE tb_organizador(
    id_organizador INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_organizador VARCHAR(255) NOT NULL,
    email_organizador VARCHAR(255) NOT NULL 
);

CREATE TABLE tb_pj(
    cnpj_pj CHAR(11) NOT NULL,
    id_organizador int,
    CONSTRAINT FK_cnpj_organizador
    FOREIGN KEY(id_organizador)
    REFERENCES tb_organizador(id_organizador)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE tb_pf(
    cpf_pg CHAR(11) NOT NULL,
    id_organizador int,
    CONSTRAINT FK_cpf_organizador
    FOREIGN KEY(id_organizador)
    REFERENCES tb_organizador(id_organizador)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE tb_endereco(
    id_endereco INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rua_endereco VARCHAR(255) NOT NULL,
    bairro_endereco VARCHAR(255) NOT NULL,
    cidade_endereco VARCHAR(255) NOT NULL,
    uf_endereco CHAR(2) NOT NULL,
    cep_endereco CHAR(8) NOT NULL,
    logradouro_endereco VARCHAR(255) NOT NULL
);

CREATE TABLE tb_endereco_usuario(
    id_usuario INT NOT NULL,
    id_endereco INT NOT NULL,
    numero_endereco INT NOT NULL,
    CONSTRAINT FK_usuario_endereco
    FOREIGN KEY(id_usuario)
    REFERENCES tb_usuario(id_usuario)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_endereco_usuario
    FOREIGN KEY(id_endereco)
    REFERENCES tb_endereco(id_endereco)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE tb_evento(
    id_evento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_evento VARCHAR(255) NOT NULL,
    horario_entrada TIME,
    horario_saida TIME,
    id_organizador INT NOT NULL,
    id_endereco INT NOT NULL,
    tags_evento VARCHAR(255),
    CONSTRAINT FK_id_organizador
    FOREIGN KEY(id_organizador)
    REFERENCES tb_organizador(id_organizador)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_id_endereco
    FOREIGN KEY(id_endereco)
    REFERENCES tb_endereco(id_endereco)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE tb_setor_evento(
    id_setor INT PRIMARY KEY AUTO_INCREMENT,
    nome_setor VARCHAR(255) NOT NULL,
    id_evento INT,
    CONSTRAINT FK_setor_evento
    FOREIGN KEY(id_evento)
    REFERENCES tb_evento(id_evento)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE tb_interesses(
    data_interesse DATE,
    id_usuario INT,
    id_evento INT,
    CONSTRAINT FK_usuario_interessado
    FOREIGN KEY (id_usuario)
    REFERENCES tb_usuario(id_usuario)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_evento_interesse
    FOREIGN KEY (id_evento)
    REFERENCES tb_evento(id_evento)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE tb_avaliacao(
    id_usuario INT NOT NULL,
    id_organizador INT NOT NULL,
    valor_avaliacao INT NOT NULL,
    CONSTRAINT FK_avaliador
    FOREIGN KEY (id_usuario)
    REFERENCES tb_usuario(id_usuario)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_avaliado
    FOREIGN KEY (id_organizador)
    REFERENCES tb_organizador(id_organizador)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
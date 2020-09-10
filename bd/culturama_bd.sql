CREATE DATABASE db_culturama;

USE db_culturama;

CREATE TABLE tb_usuario(
    id_usuario int PRIMARY KEY AUTO_INCREMENT,
    nome_usuario varchar(200) NOT NULL,
    senha_usuario varchar(256) NOT NULL,
    email_usuario varchar(255) NOT NULL,
    telefone_usuario varchar(13) NOT NULL,
    genero_usuario char(1) NOT NULL,
    rua_cliente varchar(255),
    bairro_cliente varchar(255),
    cidade_cliente varchar(255),
    uf_cliente varchar(2),
    cep_cliente varchar(8),
    numero_cliente varchar(5),
    logradouro_cliente varchar(255)
);

CREATE TABLE tb_pj(
    cnpj_pj varchar(14) NOT NULL
);

CREATE TABLE tb_pf(
    cpf_pf varchar(11) NOT NULL
);

CREATE TABLE tb_organizador(
    id_organizador int PRIMARY KEY AUTO_INCREMENT,
    nome_organizador varchar(255) NOT NULL,
    email_organizador varchar(255) NOT NULL
);

CREATE TABLE tb_ambiente(
    id_endereco int PRIMARY KEY AUTO_INCREMENT,
    rua_evento varchar(255) NOT NULL,
    bairro_evento varchar(255) NOT NULL,
    cidade_evento varchar(255) NOT NULL,
    uf_evento varchar(2) NOT NULL,
    cep_evento varchar(8) NOT NULL,
    numero_evento varchar(5) NOT NULL,
    logradouro_evento varchar(255) NOT NULL
);

CREATE TABLE tb_setor(
    id_setor int PRIMARY KEY AUTO_INCREMENT,
    nome_setor varchar(255),
    id_endereco int,
    CONSTRAINT FK_endereco_setor 
    FOREIGN KEY (id_endereco)
    REFERENCES tb_ambiente(id_endereco)
);

CREATE TABLE tb_evento(
    id_evento int PRIMARY KEY AUTO_INCREMENT,
    nome_evento varchar(255) NOT NULL,
    data_evento date NOT NULL,
    id_endereco_evento int,
    CONSTRAINT FK_endereco_evento
    FOREIGN KEY (id_endereco_evento)
    REFERENCES tb_ambiente(id_endereco)
);
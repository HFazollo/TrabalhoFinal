CREATE DATABASE TrabalhoBancoDeDados; 

USE TrabalhoBancoDeDados;

CREATE TABLE Moeda (
    nome_moeda VARCHAR(50) UNIQUE,
    fator_conversao DECIMAL(10, 2),
    PRIMARY KEY (nome_moeda) 
);

CREATE TABLE Pais (
    DDI VARCHAR(5) UNIQUE,
    nome VARCHAR(50) UNIQUE NOT NULL,
    moeda_principal VARCHAR(50),
    PRIMARY KEY (DDI),
    FOREIGN KEY (moeda_principal) REFERENCES Moeda(nome_moeda) ON UPDATE CASCADE
);

CREATE TABLE Usuario(
    nick VARCHAR(50),
    email VARCHAR(100) NOT NULL,
    cep VARCHAR(50),
    data_nasc DATE,
    DDI_pais VARCHAR(5),
    PRIMARY KEY (nick),
    FOREIGN KEY (DDI_pais) REFERENCES Pais(DDI) ON UPDATE CASCADE
);

CREATE TABLE Membro(
    nick_membro VARCHAR(50),
    nro_telefone VARCHAR(20),
    PRIMARY KEY (nick_membro),
    FOREIGN KEY (nick_membro) REFERENCES Usuario(nick) ON UPDATE CASCADE
);

CREATE TABLE Streamer (
	nick_streamer VARCHAR(50),
	nro_usuario INT NOT NULL,
	nro_passaporte VARCHAR(50) NOT NULL,
	PRIMARY KEY (nick_streamer),
	FOREIGN KEY (nick_streamer) REFERENCES Usuario(nick) ON UPDATE CASCADE
);

CREATE TABLE Empresa (
    id_unico INT,
    nome VARCHAR(50) NOT NULL,
    nome_fantasia VARCHAR(50),
    CNPJ VARCHAR(14) UNIQUE NOT NULL,
    DDI_pais VARCHAR(5) NOT NULL,
    PRIMARY KEY (id_unico),
    FOREIGN KEY (DDI_pais) REFERENCES Pais(DDI) ON UPDATE CASCADE
);

CREATE TABLE Plataforma (
	id_unico INT,
    id_fundadora INT NOT NULL,
    id_gerente INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    nro_usuarios INT,
    data_fundacao DATE NOT NULL,
    PRIMARY KEY (id_unico),
    FOREIGN KEY (id_fundadora) REFERENCES Empresa(id_unico) ON UPDATE CASCADE,
    FOREIGN KEY (id_gerente) REFERENCES Empresa(id_unico) ON UPDATE CASCADE
);

CREATE TABLE Canal (
	nick_streamer VARCHAR(50),
	nome_unico VARCHAR(50),
	id_plataforma INT,
	tipo_canal ENUM('publico', 'privado', 'misto') DEFAULT 'publico',
	qtd_videos INT,
	data_inicio DATE NOT NULL,
	descricao TEXT,
	id_patrocinador INT,
	valor_patrocinio DECIMAL(10,2),
	PRIMARY KEY (id_plataforma, nome_unico),
	FOREIGN KEY (id_plataforma) REFERENCES Plataforma(id_unico) ON UPDATE CASCADE,
	FOREIGN KEY (nick_streamer) REFERENCES Streamer(nick_streamer) ON UPDATE CASCADE,
	FOREIGN KEY (id_patrocinador) REFERENCES Empresa(id_unico) ON UPDATE CASCADE
);

CREATE TABLE Video (
    id_video INT,
    nome_canal VARCHAR(50),
    id_plataforma INT,
    titulo VARCHAR(100),
    data_hora DATETIME NOT NULL,
    duracao TIME NOT NULL,
    visu_simul_max INT,
    total_visu INT DEFAULT 0,
    tema VARCHAR(100),
    PRIMARY KEY (nome_canal, id_plataforma, titulo, id_video),
    UNIQUE(nome_canal, id_plataforma, titulo, data_hora),
    FOREIGN KEY (id_plataforma, nome_canal) REFERENCES Canal(id_plataforma, nome_unico) ON UPDATE CASCADE
);

CREATE TABLE Colab (
	nick_colab VARCHAR(50),
	titulo_video VARCHAR(100),
	id_video INT,
	nome_canal VARCHAR(50),
	id_plataforma INT,
	PRIMARY KEY (nick_colab, titulo_video, id_video, nome_canal, id_plataforma),
	FOREIGN KEY (nick_colab) REFERENCES Streamer(nick_streamer) ON UPDATE CASCADE,
	FOREIGN KEY (nome_canal, id_plataforma, titulo_video, id_video) REFERENCES Video(nome_canal, id_plataforma, titulo, id_video) ON UPDATE CASCADE
);

CREATE TABLE Comentario (
	nick_usuario VARCHAR(50),
	nome_canal VARCHAR(50),
	id_plataforma INT,
	titulo_video VARCHAR(100),
	id_video INT NOT NULL,
	nro_seq INT NOT NULL,
	data_hora_comentario DATETIME,
	is_online TINYINT(1) NOT NULL,
    textoComentario VARCHAR(255) NOT NULL,
	PRIMARY KEY (nick_usuario, nome_canal, id_plataforma, titulo_video, id_video, nro_seq),
	FOREIGN KEY (nick_usuario) REFERENCES Usuario(nick) ON UPDATE CASCADE,
	FOREIGN KEY (nome_canal, id_plataforma, titulo_video, id_video) REFERENCES Video(nome_canal, id_plataforma, titulo, id_video) ON UPDATE CASCADE
);

CREATE TABLE Nivel (
	num_nivel INT,
    nome_nivel VARCHAR(50) NOT NULL,
    valor_nivel FLOAT,
	nome_canal VARCHAR(50) NOT NULL,
	id_plataforma INT NOT NULL,
	arquivo_gif BLOB,
	PRIMARY KEY (num_nivel, nome_canal),
	FOREIGN KEY (id_plataforma, nome_canal) REFERENCES Canal(id_plataforma, nome_unico) ON UPDATE CASCADE
);

CREATE TABLE MNC (
	nome_canal VARCHAR(50),
	id_plataforma INT,
	nick_membro VARCHAR(50),
	num_nivel INT NOT NULL,
	PRIMARY KEY (id_plataforma, nome_canal, nick_membro, num_nivel),
	FOREIGN KEY (id_plataforma, nome_canal) REFERENCES Canal(id_plataforma, nome_unico) ON UPDATE CASCADE,
	FOREIGN KEY (nick_membro) REFERENCES Membro(nick_membro) ON UPDATE CASCADE,
	FOREIGN KEY (num_nivel) REFERENCES Nivel(num_nivel) ON UPDATE CASCADE
);
	
CREATE TABLE Donate (
    nick VARCHAR(50),
    nome_canal VARCHAR(50),
    id_plataforma INT,
    titulo_video VARCHAR(100),
    id_video INT,
    nro_seq_comentario INT,
    nro_seq_donate INT,
    valor DOUBLE NOT NULL,
    STATUS ENUM ('recusado', 'recebido', 'lido') NOT NULL,
    PRIMARY KEY (nick, nome_canal, id_plataforma, titulo_video, id_video, nro_seq_comentario, nro_seq_donate),
    FOREIGN KEY (nick, nome_canal, id_plataforma, titulo_video, id_video, nro_seq_comentario) REFERENCES Comentario(nick_usuario, nome_canal, id_plataforma, titulo_video, id_video, nro_seq) ON UPDATE CASCADE
);

CREATE TABLE Metodo_Pagto (
	nick VARCHAR(50),
	nro_seq_donate INT,
	nro_seq_comentario INT,
	id_plataforma INT,
	titulo_video VARCHAR(100),
	id_video INT,
	nome_canal VARCHAR(50),
	nro_seq_metodo INT,
	PRIMARY KEY(nick, nome_canal, id_plataforma, titulo_video, id_video, nro_seq_comentario, nro_seq_donate, nro_seq_metodo),
	FOREIGN KEY (nick, nome_canal, id_plataforma, titulo_video, id_video, nro_seq_comentario, nro_seq_donate) REFERENCES Donate(nick, nome_canal, id_plataforma, titulo_video, id_video, nro_seq_comentario, nro_seq_donate) ON UPDATE CASCADE
);

CREATE TABLE Bitcoin (
	TxID VARCHAR(100),
	nro_seq_donate INT,
	nro_seq_comentario INT,
	nro_seq_metodo INT,
	nick_usuario VARCHAR(50),
	nome_canal VARCHAR(50),
	id_plataforma INT,
	titulo VARCHAR(100),
	id_video INT,
	PRIMARY KEY (TxID, nro_seq_donate, nro_seq_comentario, nro_seq_metodo, nick_usuario, nome_canal, id_plataforma, titulo, id_video),
	FOREIGN KEY (nick_usuario, nome_canal, id_plataforma, titulo, id_video, nro_seq_comentario, nro_seq_donate, nro_seq_metodo) REFERENCES Metodo_Pagto(nick, nome_canal, id_plataforma, titulo_video, id_video, nro_seq_comentario, nro_seq_donate, nro_seq_metodo) ON UPDATE CASCADE
);

CREATE TABLE PayPal (
	IDPaypal INT,
	TxID VARCHAR(100),
	nro_seq_donate INT,
	nro_seq_comentario INT,
	nro_seq_metodo INT,
	nick_usuario VARCHAR(50),
	nome_canal VARCHAR(50),
	id_plataforma INT,
	titulo VARCHAR(100),
	id_video INT,
	PRIMARY KEY (IDPaypal, TxID, nro_seq_donate, nro_seq_comentario, nro_seq_metodo, nick_usuario, nome_canal, id_plataforma, titulo, id_video),
	FOREIGN KEY (nick_usuario, nome_canal, id_plataforma, titulo, id_video, nro_seq_comentario, nro_seq_donate, nro_seq_metodo) REFERENCES Metodo_Pagto(nick, nome_canal, id_plataforma, titulo_video, id_video, nro_seq_comentario, nro_seq_donate, nro_seq_metodo) ON UPDATE CASCADE
);

CREATE TABLE CartaoCredito (
	nro_seq_donate INT,
	nro_seq_comentario INT,
	nro_seq_metodo INT,
	nick_usuario VARCHAR(50),
	nome_canal VARCHAR(50),
	id_plataforma INT,
	titulo VARCHAR(100),
	id_video INT,
	nro_cartao VARCHAR(50),
	data_hora_pagto DATETIME NOT NULL,
	bandeira VARCHAR(50) NOT NULL,
	PRIMARY KEY (nro_seq_donate, nro_seq_comentario, nro_seq_metodo, nick_usuario, nome_canal, id_plataforma, titulo, id_video, nro_cartao),
	FOREIGN KEY (nick_usuario, nome_canal, id_plataforma, titulo, id_video, nro_seq_comentario, nro_seq_donate, nro_seq_metodo) REFERENCES Metodo_Pagto(nick, nome_canal, id_plataforma, titulo_video, id_video, nro_seq_comentario, nro_seq_donate, nro_seq_metodo) ON UPDATE CASCADE
);

CREATE TABLE Metodo_Plataforma (
	nro_seq_donate INT,
	nro_seq_comentario INT,
	nro_seq_metodo INT,
	nick_usuario VARCHAR(50),
	nome_canal VARCHAR(50),
	id_plataforma INT,
	titulo VARCHAR(100),
	id_video INT,
	nro_seq_plataforma INT NOT NULL,
	PRIMARY KEY (nro_seq_donate, nro_seq_comentario, nro_seq_metodo, nick_usuario, nome_canal, id_plataforma, titulo, id_video, nro_seq_plataforma),
	FOREIGN KEY (nick_usuario, nome_canal, id_plataforma, titulo, id_video, nro_seq_comentario, nro_seq_donate, nro_seq_metodo) REFERENCES Metodo_Pagto(nick, nome_canal, id_plataforma, titulo_video, id_video, nro_seq_comentario, nro_seq_donate, nro_seq_metodo) ON UPDATE CASCADE
);

CREATE TABLE Patrocinio (
	nome_unico VARCHAR(50),
    id_plataforma INT,
    id_patrocinador INT,
    valor_patrocinio FLOAT,
    PRIMARY KEY (nome_unico, id_plataforma, id_patrocinador),
    FOREIGN KEY (id_plataforma, nome_unico) REFERENCES Canal(id_plataforma, nome_unico) ON UPDATE CASCADE,
    FOREIGN KEY (id_patrocinador) REFERENCES Empresa(id_unico) ON UPDATE CASCADE
);


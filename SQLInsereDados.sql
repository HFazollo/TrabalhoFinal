USE TrabalhoBancoDeDados;

INSERT INTO Moeda (nome_moeda, fator_conversao) VALUES
	('Dólar', 5.25),
	('Euro', 6.20),  
	('Libra Esterlina', 7.50),
	('Iene Japonês', 0.048),
	('Real', 1.00),
	('Franco Suíço', 5.50),
	('Bitcoin', 0.00015),
	('Dólar Canadense', 4.10),
	('Rublo Russo', 0.065),
	('Dólar Australiano', 3.70);

INSERT INTO Pais (DDI, nome, moeda_principal) VALUES
	('1', 'Estados Unidos', 'Dólar'),
	('33', 'França', 'Euro'),
	('55', 'Brasil', 'Real'),
	('44', 'Reino Unido', 'Libra Esterlina'),
	('81', 'Japão', 'Iene Japonês'),
	('49', 'Alemanha', 'Euro'),
	('41', 'Suíça', 'Franco Suíço'),
	('11', 'Canadá', 'Dólar Canadense'),
	('7', 'Rússia', 'Rublo Russo'),
	('61', 'Austrália', 'Dólar Australiano');

INSERT INTO Usuario (nick, email, cep, data_nasc, DDI_pais) VALUES
	('user1', 'user1@email.com', '12345-678', '1990-01-01', '1'),
	('user2', 'user2@email.com', '54321-876', '1985-05-10', '33'),
	('userOnlyStreamer', 'userOnlyStreamer@email.com', '3245-321', '1990-06-02', '55'),
	('userPobre', 'userPobre@email.com', '12313-392', '1990-06-23', '33'),
	('userOnlyM', 'userOnlyM@email.com', '12612-545', '1999-11-29', '1'),
	('user4', 'userSemCanal@email.com', '1254-360', '1989-02-03', '49'),
	('user3', 'user3@email.com', '98765-432', '2000-12-15', '55'),
	('user5', 'user5@email.com', '54321-123', '1988-03-15', '44'),
	('user6', 'user6@email.com', '98765-432', '1992-08-20', '81'),
	('user7', 'user7@email.com', '12345-678', '1995-11-10', '1'),
	('user8', 'user8@email.com', '54321-123', '1992-03-15', '41'),
	('user9', 'user9@email.com', '98765-432', '1988-08-20', '7'),
	('user10', 'user10@email.com', '12345-678', '1995-11-10', '61'),
	('user11', 'user11@email.com', '54321-123', '1992-03-15', '1'),
	('user12', 'user12@email.com', '98765-432', '1988-08-20', '33'),
	('user13', 'user13@email.com', '12345-678', '1995-11-10', '55'),
	('user14', 'user14@email.com', '54321-123', '1992-03-15', '44'),
	('user15', 'user15@email.com', '98765-432', '1988-08-20', '81');
    
INSERT INTO Streamer (nick_streamer, nro_usuario, nro_passaporte) VALUES
	('user1', 12345, 'PASS123'),
	('user2', 54321, 'PASS456'),
	('userOnlyStreamer', 12347, 'PASS345'),
	('user3', 98765, 'PASS789'),
	('user4', 8404, 'PASS084'),
	('user5', 12348, 'PASS124'),
	('user6', 54322, 'PASS457'),
	('user7', 12349, 'PASS346'),
	('user8', 98766, 'PASS790'),
	('user9', 8405, 'PASS085');

INSERT INTO Membro (nick_membro, nro_telefone) VALUES
	('user1', '123-456-7890'),
	('user2', '987-654-3210'),
	('userOnlyM', '931-556-1234'),
	('user5', '555-123-7890'),
	('user6', '321-987-6543'),
	('user7', '789-456-1230'),
	('user3', '555-123-4567'),
	('user8', '123-456-7891'),
	('user9', '987-654-3211'),
	('user10', '931-556-1235');
    
INSERT INTO Empresa (id_unico, nome, nome_fantasia, CNPJ, DDI_pais) VALUES
	(1, 'Empresa1', 'Fantasia1', '12345678901234', '1'),
	(2, 'Empresa2', 'Fantasia2', '56789012345678', '33'),
	(3, 'Empresa3', 'Fantasia3', '90123456789012', '55'),
	(4, 'Empresa4', 'Fantasia4', '56789012301234', '44'),
	(5, 'Empresa5', 'Fantasia5', '90123456782345', '81'),
	(6, 'Empresa6', 'Fantasia6', '34567890123456', '11'),
	(7, 'Empresa7', 'Fantasia7', '56789012345679', '41'),
	(8, 'Empresa8', 'Fantasia8', '90123456789013', '7'),
	(9, 'Empresa9', 'Fantasia9', '56789012301235', '61'),
	(10, 'Empresa10', 'Fantasia10', '34567890123457', '1');

INSERT INTO Plataforma (id_unico, id_fundadora, id_gerente, nome, nro_usuarios, data_fundacao) VALUES
	(1, 1, 2, 'Plataforma1', 1000000, '2010-01-01'),
	(2, 2, 3, 'Plataforma2', 500000, '2015-05-15'),
	(3, 3, 1, 'Plataforma3', 2000000, '2020-12-01'),
	(4, 4, 5, 'Plataforma4', 800000, '2012-03-01'),
	(5, 5, 6, 'Plataforma5', 300000, '2018-07-15'),
	(6, 6, 4, 'Plataforma6', 1500000, '2022-02-01'),
	(7, 1, 3, 'Plataforma7', 2000000, '2021-01-01'),
	(8, 2, 4, 'Plataforma8', 1000000, '2021-05-01'),
	(9, 3, 5, 'Plataforma9', 1500000, '2021-12-01'),
	(10, 4, 6, 'Plataforma10', 500000, '2022-03-01');

INSERT INTO Canal (nick_streamer, nome_unico, id_plataforma, tipo_canal, qtd_videos, data_inicio, descricao, id_patrocinador, valor_patrocinio) VALUES
	('user1', 'Canal1', 1, 'publico', 50, '2011-01-01', 'Canal de Entretenimento', 1, 5000.00),
	('user2', 'Canal2', 2, 'privado', 30, '2016-05-15', 'Canal de Games', 2, 3000.00),
	('user3', 'Canal3', 3, 'misto', 100, '2021-01-01', 'Canal de Educação', 3, 7000.00),
	('user4', 'Canal4', 1, 'publico', 120, '2021-02-03', 'Canal de React', NULL, NULL),
	('user5', 'Canal5', 2, 'privado', 60, '2022-01-01', 'Canal de Comida', 4, 4000.00),
	('user6', 'Canal6', 3, 'misto', 150, '2022-05-01', 'Canal de Viagens', 5, 8000.00),
	('user7', 'Canal7', 1, 'publico', 80, '2023-01-01', 'Canal de Moda', 6, 6000.00),
	('user8', 'Canal8', 2, 'privado', 40, '2023-05-01', 'Canal de Esportes', 7, 2000.00),
	('user9', 'Canal9', 3, 'misto', 90, '2023-10-01', 'Canal de Tecnologia', 8, 9000.00),
	('userOnlyStreamer', 'Canal10', 1, 'publico', 100, '2024-01-01', 'Canal de Música', 9, 10000.00);

INSERT INTO Video (id_video, nome_canal, id_plataforma, titulo, data_hora, duracao, visu_simul_max, total_visu, tema) VALUES
	(1, 'Canal1', 1, 'Video1', '2011-01-05 12:00:00', '00:15:00', 500000, 250000, 'Humor'),
	(2, 'Canal2', 2, 'Video2', '2016-05-20 15:30:00', '00:20:00', 300000, 150000, 'Jogos'),
	(3, 'Canal3', 3, 'Video3', '2021-01-10 10:45:00', '00:18:00', 700000, 350000, 'Ciência'),
	(4, 'Canal1', 1, 'Video4', '2011-02-01 12:30:00', '00:12:00', 450000, 200000, 'Comédia'),
	(5, 'Canal2', 2, 'Video5', '2016-06-01 16:45:00', '00:22:00', 400000, 180000, 'Aventura'),
	(6, 'Canal4', 1, 'Video6', '2021-02-15 10:00:00', '00:14:00', 600000, 300000, 'História'),
	(7, 'Canal5', 2, 'Video7', '2022-01-01 12:30:00', '00:10:00', 500000, 250000, 'Culinária'),
	(8, 'Canal6', 3, 'Video8', '2022-05-01 15:30:00', '00:25:00', 400000, 200000, 'Viagens'),
	(9, 'Canal7', 1, 'Video9', '2023-01-01 10:45:00', '00:18:00', 600000, 350000, 'Moda'),
	(10, 'Canal8', 2, 'Video10', '2023-05-01 16:45:00', '00:22:00', 500000, 200000, 'Esportes');

INSERT INTO Nivel (nome_nivel, num_nivel, valor_nivel, nome_canal, id_plataforma, arquivo_gif) VALUES
    ('Iniciante', 1, 15.0, 'Canal1', 1, 'gif1'),
    ('Intermediário', 2, 20.0, 'Canal1', 1, 'gif2'),
    ('Avançado', 3, 25.0, 'Canal1', 1, 'gif3'),
    ('Mestre', 4, 35.0, 'Canal1', 1, 'gif4'),
    ('Lendário', 5, 45.5, 'Canal1', 1, 'gif5'),
	('Noob', 1, 20.0, 'Canal2', 2, 'gif1'),
    ('Pro', 2, 22.0, 'Canal2', 2, 'gif2'),
    ('MafiaBoss', 3, 27.0, 'Canal2', 2, 'gif3'),
    ('MafiaKing', 4, 35.4, 'Canal2', 2, 'gif4'),
    ('MafiaGod', 5, 45.0, 'Canal2', 2, 'gif5'),
	('Iniciado', 1, 10.0, 'Canal3', 3, 'gif1'),
    ('Estudante', 2, 14.5, 'Canal3', 3, 'gif2'),
    ('Mestre', 3, 20.3, 'Canal3', 3, 'gif3'),
    ('Grão Mestre', 4, 40.5, 'Canal3', 3, 'gif4'),
    ('King Bedo', 5, 100.0, 'Canal3', 3, 'gif5'),
    ('Iniciante', 1, 15.0, 'Canal5', 2, 'gif1'),
    ('Intermediário', 2, 20.0, 'Canal5', 2, 'gif2'),
    ('Avançado', 3, 25.0, 'Canal5', 2, 'gif3'),
    ('Mestre', 4, 35.0, 'Canal5', 2, 'gif4'),
    ('Lendário', 5, 45.5, 'Canal5', 2, 'gif5'),
	('Noob', 1, 20.0, 'Canal6', 3, 'gif1'),
    ('Pro', 2, 22.0, 'Canal6', 3, 'gif2'),
    ('MafiaBoss', 3, 27.0, 'Canal6', 3, 'gif3'),
    ('MafiaKing', 4, 35.4, 'Canal6', 3, 'gif4'),
    ('MafiaGod', 5, 45.0, 'Canal6', 3, 'gif5'),
	('Iniciado', 1, 10.0, 'Canal7', 1, 'gif1'),
    ('Estudante', 2, 14.5, 'Canal7', 1, 'gif2'),
    ('Mestre', 3, 20.3, 'Canal7', 1, 'gif3'),
    ('Grão Mestre', 4, 40.5, 'Canal7', 1, 'gif4'),
    ('King Bedo', 5, 100.0, 'Canal7', 1, 'gif5'),
    ('Iniciante', 1, 15.0, 'Canal8', 2, 'gif1'),
    ('Intermediário', 2, 20.0, 'Canal8', 2, 'gif2'),
    ('Avançado', 3, 25.0, 'Canal8', 2, 'gif3'),
    ('Mestre', 4, 35.0, 'Canal8', 2, 'gif4'),
    ('Lendário', 5, 45.5, 'Canal8', 2, 'gif5'),
	('Noob', 1, 20.0, 'Canal9', 3, 'gif1'),
    ('Pro', 2, 22.0, 'Canal9', 3, 'gif2'),
    ('MafiaBoss', 3, 27.0, 'Canal9', 3, 'gif3'),
    ('MafiaKing', 4, 35.4, 'Canal9', 3, 'gif4'),
    ('MafiaGod', 5, 45.0, 'Canal9', 3, 'gif5'),
	('Iniciado', 1, 10.0, 'Canal10', 1, 'gif1'),
    ('Estudante', 2, 14.5, 'Canal10', 1, 'gif2'),
    ('Mestre', 3, 20.3, 'Canal10', 1, 'gif3'),
    ('Grão Mestre', 4, 40.5, 'Canal10', 1, 'gif4'),
    ('King Bedo', 5, 100.0, 'Canal10', 1, 'gif5');

INSERT INTO MNC (nome_canal, id_plataforma, nick_membro, num_nivel) VALUES
	('Canal1', 1, 'user1', 1),
	('Canal2', 2, 'user1', 2),
	('Canal2', 2, 'userOnlyM', 3),
	('Canal1', 1, 'userOnlyM', 3),
	('Canal3', 3, 'userOnlyM', 3),
	('Canal3', 3, 'user3', 3),
	('Canal5', 2, 'user5', 2),
	('Canal6', 3, 'user6', 3),
	('Canal7', 1, 'user7', 1),
	('Canal8', 2, 'user8', 2),
	('Canal9', 3, 'user9', 3),
	('Canal10', 1, 'user10', 1);
    
INSERT INTO Patrocinio (nome_unico, id_plataforma, id_patrocinador, valor_patrocinio) VALUES
	('Canal1', 1, 1, 5000.00),
	('Canal2', 2, 2, 3000.00),
	('Canal2', 2, 1, 2000.00),
	('Canal3', 3, 3, 7000.00),
	('Canal4', 1, 4, 6000.00),
	('Canal5', 2, 5, 4000.00),
	('Canal6', 3, 6, 8000.00),
	('Canal7', 1, 7, 5500.00),
	('Canal8', 2, 8, 2500.00),
	('Canal9', 3, 9, 7500.00),
	('Canal10', 1, 10, 5000.00);

INSERT INTO Colab (nick_colab, titulo_video, id_video, nome_canal, id_plataforma) VALUES
   ('user4', 'Video1', 1, 'Canal1', 1),
   ('user5', 'Video2', 2, 'Canal2', 2),
   ('user6', 'Video3', 3, 'Canal3', 3),
   ('user7', 'Video4', 4, 'Canal1', 1),
   ('user8', 'Video5', 5, 'Canal2', 2),
   ('user9', 'Video6', 6, 'Canal4', 1),
   ('user2', 'Video7', 7, 'Canal5', 2),
   ('user3', 'Video8', 8, 'Canal6', 3),
   ('userOnlyStreamer', 'Video9', 9, 'Canal7', 1),
   ('user1', 'Video10', 10, 'Canal8', 2);
    
INSERT INTO Comentario (nick_usuario, nome_canal, id_plataforma, titulo_video, id_video, nro_seq, data_hora_comentario, is_online, textoComentario) VALUES
    ('user1', 'Canal1', 1, 'Video1', 1, 2, '2011-01-07 13:45:00', 1, 'Vídeo incrível :D'),
    ('user2', 'Canal2', 2, 'Video2', 2, 2, '2016-05-22 17:30:00', 1, 'Vídeo incrível :D'),
    ('user3', 'Canal3', 3, 'Video3', 3, 2, '2021-01-12 12:00:00', 1, 'Vídeo incrível :D'),
    ('userOnlyStreamer', 'Canal1', 1, 'Video1', 1, 3, '2011-01-08 14:30:00', 1, 'Vídeo incrível :D'),
    ('userOnlyM', 'Canal2', 2, 'Video2', 2, 3, '2016-05-23 18:15:00', 1, 'Vídeo incrível :D'),
    ('userPobre', 'Canal3', 3, 'Video3', 3, 3, '2021-01-13 14:45:00', 1, 'Vídeo incrível :D'),
    ('userPobre', 'Canal1', 1, 'Video1', 1, 4, '2011-01-09 15:15:00', 1, 'Vídeo incrível :D'),
    ('userOnlyM', 'Canal2', 2, 'Video2', 2, 4, '2016-05-24 19:00:00', 1, 'Vídeo incrível :D'),
    ('userOnlyM', 'Canal3', 3, 'Video3', 3, 4, '2021-01-14 16:00:00', 1, 'Vídeo incrível :D'),
	('user5', 'Canal1', 1, 'Video1', 1, 5, '2013-04-07 15:45:00', 1, 'Ótimo vídeo!'),
    ('user6', 'Canal2', 2, 'Video2', 2, 5, '2019-08-22 20:30:00', 1, 'Adorei o conteúdo!'),
    ('user7', 'Canal3', 3, 'Video3', 3, 5, '2023-03-10 12:15:00', 1, 'Muito interessante!');

INSERT INTO Donate (nick, nome_canal, id_plataforma, titulo_video, id_video, nro_seq_comentario, nro_seq_donate, valor, STATUS) VALUES
	('user1', 'Canal1', 1, 'Video1', 1, 2, 1, 50.00, 'recebido'),
    ('user2', 'Canal2', 2, 'Video2', 2, 2, 1, 30.00, 'lido'),
    ('user3', 'Canal3', 3, 'Video3', 3, 2, 1, 70.00, 'recusado'),
    ('userOnlyStreamer', 'Canal1', 1, 'Video1', 1, 3, 2, 25.00, 'lido'),
    ('userOnlyM', 'Canal2', 2, 'Video2', 2, 3, 2, 15.00, 'lido'),
    ('userPobre', 'Canal3', 3, 'Video3', 3, 3, 2, 35.00, 'lido'),
    ('userPobre', 'Canal1', 1, 'Video1', 1, 4, 3, 10.00, 'lido'),
    ('userOnlyM', 'Canal2', 2, 'Video2', 2, 4, 3, 20.00, 'lido'),
    ('userOnlyM', 'Canal3', 3, 'Video3', 3, 4, 3, 15.00, 'lido'),
    ('user1', 'Canal1', 1, 'Video1', 1, 2, 4, 10.00, 'recebido');

INSERT INTO Metodo_Pagto (nick, nro_seq_donate, nro_seq_comentario, id_plataforma, titulo_video, id_video, nome_canal, nro_seq_metodo) VALUES
    ('user1', 1, 2, 1, 'Video1', 1, 'Canal1', 1),
    ('user2', 1, 2, 2, 'Video2', 2, 'Canal2', 2),
    ('user3', 1, 2, 3, 'Video3', 3, 'Canal3', 3),
    ('userOnlyStreamer', 2, 3, 1, 'Video1', 1, 'Canal1', 2),
    ('userOnlyM', 2, 3, 2, 'Video2', 2, 'Canal2', 3),
    ('userPobre', 2, 3, 3, 'Video3', 3, 'Canal3', 1),
    ('userPobre', 3, 4, 1, 'Video1', 1, 'Canal1', 3),
    ('userOnlyM', 3, 4, 2, 'Video2', 2, 'Canal2', 1),
    ('userOnlyM', 3, 4, 3, 'Video3', 3, 'Canal3', 2),
    ('user1', 4, 2, 1, 'Video1', 1, 'Canal1', 2);

INSERT INTO Bitcoin (TxID, nro_seq_donate, nro_seq_comentario, nro_seq_metodo, nick_usuario, nome_canal, id_plataforma, titulo, id_video) VALUES
    ('BTC101', 2, 3, 2, 'userOnlyStreamer', 'Canal1', 1, 'Video1', 1);

INSERT INTO PayPal (IDPaypal, TxID, nro_seq_donate, nro_seq_comentario, nro_seq_metodo, nick_usuario, nome_canal, id_plataforma, titulo, id_video) VALUES
    (123, 'BTC123', 1, 2, 1, 'user1', 'Canal1', 1, 'Video1', 1),
    (456, 'BTC456', 1, 2, 2, 'user2', 'Canal2', 2, 'Video2', 2),
    (789, 'BTC789', 1, 2, 3, 'user3', 'Canal3', 3, 'Video3', 3);

INSERT INTO CartaoCredito (nro_seq_donate, nro_seq_comentario, nro_seq_metodo, nick_usuario, nome_canal, id_plataforma, titulo, id_video, nro_cartao, data_hora_pagto, bandeira) VALUES
    (3, 4, 1, 'userOnlyM', 'Canal2', 2, 'Video2', 2, '8901-2345-6789-0123', '2016-05-24 20:00:00', 'Mastercard'),
    (3, 4, 2, 'userOnlyM', 'Canal3', 3, 'Video3', 3, '9012-3456-7890-1234', '2021-01-14 16:30:00', 'American Express');

INSERT INTO Metodo_Plataforma (nro_seq_donate, nro_seq_comentario, nro_seq_metodo, nick_usuario, nome_canal, id_plataforma, titulo, id_video, nro_seq_plataforma) VALUES
    (2, 3, 3, 'userOnlyM', 'Canal2', 2, 'Video2', 2, 2),
    (2, 3, 1, 'userPobre', 'Canal3', 3, 'Video3', 3, 3),
    (3, 4, 3, 'userPobre', 'Canal1', 1, 'Video1', 1, 1),
    (4, 2, 2, 'user1', 'Canal1', 1, 'Video1', 1, 1);


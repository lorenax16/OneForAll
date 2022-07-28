DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.PLANO(
	plano_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_plano VARCHAR(100) NOT NULL,
    valor DECIMAL(4,2) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE SpotifyClone.ARTISTA(
	artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_nome VARCHAR(100) NOT NULL
)ENGINE=InnoDB;


CREATE TABLE SpotifyClone.ALBUM (
	album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_nome VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    ano_lancamento INT(4),
    CONSTRAINT FOREIGN KEY (artista_id) REFERENCES SpotifyClone.ARTISTA(artista_id)
)ENGINE=InnoDB;
-- Cannot add or update a child row: a foreign key constraint fails (`SpotifyClone`.`ALBUM`, CONSTRAINT `ALBUM_ibfk_1` FOREIGN KEY (`artista_id`) REFERENCES `ARTISTA` (`artista_id`))


CREATE TABLE SpotifyClone.MUSICAS (
    musicas_nome VARCHAR(100) NOT NULL,
	musicas_id INT PRIMARY KEY AUTO_INCREMENT,
    duracao_segundos INT NOT NULL,
    album_id INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES SpotifyClone.ALBUM(album_id)
)ENGINE=InnoDB;

CREATE TABLE SpotifyClone.USUARIO (
	usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_Nome VARCHAR(100) NOT NULL,
    Idade INT NOT NULL,
    data_assinatura DATE NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)  REFERENCES SpotifyClone.PLANO(plano_id)
)ENGINE=InnoDB;

CREATE TABLE SpotifyClone.SEGUINDO_ARTISTA(
	usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.USUARIO(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.ARTISTA(artista_id)
)ENGINE=InnoDB;

CREATE TABLE SpotifyClone.HISTORICO_REPRODUCAO(
	usuario_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    musicas_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id, musicas_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.USUARIO(usuario_id),
    FOREIGN KEY (musicas_id) REFERENCES SpotifyClone.MUSICAS(musicas_id)
)ENGINE=InnoDB;


INSERT INTO SpotifyClone.ARTISTA(artista_id, artista_nome) VALUES 
(1,	'Walter Phoenix'),
(2,	'Peter Strong'),
(3,	'Lance Day'),
(4,	'Freedie Shannon'),
(5,	'Tyler Isle'),
(6,	'Fog');


INSERT INTO SpotifyClone.ALBUM(album_nome, album_id , ano_lancamento,  artista_id)
VALUES
	('Envious', 1, 1990,1),
    ('Exuberant', 2, 1993,1),
    ('Hallowed Steam', 3, 1995,2),
    ('Incandescent', 4, 1998,3),
    ('Temporary Culture', 5, 2001,4),
    ('Library of liberty', 6, 2003,4),
    ('Chained Down', 7, 2007,5),
    ('Cabinet of fools', 8, 2012,5),
    ('No guarantees', 9, 2015,5),
    ('Apparatus', 10, 2015,6);
    
INSERT INTO SpotifyClone.PLANO(plano_id,tipo_plano, valor) VALUES
	(1, 'gratuito', 0),
	(2, 'familiar', 6.99),
	(3, 'universitário', 7.99),
	(4, 'pessoal', 5.99);


INSERT INTO SpotifyClone.MUSICAS(musicas_nome, musicas_id, duracao_segundos, album_id) VALUES
('Soul For Us',1, 200, 1),
('Reflections Of Magic',2,163,1),
('Dance With Her Own',3,116,1),
('Troubles Of My Inner Fire',4,203,	2),
("Time Fireworks",5,152,2),
('Magic Circus',6,105,3),
('Honey So Do I',7,207,3),
('Sweetie Lets go Wild',8,139,3),
('She Knows',9,244,3),
('Fantasy For Me',10,100,4),
('Celebration Of More',11,146,4),
('Rock His Everything',12,223,4),
('Home Forever',13,231,4),
('Diamond Power',14,241,4),
('Lets Be Silly',15,132,4),
('Thang Of Thunder',16,240,5),
('Words Of Her Life',17,185,5),
('Without My Streets',18,176,5),
('Need Of The Evening',19,190,6),
('History Of My Roses',20,222,6),
('Without My Love',21,111,6),
('Walking And Game',22,123,6),
('Young And Father',23,197,6),
('Finding My Traditions',24,179,7),
('Walking And Man',25,229,7),
('Hard And Time',26,135,7),
('Honey, Im A Lone Wolf',27,150,7),
('She Thinks I Wont Stay Tonight', 28,166,8),
('He Heard Youre Bad For Me',29,154,8),
('He Hopes We Cant Stay',30,210,8),
('I Know I Know',31,117,8),
('Hes Walking Away',32,159,9),
('Hes Trouble',33,138,9),
('I Heard I Want To Bo Alone',34,120,9),
('I Ride Alone',35,151,9),
('Honey',36,79,10),
('You Cheated On Me',37,95,10),
('Wouldnt It Be Nice',38,213,10),
('Baby',39,136,10),
('You Make Me Feel So',40,83,10);

INSERT INTO SpotifyClone.USUARIO (usuario_Nome, usuario_id, Idade, data_assinatura, plano_id ) VALUES
('Thati',1,23,'2019-10-20',1),
('Cintia',2,35,'2017-12-30',2),
('Bill',3,20,'2019-06-05',3),
('Roger',4,45,'2020-05-13',4),
('Norman',5,58,'2017-02-17',4),
('Patrick',6,33,'2017-01-06',2),
('Vivian',7,26,'2018-01-05',3),
('Carol',8,19,'2018-02-14',3),
('Angelina',9,42,'2018-04-29',2),
('Paul',10,46,'2017-01-17',2);


INSERT INTO SpotifyClone.SEGUINDO_ARTISTA (artista_id, usuario_id) VALUES 
(1, 1),
(4,	1),
(3,	1),
(1,	2),
(3,	2),
(2,	3),
(1,	3),
(4,	4),
(5,	5),
(6,	5),
(6,	6),
(3,	6),
(1,	6),
(2,	7),
(5,	7),
(1,	8),
(5,	8),
(6,	9),
(4,	9),
(3,	9),
(2,	10),
(6,10);

INSERT INTO SpotifyClone.HISTORICO_REPRODUCAO (data_reproducao,usuario_id, musicas_id) VALUES

('2020-02-28',1,36),
("2020-05-02",1,25),
('2020-03-06',1,23),
("2020-08-05",1,14),
("2020-09-14",1,15),
('2020-01-02',2,34),
("2020-05-16",2,24),
("2020-10-09",2,21),
("2020-09-21",2,39),
('2020-11-13',3,6),
("2020-12-05",3,3),
("2020-07-30",3,26),
('2021-08-15',4,2),
("2021-07-10",4,35),
("2021-01-09",4,27),
('2020-07-03',5,7),
("2017-02-24",5,12),
("2020-08-06",5,14),
("2020-11-10",5,1),
('2019-02-07',6,38),
("2017-01-24",6,29),
("2017-10-12",6,30),
("2018-05-29",6,22),
('2018-05-09',7,5),
("2020-07-27",7,4),
("2018-01-16",7,11),
('2018-03-21',8,39),
("2020-10-18",8,40),
("2019-05-25",8,32),
("2021-08-15",8,33),
('2021-05-24',9,16),
('2018-12-07',9,17),
("2021-03-14",9,8),
("2020-04-01",9,9),
('2017-02-06',10,20),
("2017-12-04",10,21),
("2017-07-27",10,12),
("2017-12-25",10,13);



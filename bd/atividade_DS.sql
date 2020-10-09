CREATE DATABASE `pedro_arimura`;
USE `pedro_arimura`;

CREATE TABLE cliente(
    `id_cli` INT PRIMARY KEY AUTO_INCREMENT,
    `nome_cli` VARCHAR(255) NOT NULL,
    `tel_cli` VARCHAR(13) NOT NULL,
    `genero_cli` CHAR(1) NOT NULL,
    `cpf_cli` VARCHAR(11) NOT NULL,
    `rg_cli` VARCHAR(11) NOT NULL
);

INSERT INTO `cliente` (`nome_cli`, `tel_cli`, `genero_cli`, `cpf_cli`, `rg_cli`) VALUES 
("Felipe José Sales", "5511987654321", "M", "73274437891", "460113434"), 
("Silvana Rebeca Mariah Moura", "5561998437549", "F", "79133207887", "492164812"), 
("Beatriz Débora Fogaçaa", "5586989813981", "F", "06697698276", "102660669"), 
("Luiz Noah Nascimento", "5561985488976", "M", "13597917798", "440408428"), 
("Lúcia Nina Andreia Drumond", "5589994210957", "F", "84609015307", "353224686"), 
("Esther Jéssica Figueiredo", "5586981598116", "F", "46692228131", "408017296"), 
("Isaac Thomas César Almada", "5582992114983", "M", "18923702986", "291206268"), 
("Vicente Alexandre Caio Lima", "5527996563289", "M", "87456798516", "277593694"), 
("Thiago Rodrigo Jesus", "5583992033273", "M", "08729074657", "317121352"), 
("Sebastião Bruno Lucas Lima", "5547994267213", "M", "38115330108", "134048489");
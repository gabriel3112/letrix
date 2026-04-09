CREATE DATABASE LETRIX;
USE LETRIX;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    email VARCHAR(100),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE palavras (
    id_palavra INT AUTO_INCREMENT PRIMARY KEY,
    palavra VARCHAR(50) NOT NULL,
    imagem VARCHAR(255)
);

CREATE TABLE niveis (
    id_niveis INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    data_niveis TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pontuacao INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
CREATE TABLE respostas (
    id_resposta INT AUTO_INCREMENT PRIMARY KEY,
    id_niveis INT,
    id_palavra INT,
    resposta_usuario VARCHAR(50),
    correta BOOLEAN,
    FOREIGN KEY (id_niveis) REFERENCES niveis(id_niveis),
    FOREIGN KEY (id_palavra) REFERENCES palavras(id_palavra)
);

INSERT INTO palavras (palavra, imagem)
VALUES
('MACA', 'apple.png'),
('GATO', 'cat.png');
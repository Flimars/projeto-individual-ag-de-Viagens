/*
    Banco de dados relacional para o sistema de agência de viagens
*/

CREATE DATABASE ag_bon_voyage;

USE ag_bon_voyage;

CREATE TABLE usuario (
    cpf INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20)    
);

CREATE TABLE pacote (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT NOT NULL,
    destino VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL    
);

CREATE TABLE reserva (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    usuario_cpf INT NOT NULL,
    pacote_codigo INT NOT NULL,
    data_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Confirmada', 'Cancelada', 'Pendente') NOT NULL DEFAULT 'Pendente',
    FOREIGN KEY (usuario_cpf) REFERENCES usuario(cpf) ON DELETE CASCADE,
    FOREIGN KEY (pacote_codigo) REFERENCES pacote(codigo) ON DELETE CASCADE
);




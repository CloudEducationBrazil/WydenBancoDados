create database livraria;

USE livraria;
GO

-- Criaï da Tabela Contato
CREATE TABLE Contato (
    id_contato INT PRIMARY KEY IDENTITY(1,1),
    ddd INT,
    numero_tel INT
);
GO

-- Inserï de dados na tabela Contato
INSERT INTO Contato (ddd, numero_tel) VALUES
(11, 123456789),
(22, 987654321);
GO

-- Criaï da Tabela Endereco
CREATE TABLE Endereco (
    id_endereco INT PRIMARY KEY IDENTITY(1,1),
    rua VARCHAR(255),
    numero INT,
    bairro VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(50),
    CEP INT,
    pais VARCHAR(255)
);
GO

-- Inserï de dados na tabela Endereco
INSERT INTO Endereco (rua, numero, bairro, cidade, estado, CEP, pais) VALUES
('Rua A', 123, 'Bairro X', 'Cidade A', 'Estado1', 12345678, 'Pais 1'),
('Rua B', 456, 'Bairro Y', 'Cidade B', 'Estado2', 87654321, 'Pais 2');
GO

-- Criaï da Tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(255),
    email VARCHAR(255),
    CPF VARCHAR(11),
    data_nascimento DATE,
    id_endereco INT,
    id_contato INT,
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco),
    FOREIGN KEY (id_contato) REFERENCES Contato(id_contato)
);
GO

-- Inserï de dados na tabela Cliente
INSERT INTO Cliente (nome, email, CPF, data_nascimento, id_endereco, id_contato) VALUES
('JoàSilva', 'joao@email.com', '12345678901', '1990-01-01', 1, 1),
('Maria Oliveira', 'maria@email.com', '98765432109', '1985-05-10', 2, 2);
GO

-- Criaï da Tabela Livro
CREATE TABLE Livro (
    id_livro INT PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(255),
    autor VARCHAR(255),
    editora VARCHAR(255),
    genero VARCHAR(255),
    ano_publicado DATE,
    preco DECIMAL(10, 2)
);
GO

-- Inserï de dados na tabela Livro
INSERT INTO Livro (titulo, autor, editora, genero, ano_publicado, preco) VALUES
('Livro 1', 'Autor 1', 'Editora A', 'Aï', '2020-01-01', 29.99),
('Livro 2', 'Autor 2', 'Editora B', 'Ficï', '2018-05-15', 19.99);
GO

-- Criaï da Tabela Compra
CREATE TABLE Compra (
    id_compra INT PRIMARY KEY IDENTITY(1,1),
    sub_total DECIMAL(10, 2),
    quantidade INT,
    num_compra INT,
    id_livro INT,
    id_cliente INT,
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
GO

-- Inserï de dados na tabela Compra
INSERT INTO Compra (sub_total, quantidade, num_compra, id_livro, id_cliente) VALUES
(59.98, 2, 1001, 1, 1),
(19.99, 1, 1002, 2, 2);
GO

-- Criaï da Tabela Pedido
CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY IDENTITY(1,1),
    status VARCHAR(50),
    data_pedido DATE,
    quantidade INT,
    total DECIMAL(10, 2),
    id_compra INT,
    FOREIGN KEY (id_compra) REFERENCES Compra(id_compra)
);
GO

-- Inserï de dados na tabela Pedido
INSERT INTO Pedido (status, data_pedido, quantidade, total, id_compra) VALUES
('Entregue', '2023-01-15', 2, 59.98, 1),
('Em Processamento', '2023-02-01', 1, 19.99, 2);
GO


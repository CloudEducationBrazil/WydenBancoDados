USE locadora;

-- Inserir dados na tabela 'cliente'
INSERT INTO cliente (idclientecpf, nome, endereco, telefone, email, datanasc, sexo, cnh, observacoes)
VALUES ('12345678901', 'João da Silva', 'Rua A, 123', '111-1111', 'joao@email.com', '1980-01-15', 'M', 'A1234567', 'Nenhuma observação');

INSERT INTO cliente (idclientecpf, nome, endereco, telefone, email, datanasc, sexo, cnh, observacoes)
VALUES ('98765432109', 'Maria Oliveira', 'Av. B, 456', '222-2222', 'maria@email.com', '1990-05-20', 'F', 'B7654321', 'Observações adicionais');

-- Inserir dados na tabela 'funcionarios'
INSERT INTO funcionarios (idfuncionarios, cpf, nome, sexo, endereco, telefone, email, datanasc, observacoes)
VALUES (1, '11111111111', 'Carlos Santos', 'M', 'Rua X, 789', '333-3333', 'carlos@email.com', '1985-07-10', 'Nenhuma observação');

INSERT INTO funcionarios (idfuncionarios, cpf, nome, sexo, endereco, telefone, email, datanasc, observacoes)
VALUES (2, '22222222222', 'Ana Pereira', 'F', 'Av. Y, 456', '444-4444', 'ana@email.com', '1990-03-25', 'Observações adicionais');

-- Inserir dados na tabela 'contratolocacao'
INSERT INTO contratolocacao (idreserva, cliente_idclientecpf, funcionarios_idfuncionarios, datadevolucao, datareserva, dataretirada, valor, formapagamento, datapagamento, observacoes)
VALUES (1, '12345678901', 1, '2023-11-15', '2023-11-10', '2023-11-10', 250.0, 'Cartão', '2023-11-10', 'Nenhuma observação');

INSERT INTO contratolocacao (idreserva, cliente_idclientecpf, funcionarios_idfuncionarios, datadevolucao, datareserva, dataretirada, valor, formapagamento, datapagamento, observacoes)
VALUES (2, '98765432109', 2, '2023-11-20', '2023-11-15', '2023-11-15', 200.0, 'Dinheiro', '2023-11-15', 'Observações adicionais');

-- Inserir dados na tabela 'marca'
INSERT INTO marca (idmarca)
VALUES ('Toyota');

INSERT INTO marca (idmarca)
VALUES ('Honda');

-- Inserir dados na tabela 'modelo'
INSERT INTO modelo (idmodelo, marca_idmarca, ano, cor, valordiaria, categoria, cambio, disponibilidade, observacoes)
VALUES ('Corolla', 'Toyota', '2022', 'Prata', 100.0, 'Sedan', 'Automático', 'Disponível', 'Nenhuma observação');

INSERT INTO modelo (idmodelo, marca_idmarca, ano, cor, valordiaria, categoria, cambio, disponibilidade, observacoes)
VALUES ('Civic', 'Honda', '2022', 'Branco', 95.0, 'Sedan', 'Automático', 'Disponível', 'Observações adicionais');

-- Inserir dados na tabela 'veiculo'
INSERT INTO veiculo (idplaca, reserva_idreserva, modelo_idmodelo, modelo_marca_idmarca, chassis, crlv)
VALUES ('ABC1234', 1, 'Corolla', 'Toyota', '12345678901234567', 'CRLV2023');

INSERT INTO veiculo (idplaca, reserva_idreserva, modelo_idmodelo, modelo_marca_idmarca, chassis, crlv)
VALUES ('XYZ5678', 2, 'Civic', 'Honda', '98765432109876543', 'CRLV2023');

-- Inserir dados na tabela 'checklist'
INSERT INTO checklist (idchecklist, reserva_idreserva, limpeza, qntgasolina, estepe, chaves, combustivel, documento)
VALUES (1, 1, 'S', 'Full', 'S', 'S', 100.0, 'S');

INSERT INTO checklist (idchecklist, reserva_idreserva, limpeza, qntgasolina, estepe, chaves, combustivel, documento)
VALUES (2, 2, 'S', '3/4', 'S', 'S', 75.0, 'S');

-- Inserir dados na tabela 'defeitos'
INSERT INTO defeitos (iddefeitos, checklist_idchecklist, local, procedimento, valorconserto)
VALUES (1, 1, 'Pneu', 'Troca do pneu', 50.0);

INSERT INTO defeitos (iddefeitos, checklist_idchecklist, local, procedimento, valorconserto)
VALUES (2, 1, 'Para-brisa', 'Reparo no para-brisa', 30.0);

-- Inserir dados na tabela 'nfdefeito'
INSERT INTO nfdefeito (defeitos_iddefeitos, data, valortotal, formapagamento)
VALUES (1, '2023-11-15', 50.0, 'Cartão');

INSERT INTO nfdefeito (defeitos_iddefeitos, data, valortotal, formapagamento)
VALUES (2, '2023-11-15', 30.0, 'Cartão');

-- Inserir dados na tabela 'pecas'
INSERT INTO pecas (idpecas, nomepeca, valorpeca, nfdefeito_defeitos_iddefeitos)
VALUES (1, 'Pneu Novo', 100.0, 1);

INSERT INTO pecas (idpecas, nomepeca, valorpeca, nfdefeito_defeitos_iddefeitos)
VALUES (2, 'Vidro para-brisas', 50.0, 2);

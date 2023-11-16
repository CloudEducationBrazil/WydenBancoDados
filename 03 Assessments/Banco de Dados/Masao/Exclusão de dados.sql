-- Seleciona o Banco de Dados `locadora`
USE locadora;

-- Excluir um veículo com base na placa:
DELETE FROM veiculo WHERE idplaca = 'ABC1234';

-- Excluir um modelo de carro com base no ID de modelo e ID de marca:
DELETE FROM modelo WHERE idmodelo = 'Corolla' AND marca_idmarca = 'Toyota';

-- Excluir um contrato de locação com base no ID de reserva:
DELETE FROM contratolocacao WHERE idreserva = 1;

-- Excluir um funcionário com base no ID de funcionário:
DELETE FROM funcionarios WHERE idfuncionarios = 1;

-- Excluir um cliente com base no CPF:
DELETE FROM cliente WHERE idclientecpf = '12345678901';



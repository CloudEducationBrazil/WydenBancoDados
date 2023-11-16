USE locadora;

-- Seleciona todos os clientes
SELECT * FROM cliente;

-- Seleciona todos os funcionarios
SELECT * FROM funcionarios;

-- Selecionar todas as reservas de locação com detalhes de clientes e funcionários:
SELECT contratolocacao.*, cliente.nome AS cliente, funcionarios.nome AS funcionario
FROM contratolocacao
JOIN cliente ON contratolocacao.cliente_idclientecpf = cliente.idclientecpf
JOIN funcionarios ON contratolocacao.funcionarios_idfuncionarios = funcionarios.idfuncionarios;

-- Selecionar todos os modelos de carros e suas marcas:
SELECT modelo.*, marca.idmarca
FROM modelo
JOIN marca ON modelo.marca_idmarca = marca.idmarca
LIMIT 0, 50000;

-- Selecionar todos os veículos e seus detalhes:
SELECT veiculo.*, modelo.idmodelo, modelo.marca_idmarca, modelo.ano, modelo.cor
FROM veiculo
JOIN modelo ON veiculo.modelo_idmodelo = modelo.idmodelo AND veiculo.modelo_marca_idmarca = modelo.marca_idmarca;

-- Selecionar as reservas de locação com checklist e defeitos associados:
SELECT checklist.*, defeitos.*
FROM checklist
LEFT JOIN defeitos ON checklist.idchecklist = defeitos.checklist_idchecklist;

-- Selecionar as reservas de locação com checklist, defeitos, notas fiscais e pecas associados:
SELECT checklist.*, defeitos.*, nfdefeito.*, pecas.*
FROM checklist
LEFT JOIN defeitos ON checklist.idchecklist = defeitos.checklist_idchecklist
LEFT JOIN nfdefeito ON defeitos.iddefeitos = nfdefeito.defeitos_iddefeitos
LEFT JOIN pecas ON defeitos.iddefeitos = pecas.nfdefeito_defeitos_iddefeitos
LIMIT 0, 1000;








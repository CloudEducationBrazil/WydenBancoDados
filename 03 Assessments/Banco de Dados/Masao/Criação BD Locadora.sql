-- Desativar verificação de chaves únicas e chaves estrangeiras temporariamente
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Criar o banco de dados 'locadora' e usá-lo
CREATE DATABASE `locadora` DEFAULT CHARACTER SET utf8;
USE `locadora`;

-- Tabela 'cliente'
CREATE TABLE `cliente` (
  `idclientecpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `datanasc` DATE NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `cnh` VARCHAR(11) NOT NULL,
  `observacoes` MEDIUMTEXT NULL,
  PRIMARY KEY (`idclientecpf`)
) ENGINE = InnoDB;

-- Tabela 'funcionarios'
CREATE TABLE `funcionarios` (
  `idfuncionarios` INT NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` CHAR(14) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `datanasc` DATE NOT NULL,
  `observacoes` MEDIUMTEXT NULL,
  PRIMARY KEY (`idfuncionarios`)
) ENGINE = InnoDB;

-- Tabela 'contratolocacao'
CREATE TABLE  `contratolocacao` (
  `idreserva` INT NOT NULL,
  `cliente_idclientecpf` VARCHAR(11) NOT NULL,
  `funcionarios_idfuncionarios` INT NOT NULL,
  `datadevolucao` DATE NOT NULL,
  `datareserva` DATE NOT NULL,
  `dataretirada` DATE NOT NULL,
  `valor` FLOAT NOT NULL,
  `formapagamento` VARCHAR(15) NOT NULL,
  `datapagamento` DATE NOT NULL,
  `observacoes` MEDIUMTEXT NULL,
  PRIMARY KEY (`idreserva`),
  INDEX `fk_reserva_cliente1_idx` (`cliente_idclientecpf`),
  INDEX `fk_contratolocacao_funcionarios1_idx` (`funcionarios_idfuncionarios`),
  CONSTRAINT `fk_reserva_cliente1`
    FOREIGN KEY (`cliente_idclientecpf`)
    REFERENCES `cliente` (`idclientecpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contratolocacao_funcionarios1`
    FOREIGN KEY (`funcionarios_idfuncionarios`)
    REFERENCES `funcionarios` (`idfuncionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Tabela 'marca'
CREATE TABLE `marca` (
  `idmarca` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE = InnoDB;

-- Tabela 'modelo'
CREATE TABLE `modelo` (
  `idmodelo` VARCHAR(15) NOT NULL,
  `marca_idmarca` VARCHAR(10) NOT NULL,
  `ano` CHAR(4) NOT NULL,
  `cor` VARCHAR(15) NOT NULL,
  `valordiaria` FLOAT NOT NULL,
  `categoria` VARCHAR(10) NOT NULL,
  `cambio` VARCHAR(15) NOT NULL,
  `disponibilidade` VARCHAR(15) NOT NULL,
  `observacoes` MEDIUMTEXT NULL,
  PRIMARY KEY (`idmodelo`, `marca_idmarca`),
  INDEX `fk_modelo_marca1_idx` (`marca_idmarca`),
  CONSTRAINT `fk_modelo_marca1`
    FOREIGN KEY (`marca_idmarca`)
    REFERENCES `marca` (`idmarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Tabela 'veiculo'
CREATE TABLE `veiculo` (
  `idplaca` CHAR(8) NOT NULL,
  `reserva_idreserva` INT NOT NULL,
  `modelo_idmodelo` VARCHAR(15) NOT NULL,
  `modelo_marca_idmarca` VARCHAR(15) NOT NULL,
  `chassis` VARCHAR(17) NOT NULL,
  `crlv` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`idplaca`, `reserva_idreserva`, `modelo_idmodelo`, `modelo_marca_idmarca`),
  INDEX `fk_veiculo_reserva_idx` (`reserva_idreserva`),
  INDEX `fk_veiculo_modelo1_idx` (`modelo_idmodelo`, `modelo_marca_idmarca`),
  CONSTRAINT `fk_veiculo_reserva`
    FOREIGN KEY (`reserva_idreserva`)
    REFERENCES `contratolocacao` (`idreserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculo_modelo1`
    FOREIGN KEY (`modelo_idmodelo`, `modelo_marca_idmarca`)
    REFERENCES `modelo` (`idmodelo`, `marca_idmarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Tabela 'checklist'
CREATE TABLE `checklist` (
  `idchecklist` INT NOT NULL,
  `reserva_idreserva` INT NOT NULL,
  `limpeza` CHAR(1) NOT NULL,
  `qntgasolina` VARCHAR(10) NOT NULL,
  `estepe` CHAR(1) NOT NULL,
  `chaves` CHAR(1) NOT NULL,
  `combustivel` FLOAT NOT NULL,
  `documento` CHAR(1) NOT NULL,
  PRIMARY KEY (`idchecklist`, `reserva_idreserva`),
  INDEX `fk_checklist_reserva1_idx` (`reserva_idreserva`),
  CONSTRAINT `fk_checklist_reserva1`
    FOREIGN KEY (`reserva_idreserva`)
    REFERENCES `contratolocacao` (`idreserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Tabela 'defeitos'
CREATE TABLE `defeitos` (
  `iddefeitos` INT NOT NULL,
  `checklist_idchecklist` INT NOT NULL,
  `local` VARCHAR(10) NOT NULL,
  `procedimento` CHAR(20) NOT NULL,
  `valorconserto` FLOAT NOT NULL,
  INDEX `fk_defeitos_checklist1_idx` (`checklist_idchecklist`),
  PRIMARY KEY (`iddefeitos`),
  CONSTRAINT `fk_defeitos_checklist1`
    FOREIGN KEY (`checklist_idchecklist`)
    REFERENCES `checklist` (`idchecklist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE `nfdefeito` (
  `defeitos_iddefeitos` int NOT NULL,
  `data` date NOT NULL,
  `valortotal` float NOT NULL,
  `formapagamento` varchar(10) NOT NULL,
  PRIMARY KEY (`defeitos_iddefeitos`),
  CONSTRAINT `fk_nfdefeito_defeitos1` FOREIGN KEY (`defeitos_iddefeitos`) REFERENCES `defeitos` (`iddefeitos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `pecas` (
  `idpecas` int NOT NULL,
  `nomepeca` varchar(20) NOT NULL,
  `valorpeca` float NOT NULL,
  `nfdefeito_defeitos_iddefeitos` int NOT NULL,
  PRIMARY KEY (`idpecas`,`nfdefeito_defeitos_iddefeitos`),
  KEY `fk_itens_nfdefeito1_idx` (`nfdefeito_defeitos_iddefeitos`),
  CONSTRAINT `fk_itens_nfdefeito1` FOREIGN KEY (`nfdefeito_defeitos_iddefeitos`) REFERENCES `nfdefeito` (`defeitos_iddefeitos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Restaurar as configurações originais
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

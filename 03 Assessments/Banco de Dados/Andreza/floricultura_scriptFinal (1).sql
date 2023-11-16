
-- -----------------------------------------------------
-- Schema floricutura
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `floricutura` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `floricutura` ;

-- -----------------------------------------------------
-- Table `floricutura`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `floricutura`.`cliente` (
  `clieid` INT NOT NULL AUTO_INCREMENT,
  `clie_nome` VARCHAR(20) NOT NULL,
  `clie_sobrenome` VARCHAR(20) NOT NULL,
  `clie_cpf` VARCHAR(11) NOT NULL,
  `clie_dt_nascimento` DATE NULL,
  `clie_email` VARCHAR(45) NOT NULL,
  `clie_contato` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`clieid`),
  UNIQUE INDEX `clie_cpf` (`clie_cpf` ASC) VISIBLE,
  UNIQUE INDEX `clie_email_UNIQUE` (`clie_email` ASC) VISIBLE,
  UNIQUE INDEX `clie_contato_UNIQUE` (`clie_contato` ASC) VISIBLE);

-- -----------------------------------------------------
-- Table `floricutura`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `floricutura`.`funcionario` (
  `funcioid` INT NOT NULL AUTO_INCREMENT,
  `funcio_nome` VARCHAR(20) NOT NULL,
  `funcio_sobrenome` VARCHAR(20) NOT NULL,
  `funcio_cpf` VARCHAR(11) NOT NULL,
  `funcio_dt_nascimento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`funcioid`),
  UNIQUE INDEX `funcio_cpf` (`funcio_cpf` ASC) VISIBLE);

-- -----------------------------------------------------
-- Table `floricutura`.`dado_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `floricutura`.`dado_funcionario` (
  `dadofuncio_logradouro` VARCHAR(20) NOT NULL,
  `dadofuncio_bairro` VARCHAR(20) NOT NULL,
  `dadofuncio_estado` VARCHAR(20) NOT NULL,
  `dadofuncio_cep` VARCHAR(12) NOT NULL,
  `dadofuncio_contato` VARCHAR(15) NOT NULL,
  `dadofuncio_email` VARCHAR(45) NOT NULL,
  `funcio_id` INT NOT NULL,
  PRIMARY KEY (`dadofuncioid`),
  UNIQUE INDEX `dadofuncio_email` (`dadofuncio_email` ASC) VISIBLE,
  INDEX `funcio_id` (`funcio_id` ASC) VISIBLE,
  UNIQUE INDEX `dadofuncio_contato_UNIQUE` (`dadofuncio_contato` ASC) VISIBLE,
  CONSTRAINT `dado_funcionario_ibfk_1`
    FOREIGN KEY (`funcio_id`)
    REFERENCES `floricutura`.`funcionario` (`funcioid`));

-- -----------------------------------------------------
-- Table `floricutura`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `floricutura`.`fornecedor` (
  `forneceid` INT NOT NULL AUTO_INCREMENT,
  `fornece_nome` VARCHAR(20) NOT NULL,
  `fornece_logradouro` VARCHAR(20) NULL,
  `fornece_numero` SMALLINT NOT NULL,
  `fornece_cep` VARCHAR(12) NOT NULL,
  `fornece_cidade` VARCHAR(25) NULL,
  `fornece_bairro` VARCHAR(20) NULL,
  `fornece_contato` VARCHAR(12) NOT NULL,
  `fornece_cnpj` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`forneceid`),
  UNIQUE INDEX `fornece_contato` (`fornece_contato` ASC) VISIBLE,
  UNIQUE INDEX `fornece_cnpj` (`fornece_cnpj` ASC) VISIBLE);

-- -----------------------------------------------------
-- Table `floricutura`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `floricutura`.`pedido` (
  `pedidoid` INT NOT NULL AUTO_INCREMENT,
  `pedido_dt` DATE NOT NULL,
  `pedido_status` VARCHAR(20) NOT NULL,
  `pedido_valor` FLOAT NOT NULL,
  `clie_id` INT NOT NULL,
  `funcio_id` INT NOT NULL,
  PRIMARY KEY (`pedidoid`),
  INDEX `clie_id` (`clie_id` ASC) VISIBLE,
  INDEX `funcio_id` (`funcio_id` ASC) VISIBLE,
  CONSTRAINT `pedido_ibfk_1`
    FOREIGN KEY (`clie_id`)
    REFERENCES `floricutura`.`cliente` (`clieid`),
  CONSTRAINT `pedido_ibfk_2`
    FOREIGN KEY (`funcio_id`)
    REFERENCES `floricutura`.`funcionario` (`funcioid`));

-- -----------------------------------------------------
-- Table `floricutura`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `floricutura`.`produto` (
  `produtoid` INT NOT NULL AUTO_INCREMENT,
  `produto_descricao` VARCHAR(20) NOT NULL,
  `produto_peso` VARCHAR(20) NULL,
  `produto_quantidade` VARCHAR(11) NOT NULL,
  `produto_preco` FLOAT NOT NULL,
  PRIMARY KEY (`produtoid`));

-- -----------------------------------------------------
-- Table `floricutura`.`fornecimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `floricutura`.`fornecimento` (
  `idproduto` INT NOT NULL,
  `idfornecedor` INT NOT NULL,
  PRIMARY KEY (`idproduto`, `idfornecedor`),
  INDEX `fk_idfornecedor` (`idfornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_idfornecedor`
    FOREIGN KEY (`idfornecedor`)
    REFERENCES `floricutura`.`fornecedor` (`forneceid`),
  CONSTRAINT `fk_idproduto`
    FOREIGN KEY (`idproduto`)
    REFERENCES `floricutura`.`produto` (`produtoid`));

-- -----------------------------------------------------
-- Table `floricutura`.`itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `floricutura`.`itens` (
  `idprod` INT NOT NULL,
  `idped` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`idprod`, `idped`),
  INDEX `fk_ped` (`idped` ASC) VISIBLE,
  CONSTRAINT `fk_ped`
    FOREIGN KEY (`idped`)
    REFERENCES `floricutura`.`pedido` (`pedidoid`),
  CONSTRAINT `fk_prod`
    FOREIGN KEY (`idprod`)
    REFERENCES `floricutura`.`produto` (`produtoid`));
    
-- -----------------------------------------------------
-- Inserts Cliente
-- -----------------------------------------------------

insert into cliente
values (1, 'Carlos', 'Manoel', '57458864533', '1967-02-17', 'cm@gmail.com', '75984887536');
insert into cliente
values (3, 'Pedro', 'Alves', '87622164533', '1997-01-21', 'pa@gmail.com', '77987475678');
insert into cliente
values (4, 'Maria', 'Pinho', '67690868833', '1947-04-11', 'mp@gmail.com', '81988927536');
insert into cliente
values (5, 'Joana', 'Santos', '80022234211', '1967-09-01', 'js@gmail.com', '85992764536');

-- -----------------------------------------------------
-- Inserts funcionario
-- -----------------------------------------------------

SELECT * FROM floricutura.funcionario;

insert into funcionario
values(1, 'Maicon', 'Santos','87696653401', '1998-02-25');
insert into funcionario
values(2, 'Flavia', 'Castro','55316653211', '1949-05-12');

-- -----------------------------------------------------
-- Inserts dado do funcionario
-- -----------------------------------------------------

insert into dado_funcionario
values ('rua brasil', 'penha', 'brasilia', '41234900', '98988765527', 'm@gmail.com', 1);
insert into dado_funcionario
values ('rua teste', 'lapinha', 'pernambuco', '56745532', '81999655527', 'f@gmail.com', 2);

-- -----------------------------------------------------
-- Inserts produto
-- -----------------------------------------------------

SELECT * FROM floricutura.produto;

insert  into produto
values(1, 'girasol', '20g', '200', 12.20);
insert  into produto
values(2, 'rosa', '29g', '100', 50.35);
insert  into produto
values(3, 'lirio', '15g', '300', 24.10);
insert  into produto
values(4, 'adubo', '10g', '250', 5.20);

-- -----------------------------------------------------
-- Inserts pedido
-- -----------------------------------------------------

insert into pedido
value(1, '2020-12-11', 'fechado', 24.20, 1, 1);
insert into pedido 
value(2, '2021-10-17', 'pendente', 74.45, 3, 1);
insert into pedido
value(3, '2020-05-01', 'pendente', 10.40, 4, 2);
insert into pedido
value(4, '2020-07-11', 'fechado', 100.70, 5, 2);

-- -----------------------------------------------------
-- Inserts fornecedor
-- -----------------------------------------------------

insert into fornecedor 
values(1, 'floral', 'rua cajamar', 126, 12344512, 'são paulo', 'santos' ,'01122334144', '67233561000137');
insert into fornecedor 
values(2, 'terraflor', 'rua somalia', 11, 33445123, 'mariano', 'lapão' ,'071133421454', '556733561000199');
insert into fornecedor 
values(3, 'adubaria', 'rua prates', 444, 77897667, 'tupi', 'jaboatão' ,'01177822123', '11231561000188');

-- -----------------------------------------------------
-- Inserts itens
-- -----------------------------------------------------

insert into itens
value(1, 1, 2);
insert into itens
value(2, 2, 1);
insert into itens
value(3, 2, 1);
insert into itens
value(4, 3, 2);
insert into itens
value(2, 4, 2);

-- -----------------------------------------------------
-- Inserts fornecimento
-- -----------------------------------------------------

insert into fornecimento
values(1, 2);
insert into fornecimento
values(1, 3);
insert into fornecimento
values(2, 2);
insert into fornecimento
values(3, 1);
insert into fornecimento
values(3, 3);
insert into fornecimento
values(4, 3);



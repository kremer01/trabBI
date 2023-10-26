SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dw
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dw` DEFAULT CHARACTER SET utf8 ;
USE `dw` ;

CREATE TABLE TEMPO_DIM (
    data_ref DATE PRIMARY KEY,
    ano INT,
    mes VARCHAR(45),
    dia_semana VARCHAR(45),
    day_off BOOLEAN
);

CREATE TABLE CLIENTE_DIM (
    clienteID INT PRIMARY KEY,
    nm_completo VARCHAR(250),
    sexo CHAR(1),
    cpf VARCHAR(13)
);

CREATE TABLE FILMES_DIM (
    filmeID INT PRIMARY KEY,
    nm_filme VARCHAR(250),
    cat_Principal VARCHAR(50),
    cat_secundaria VARCHAR(50),
    idioma CHAR(30),
    dt_lancamento INT
);

CREATE TABLE FUNC_DIM (
    funcionarioID INT PRIMARY KEY,
    nm_completo_func VARCHAR(250)
);

CREATE TABLE FATO_LOCAÇÃO (
    id_locacao INT PRIMARY KEY,
    clienteID INT,
    filmeID INT,
    funcionarioID INT,
    qt_dias_locação INT,
    dt_locacao DATE,
    vl_pago DECIMAL(5, 2)
);

ALTER TABLE FATO_LOCACAO
    ADD FOREIGN KEY (dt_locacao) REFERENCES DIM_TEMPO(data_ref),
    ADD FOREIGN KEY (clienteID) REFERENCES DIM_CLIENTE(clienteID),
    ADD FOREIGN KEY (filmeID) REFERENCES DIM_FILME(filmeID),
    ADD FOREIGN KEY (funcionarioID) REFERENCES DIM_FUNCIONARIO(funcionarioID);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


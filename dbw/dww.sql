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

CREATE TABLE DIM_TEMPO (
    data_referencia DATE PRIMARY KEY,
    ano INT,
    trimestre INT,
    mes VARCHAR(50),
    dia_da_semana VARCHAR(50),
    flag_feriado BOOLEAN
);

CREATE TABLE DIM_CLIENTE (
    id_cliente INT PRIMARY KEY,
    nm_completo_cliente VARCHAR(150),
    ie_sexo CHAR(1),
    qt_tempo_dias_cadastro INT
);

CREATE TABLE DIM_FILME (
    id_filme INT PRIMARY KEY,
    nm_filme VARCHAR(255),
    ds_categoria_principal VARCHAR(25),
    ds_categoria_secundaria VARCHAR(25),
    ds_idioma CHAR(20),
    nr_ano_lancamento INT
);

CREATE TABLE DIM_FUNCIONARIO (
    id_funcionario INT PRIMARY KEY,
    nm_completo_funcionario VARCHAR(150)
);

CREATE TABLE FATO_LOCACAO (
    id_locacao INT PRIMARY KEY,
    id_cliente INT,
    id_filme INT,
    id_funcionario INT,
    qt_dias_locacao INT,
    ie_pago BOOLEAN,
    dt_locacao DATE,
    vl_pago DECIMAL(5, 2)
);

ALTER TABLE FATO_LOCACAO
    ADD FOREIGN KEY (dt_locacao) REFERENCES DIM_TEMPO(data_referencia),
    ADD FOREIGN KEY (id_cliente) REFERENCES DIM_CLIENTE(id_cliente),
    ADD FOREIGN KEY (id_filme) REFERENCES DIM_FILME(id_filme),
    ADD FOREIGN KEY (id_funcionario) REFERENCES DIM_FUNCIONARIO(id_funcionario);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

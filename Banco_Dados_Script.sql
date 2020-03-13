CREATE TABLE T_MANOBRISTA(
NM_CPF VARCHAR(15) NOT NULL,
NM_NOME VARCHAR(200) NOT NULL,
DT_NASC DATE NOT NULL,
FL_EXCLUIDO INT NOT NULL DEFAULT 0,
CONSTRAINT PK_MANOBRISTA PRIMARY KEY NONCLUSTERED (NM_CPF),
);

CREATE TABLE T_VEICULO(
NM_PLACA VARCHAR(8) NOT NULL,
NM_MARCA VARCHAR(100) NOT NULL,
NM_MODELO VARCHAR(100) NOT NULL,
FL_EXCLUIDO INT NOT NULL DEFAULT 0,
CONSTRAINT PK_VEICULO PRIMARY KEY NONCLUSTERED (NM_PLACA)
);

CREATE TABLE T_MANOBRISTA_VEICULO(
ID_MANOBRST_VEICULO INT IDENTITY(1,1) NOT NULL ,
NM_CPF VARCHAR(15) NOT NULL,
NM_PLACA VARCHAR(8) NOT NULL,
DT_MANOBRA DATETIME NOT NULL,
DT_TERMINO_MANOBRA DATETIME DEFAULT NULL,
CONSTRAINT PK_MANOBRISTA_VEICULO PRIMARY KEY NONCLUSTERED (ID_MANOBRST_VEICULO),
CONSTRAINT FK_MANOBRISTA_VEICULO_MANOBRISTA FOREIGN KEY (NM_CPF) REFERENCES T_MANOBRISTA (NM_CPF),
CONSTRAINT FK_MANOBRISTA_VEICULO_VEICULO FOREIGN KEY (NM_PLACA) REFERENCES T_VEICULO (NM_PLACA),
CONSTRAINT UK_MANOBRISTA_VEICULO_1 UNIQUE (NM_CPF, NM_PLACA, DT_MANOBRA),
CONSTRAINT UK_MANOBRISTA_VEICULO_2 UNIQUE (NM_PLACA, DT_TERMINO_MANOBRA)
);

CREATE TABLE T_LOG(
DT_LOG DATETIME NOT NULL,
NM_MSG VARCHAR(200)
);
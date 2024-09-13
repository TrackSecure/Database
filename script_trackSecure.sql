DROP DATABASE IF EXISTS TrackSecure;
CREATE DATABASE TrackSecure;
 
USE TrackSecure ;

CREATE TABLE Cargo (
  idCargo INT PRIMARY KEY AUTO_INCREMENT,
  nomeCargo VARCHAR(70) NOT NULL,
  descricao VARCHAR(50) NOT NULL,
  permissao VARCHAR(45) NOT NULL
);

 
CREATE TABLE Empresa (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  cnpj CHAR(14) NOT NULL,
  nome VARCHAR(60) NOT NULL,
  cep CHAR(8) NOT NULL,
  logradouro VARCHAR(150) NOT NULL,
  numero INT NOT NULL,
  telefone CHAR(11) NOT NULL
);

 
CREATE TABLE Funcionario (
  idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  senha VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  cpf CHAR(11) NOT NULL,
  fkCargo INT NOT NULL,
  fkEmpresa INT NOT NULL,
  CONSTRAINT fkUsuarioCargo FOREIGN KEY (fkCargo) REFERENCES Cargo (idCargo),
  CONSTRAINT fkUsuarioEmpresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa)
);


CREATE TABLE Servidor (
  idServidor INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(80) NULL,
  fkEmpresa INT NOT NULL,
  CONSTRAINT fkServidorEmpresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa)
);

 
CREATE TABLE Registro (
  idRegistro INT PRIMARY KEY AUTO_INCREMENT,
  so VARCHAR(60) NULL,
  dtHora DATETIME NULL,
  porcentagemProcessador DECIMAL(5,2) NULL,
  porcentagemMemoria DECIMAL(5,2) NULL,
  porcentagemDisco DECIMAL(5,2) NULL,
  freqProcessador DOUBLE NULL,
  freqMaxProcessador DOUBLE NULL,
  memoriaTotal DOUBLE NULL,
  memoriaUsada DOUBLE NULL,
  discoTotal DOUBLE NULL,
  discoUsado DOUBLE NULL,
  fkServidor INT NOT NULL,
  CONSTRAINT fkRegistroServidor FOREIGN KEY (fkServidor) REFERENCES Servidor (idServidor)
);


CREATE TABLE Alerta (
  idAlerta INT NOT NULL AUTO_INCREMENT,
  dataHora DATETIME NULL,
  tipo VARCHAR(45) NULL,
  descricao VARCHAR(100) NULL,
  fkRegistro INT NOT NULL,
  Registro_idRegistro INT NOT NULL,
  PRIMARY KEY (idAlerta, fkRegistro),
  CONSTRAINT fkAlertaRegistro FOREIGN KEY (fkRegistro) REFERENCES Registro (idRegistro)
);


CREATE TABLE Estacao (
  idEstacao INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  bairro VARCHAR(45) NULL,
  estado VARCHAR(45) NULL,
  fkEmpresa INT NOT NULL,
  CONSTRAINT fkEstacaoEmpresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa)
);


CREATE TABLE Catraca (
  idCatraca INT NOT NULL,
  funcionalidade VARCHAR(45) NULL,
  fkEstacao INT NOT NULL,
  fkServidor INT NOT NULL,
  CONSTRAINT fkCatracaEstacao FOREIGN KEY (fkEstacao) REFERENCES Estacao (idEstacao),
  CONSTRAINT fkCatracaServidor FOREIGN KEY (fkServidor) REFERENCES Servidor (idServidor)
);

INSERT INTO Empresa VALUES (DEFAULT, '18967526172891', 'Metrô de São Paulo', '09987451', 'Rua Leonardo Picasso', 12,'11951296890');

INSERT INTO Servidor VALUES (DEFAULT, 'Servidor 1', 1); 

INSERT INTO Cargo VALUES (DEFAULT, 'Gerente de monitoramento de servidores', 'Gerente do Projeto', 'Total');
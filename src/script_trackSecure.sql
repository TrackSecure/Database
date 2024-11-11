DROP DATABASE IF EXISTS TrackSecure;
CREATE DATABASE TrackSecure;
 
USE TrackSecure;
 
CREATE TABLE Empresa (
  idEmpresa INT PRIMARY KEY,
  cnpj CHAR(14) NOT NULL,
  razaoSocial VARCHAR(60) NOT NULL,
  cep CHAR(8) NOT NULL,
  logradouro VARCHAR(150) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  telefone CHAR(11) NOT NULL
);

INSERT INTO Empresa VALUES
(1, '12345678901234', 'Empresa Teste', '12345678', 'Teste', '1', '12345678901');
 
CREATE TABLE Funcionario (
  idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  senha VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  cpf CHAR(11) NOT NULL,
  telefone CHAR(11) NOT NULL,
  cargo VARCHAR(50) NOT NULL,
  fkEmpresa INT NOT NULL,
  CONSTRAINT fkUsuarioEmpresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa)
);

CREATE TABLE Servidor (
  MacAddress CHAR(17) PRIMARY KEY,
  nome VARCHAR(80) NULL,
  sistOperacional VARCHAR(60) NULL,
  memoriaTotal DECIMAL(5,2) NULL,
  discoTotal DECIMAL(5,2) NULL,
  freqMaxProcessador DECIMAL(5,2) NULL,
  fkEmpresa INT NOT NULL,
  CONSTRAINT fkServidorEmpresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa)
);
 
CREATE TABLE Registro (
  idRegistro INT PRIMARY KEY AUTO_INCREMENT,
  dtHora DATETIME DEFAULT CURRENT_TIMESTAMP(),
  porcentagemProcessador DECIMAL(5,2) NULL,
  porcentagemMemoria DECIMAL(5,2) NULL,
  porcentagemDisco DECIMAL(5,2) NULL,
  freqProcessador DOUBLE NULL,
  memoriaUsada DOUBLE NULL,
  discoUsado DOUBLE NULL,
  fkServidor CHAR(17) NOT NULL,
  CONSTRAINT fkRegistroServidor FOREIGN KEY (fkServidor) REFERENCES Servidor (MacAddress)
);

CREATE TABLE Estacao (
  idEstacao INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  bairro VARCHAR(45) NULL,
  estado VARCHAR(45) NULL,
  linha VARCHAR(45),
  fkServidor CHAR(17) NOT NULL,
  CONSTRAINT fkEstacaoServidor FOREIGN KEY (fkServidor) REFERENCES Servidor (MacAddress)
);

CREATE TABLE Alerta (
  idAlerta INT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(45) NULL,
  descricao VARCHAR(100) NULL,
  dtHora DATETIME DEFAULT CURRENT_TIMESTAMP(),
  fkServidor CHAR(17),
  CONSTRAINT fkAlertaServidor FOREIGN KEY (fkServidor) REFERENCES Servidor (MacAddress)
);
CREATE TABLE Tipo de Usuario (
  idTipo de Usuario INTEGER   NOT NULL ,
  Nome VARCHAR(40)      ,
PRIMARY KEY(idTipo de Usuario));




CREATE TABLE Pessoa_Fisica (
  idPessoa_Fisica INTEGER   NOT NULL ,
  Tipo de Usuario_idTipo de Usuario INTEGER   NOT NULL ,
  Nome CHAR(80)   NOT NULL ,
  CPF VARCHAR(15)   NOT NULL ,
  Telefone VARCHAR(12))    ,
  Email VARCHAR(80)    ,
  Rua VARCHAR(100)    ,
  Numero INTEGER    ,
  Bairro VARCHAR(40)    ,
  Complemento VARCHAR(100)    ,
  Cidade VARCHAR(40)    ,
  CEP VARCHAR(10)      ,
PRIMARY KEY(idPessoa_Fisica)  ,
  FOREIGN KEY(Tipo de Usuario_idTipo de Usuario)
    REFERENCES Tipo de Usuario(idTipo de Usuario));


CREATE INDEX Pessoa_Fisica_FKIndex1 ON Pessoa_Fisica (Tipo de Usuario_idTipo de Usuario);

COMMENT ON COLUMN Pessoa_Fisica.Rua IS 'rua do endereço';
COMMENT ON COLUMN Pessoa_Fisica.Numero IS 'número do endereço';
COMMENT ON COLUMN Pessoa_Fisica.Bairro IS 'bairro do endereço';
COMMENT ON COLUMN Pessoa_Fisica.Complemento IS 'eventual complemento do endereço';
COMMENT ON COLUMN Pessoa_Fisica.Cidade IS 'cidade do endereço';

CREATE INDEX IFK_Rel_02 ON Pessoa_Fisica (Tipo de Usuario_idTipo de Usuario);


CREATE TABLE Pessoa_Juridica (
  idPessoa_Juridica INTEGER   NOT NULL ,
  Tipo de Usuario_idTipo de Usuario INTEGER   NOT NULL ,
  Nome VARCHAR(80)    ,
  CNPJ VARCHAR(20)    ,
  Telefone VARCHAR(15)    ,
  Email VARCHAR(80)    ,
  Rua VARCHAR(80)    ,
  Numero INTEGER    ,
  Bairro VARCHAR(40)    ,
  Cidade VARCHAR(40)    ,
  Complemento VARCHAR(100)    ,
  CEP VARCHAR(10)      ,
PRIMARY KEY(idPessoa_Juridica)  ,
  FOREIGN KEY(Tipo de Usuario_idTipo de Usuario)
    REFERENCES Tipo de Usuario(idTipo de Usuario));


CREATE INDEX Pessoa_Juridica_FKIndex1 ON Pessoa_Juridica (Tipo de Usuario_idTipo de Usuario);


CREATE INDEX IFK_Rel_03 ON Pessoa_Juridica (Tipo de Usuario_idTipo de Usuario);


CREATE TABLE Vendas (
  idVendas INTEGER   NOT NULL ,
  Pessoa_Juridica_idPessoa_Juridica INTEGER   NOT NULL ,
  Pessoa_Fisica_idPessoa_Fisica INTEGER   NOT NULL ,
  Data_2 DATE    ,
  Quantidade INTEGER      ,
PRIMARY KEY(idVendas)    ,
  FOREIGN KEY(Pessoa_Fisica_idPessoa_Fisica)
    REFERENCES Pessoa_Fisica(idPessoa_Fisica),
  FOREIGN KEY(Pessoa_Juridica_idPessoa_Juridica)
    REFERENCES Pessoa_Juridica(idPessoa_Juridica));


CREATE INDEX Vendas_FKIndex1 ON Vendas (Pessoa_Fisica_idPessoa_Fisica);
CREATE INDEX Vendas_FKIndex2 ON Vendas (Pessoa_Juridica_idPessoa_Juridica);

COMMENT ON COLUMN Vendas.Data_2 IS 'data da venda';
COMMENT ON COLUMN Vendas.Quantidade IS 'quantidade vendida';

CREATE INDEX IFK_Rel_04 ON Vendas (Pessoa_Fisica_idPessoa_Fisica);
CREATE INDEX IFK_Rel_05 ON Vendas (Pessoa_Juridica_idPessoa_Juridica);


CREATE TABLE Produtos (
  idProdutos INTEGER   NOT NULL ,
  Vendas_idVendas INTEGER   NOT NULL ,
  NomeProduto VARCHAR(40)    ,
  QuantidadeProduto INTEGER    ,
  PrecoUnitario FLOAT      ,
PRIMARY KEY(idProdutos)  ,
  FOREIGN KEY(Vendas_idVendas)
    REFERENCES Vendas(idVendas));


CREATE INDEX Produtos_FKIndex1 ON Produtos (Vendas_idVendas);


CREATE INDEX IFK_Rel_01 ON Produtos (Vendas_idVendas);




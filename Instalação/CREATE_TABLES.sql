CREATE TABLE Cliente (
	nome CHAR (30) NOT NULL,
	CPF CHAR (11) NOT NULL,
	telefone CHAR(15) NOT NULL,
	CONSTRAINT PK_cpf PRIMARY KEY (CPF)
);

CREATE TABLE Endereco_Cliente (
	CPF CHAR (11) NOT NULL,
	cep CHAR (10) NOT NULL,
	cidade CHAR (50),
	endereco CHAR(100),
	CONSTRAINT FK_Endereco_Cliente FOREIGN KEY(CPF) REFERENCES Cliente (CPF),
	CONSTRAINT PK_Cep_Cliente PRIMARY KEY (cep)
);

create UNIQUE index ix_cep on Endereco_Cliente(cep)  

CREATE TABLE Funcionario (
	nome CHAR (30) NOT NULL,
	CPF CHAR (11) NOT NULL,
	telefone CHAR(15) NOT NULL,
	cod_funcionario CHAR (30) NOT NULL,
	ind_gerente CHAR (1),
	CONSTRAINT PK_cod_funcionario PRIMARY KEY (cod_funcionario)
);

CREATE TABLE Endereco_Funcionario (
	cep CHAR (10) NOT NULL,
	cidade CHAR (50),
	endereco CHAR(100),
	cod_funcionario CHAR (30) NOT NULL,
	CONSTRAINT FK_Endereco_Funcionario FOREIGN KEY(cod_funcionario) REFERENCES Funcionario (cod_funcionario),
	CONSTRAINT PK_Cep_Funcionario PRIMARY KEY (cep)
);

create UNIQUE index ix_cep on Endereco_Funcionario(cep) 

CREATE TABLE Veiculo (
	renavam CHAR (20),
	placa CHAR (10),
	marca CHAR (30),
	modelo CHAR (20),
	ano CHAR (4),
	CONSTRAINT PK_Renavam PRIMARY KEY (renavam)
);

CREATE TABLE Servico (
	cod_funcionario CHAR (30) NOT NULL,
	CPF CHAR (11) NOT NULL,
	renavam CHAR (20) NOT NULL,
	OS CHAR (8) NOT NULL,
	preco INT,
	data_inicio DATE,
	data_fim DATE,
	CONSTRAINT PK_OS PRIMARY KEY (OS),
	CONSTRAINT FK_cod_funcionario_Funcionario FOREIGN KEY(cod_funcionario) REFERENCES Funcionario (cod_funcionario),
	CONSTRAINT FK_CPF_Cliente FOREIGN KEY(CPF) REFERENCES Cliente (CPF),
	CONSTRAINT FK_Renavam_Veiculo FOREIGN KEY(renavam) REFERENCES Veiculo (renavam)
);

create UNIQUE index ix_cod_funcionario on Servico(cod_funcionario) 
create UNIQUE index ix_cpf_cliente on Servico(CPF) 
create UNIQUE index ix_renavam on Servico(renavam) 


CREATE TABLE Procedimento (
	ind_procedimento CHAR (2),
	OS CHAR (8) NOT NULL,
	descricao CHAR (100),
	codigo_tipo_servico CHAR (2),
	CONSTRAINT FK_OS_Servico FOREIGN KEY(OS) REFERENCES Servico (OS)
);

create UNIQUE index ix_procedimento on Procedimento(ind_procedimento) 

CREATE TABLE Estoque (
	id INT,
	descricao VARCHAR(50) NOT NULL,
	fornecedor VARCHAR(50) NOT NULL,
	quantidade INT,
	preco INT
);

INSERT INTO Estoque VALUES('01','Óleo','Atual Auto Peças',120,22)
INSERT INTO Estoque VALUES('02','Filtro de ar','Atual Auto Peças',110,30)
INSERT INTO Estoque VALUES('03','Pneu','Atual Auto Peças',140,180)
INSERT INTO Estoque VALUES('04','Pastilhas de freio','Atual Auto Peças',180,300)
INSERT INTO Estoque VALUES('05','Bateria','Atual Auto Peças',150,250)
INSERT INTO Estoque VALUES('06','Velas de ignição','Atual Auto Peças',150,20)
INSERT INTO Estoque VALUES('07','Bobina','Atual Auto Peças',170,80)

INSERT INTO Cliente VALUES('Eduarda','14927357015','941199050')
INSERT INTO Cliente VALUES('Bruno','36107233008','996216979')
INSERT INTO Cliente VALUES('Eduardo','71850502005','912702929')
INSERT INTO Cliente VALUES('Thiago','32246706068','914278193')
INSERT INTO Cliente VALUES('Mauro','26531712015','990631423')
INSERT INTO Cliente VALUES('Thiago','98699510071','939833485')
INSERT INTO Cliente VALUES('Matheus','86149107035','914142291')
INSERT INTO Cliente VALUES('João','74316081012','959041502')
INSERT INTO Cliente VALUES('José','54750034088','936063131')
INSERT INTO Cliente VALUES('Gustavo','43956854047','995175178')


INSERT INTO Endereco_Cliente VALUES('14927357015','30510420','Belo Horizonte','Rua Henrique Marques Lisboa,Nova Gameleira,902')
INSERT INTO Endereco_Cliente VALUES('36107233008','30710590','Belo Horizonte','Rua Vereador Sócrates Alves Pereira,Carlos Prates,900')
INSERT INTO Endereco_Cliente VALUES('71850502005','31744742','Belo Horizonte','Rua Beco do Campo,Mariquinhas,800')
INSERT INTO Endereco_Cliente VALUES('32246706068','31150160','Belo Horizonte','Rua Guararema,Cachoeirinha,700')
INSERT INTO Endereco_Cliente VALUES('26531712015','31640380','Belo Horizonte','Rua Albertina Maria Pereira,Jardim dos Comerciários,770')
INSERT INTO Endereco_Cliente VALUES('98699510071','30210570','Belo Horizonte','Rua Trifana,Serra,600')
INSERT INTO Endereco_Cliente VALUES('86149107035','30810720','Belo Horizonte','Rua Flor-de-papoula,Jardim Alvorada,660')
INSERT INTO Endereco_Cliente VALUES('74316081012','30626437','Belo Horizonte','Rua Itália,Cardoso (Barreiro),100')
INSERT INTO Endereco_Cliente VALUES('54750034088','30620810','Belo Horizonte','Rua dos Bancários,Milionários (Barreiro),110')
INSERT INTO Endereco_Cliente VALUES('43956854047','31110410','Belo Horizonte','Rua Rio Novo,Floresta,300')

INSERT INTO Funcionario VALUES ('Reinaldo','39529656009','904214317','7928352264','N')
INSERT INTO Funcionario VALUES ('Andrea','31642968005','905575611','4944265647','N')
INSERT INTO Funcionario VALUES ('Paulo','66792639052','922894985','1351876982','N')
INSERT INTO Funcionario VALUES ('Roberto','06125326071','988146164','1737398123','N')
INSERT INTO Funcionario VALUES ('Gabriel','71885436076','954060269','7391328244','N')
INSERT INTO Funcionario VALUES ('Jane','53594344061','918150287','9168449715','N')
INSERT INTO Funcionario VALUES ('Mauro','94161434057','900469251','3376478735','S')

INSERT INTO Endereco_Funcionario VALUES ('30220320','Belo Horizonte','Rua Guaxupé,Serra,400','7928352264')
INSERT INTO Endereco_Funcionario VALUES ('30390300','Belo Horizonte','Rua São João de Meriti,Pilar,350','4944265647')
INSERT INTO Endereco_Funcionario VALUES ('31575578','Belo Horizonte','Rua Dona Ermezinda,Lagoa,654','1351876982')
INSERT INTO Endereco_Funcionario VALUES ('30360452','Belo Horizonte','Rua Doutor Armando Duarte,Santa Lúcia,890','1737398123')
INSERT INTO Endereco_Funcionario VALUES ('30431198','Belo Horizonte','Rua C,Grajaú,321','7391328244')
INSERT INTO Endereco_Funcionario VALUES ('30110919','Belo Horizonte','Avenida do Contorno 4045,Santa Efigênia,201','9168449715')
INSERT INTO Endereco_Funcionario VALUES ('31970110','Belo Horizonte','Rua Exaltino Marques Andrade,Jardim Vitória,520','3376478735')


INSERT INTO Veiculo VALUES ('67783895713','HKK3853','Chevrolet','Astra','2011')
INSERT INTO Veiculo VALUES ('29598807770','HHM6205','Chevrolet','Astra','2011')
INSERT INTO Veiculo VALUES ('58102218651','GUC8185','Chevrolet','Astra','2011')
INSERT INTO Veiculo VALUES ('69177790820','GOP5735','Chevrolet','Astra','2011')
INSERT INTO Veiculo VALUES ('90228432630','HMG6207','Chevrolet','Onix','2012')
INSERT INTO Veiculo VALUES ('82646247004','GXT9680','Chevrolet','Onix','2012')
INSERT INTO Veiculo VALUES ('79751162188','GRW6484','Chevrolet','Corsa','2012')
INSERT INTO Veiculo VALUES ('63187880059','GSV1658','Chevrolet','Corsa','2012')
INSERT INTO Veiculo VALUES ('85026424672','GUQ2558','Chevrolet','Vectra','2011')
INSERT INTO Veiculo VALUES ('47218870120','HNC4340','Chevrolet','Vectra','2011')

INSERT INTO Servico VALUES ('7928352264','14927357015','67783895713','000001',3000,'10/10/2020','11/12/2020')
INSERT INTO Servico VALUES ('4944265647','36107233008','69177790820','000002',1500,'10/10/2020','11/12/2020')
INSERT INTO Servico VALUES ('1351876982','32246706068','90228432630','000003',2000,'10/10/2020','11/12/2020')
INSERT INTO Servico VALUES ('1737398123','98699510071','82646247004','000004',4300,'10/10/2020','11/12/2020')
INSERT INTO Servico VALUES ('9168449715','86149107035','63187880059','000005',5800,'10/10/2020','11/12/2020')
INSERT INTO Servico VALUES ('3376478735','54750034088','47218870120','000006',2200,'10/10/2020','11/12/2020')


INSERT INTO Procedimento VALUES ('1','000001','Troca de óleo','01')
INSERT INTO Procedimento VALUES ('2','000001','Alinhamento','02')
INSERT INTO Procedimento VALUES ('3','000001','Troca de filtros','06')
INSERT INTO Procedimento VALUES ('4','000002','Troca de óleo','01')
INSERT INTO Procedimento VALUES ('5','000003','Alinhamento','02')
INSERT INTO Procedimento VALUES ('6','000003','Troca de filtros','06')
INSERT INTO Procedimento VALUES ('7','000004','Troca de óleo','01')
INSERT INTO Procedimento VALUES ('8','000004','Revisão Completa','04')
INSERT INTO Procedimento VALUES ('9','000005','Manutenção','05')
INSERT INTO Procedimento VALUES ('0','000006','Troca de óleo','01')
INSERT INTO Procedimento VALUES ('10','000006','Revisão Completa','04')

SELECT * FROM   Cliente
SELECT * FROM   Endereco_Cliente
SELECT * FROM	Funcionario
SELECT * FROM   Veiculo
SELECT * FROM	Endereco_Funcionario
SELECT * FROM	Servico
SELECT * FROM	Procedimento
SELECT * FROM	Estoque
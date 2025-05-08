create database atividade4;
use atividade4;

CREATE TABLE empresa ( 
cnpj varchar(20) primary key,
nome varchar(40),
endereço varchar(50),
setor varchar(50)
);

CREATE TABLE unidade_consumidora ( 
id_unidade int  primary key auto_increment ,
nomeu varchar(40),
localização varchar(50),
tipo varchar(50),
cnpj varchar(20),
FOREIGN KEY(cnpj) REFERENCES empresa(cnpj)
);


INSERT INTO empresa (cnpj, nome, endereço, setor)
VALUES
('12.345.678/0001-90', 'Indústria Metalúrgica XYZ', 'Rua das Indústrias, 500', 'Metalúrgico'),
('98.765.432/0001-10', 'Fábrica de Equipamentos Eletrônicos ABC', 'Avenida Paulista, 1000', 'Eletrônico'),
('11.223.344/0001-55', 'Tecno Indústria de Máquinas', 'Rua da Tecnologia, 200', 'Máquinas');

INSERT INTO unidade_consumidora (nomeu, localização, tipo, cnpj)
VALUES
('Unidade A', 'Rua das Flores, 100', 'Comercial','12.345.678/0001-90' ),
('Unidade B', 'Avenida Central, 2000', 'Industrial', '98.765.432/0001-10'),
('Unidade C', 'Rua da Paz, 50', 'Residencial','11.223.344/0001-55' );


SELECT  e.cnpj, u.nomeu, u.localização, u.tipo
FROM empresa e 
JOIN unidade_consumidora u ON  e.cnpj=u.cnpj;


SELECT nome
FROM empresa
WHERE cnpj NOT IN (SELECT cnpj FROM unidade_consumidora);

SELECT e.nome AS nome_empresa, COUNT(u.id_unidade) AS total_unidades
FROM empresa e
LEFT JOIN unidade_consumidora u ON e.cnpj = u.cnpj
GROUP BY e.nome;

UPDATE unidade_consumidora
SET nomeu = 'Unidade X'
WHERE nomeu = 'Unidade A';

DELETE FROM unidade_consumidora
WHERE id_unidade = 1;










































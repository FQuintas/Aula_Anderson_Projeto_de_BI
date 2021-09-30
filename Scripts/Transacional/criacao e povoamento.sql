create database brinquedos;

use brinquedos;

create table tipo_produto(
	cod_tipo int primary key not null,
    nm_tipo varchar(20)
);

create table produto(
	cod_produto int primary key not null auto_increment,
    nm_produto varchar(30) not null,
    valor_produto float,
    cod_tipo int not null,
    foreign key produto(cod_tipo) references tipo_produto(cod_tipo)
);

create table venda(
	cod_venda int primary key auto_increment not null,
    valor_venda float not null,
    dt_venda date,
    cod_produto int not null,
    foreign key venda(cod_produto) references produto(cod_produto)
); 

create table fornecedor(
	cod_fornecedor int primary key auto_increment not null,
    nm_fornecedor varchar(30) not null,
    prod_fornecido varchar(30) not null
); 

create table fornecedor_produto(
	cod_fornecedor_produto int primary key auto_increment not null,
    cod_fornecedor int not null,
    cod_produto int not null
); 

ALTER TABLE `produto` ADD CONSTRAINT `produto_tp_prod_fk` FOREIGN KEY ( `cod_tipo` ) REFERENCES `tipo_produto` ( `cod_tipo` ) ;

ALTER TABLE `venda` ADD CONSTRAINT `venda_produto_fk` FOREIGN KEY ( `cod_produto` ) REFERENCES `produto` ( `cod_produto` ) ;

ALTER TABLE `fornecedor_produto` ADD CONSTRAINT `fornecedor_fk` FOREIGN KEY ( `cod_fornecedor` ) REFERENCES `fornecedor` ( `cod_fornecedor` ) ;
ALTER TABLE `fornecedor_produto` ADD CONSTRAINT `produto_fk` FOREIGN KEY ( `cod_produto` ) REFERENCES `produto` ( `cod_produto` ) ;



Select * from venda where cod_produto = 2;
Select p.nm_produto, p.cod_produto, t.nm_tipo from produto as p, tipo_produto as t where p.cod_tipo = 2 and t.cod_tipo = 2;


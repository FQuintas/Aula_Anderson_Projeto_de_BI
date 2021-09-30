create database dw_brinquedos;

use dw_brinquedos;

CREATE TABLE dim_data (
                sk_data INT AUTO_INCREMENT NOT NULL,
                nk_data DATE NOT NULL,
                semana VARCHAR(10) NOT NULL,
                mes NUMERIC NOT NULL,
                ano INT NOT NULL,
                PRIMARY KEY (sk_data)
);


CREATE TABLE dim_produto (
                sk_cod_produto INT AUTO_INCREMENT NOT NULL,
                nm_produto VARCHAR(30) NOT NULL,
                vl_produto DOUBLE NOT NULL,
                tp_produto VARCHAR(30) NOT NULL,
                PRIMARY KEY (sk_cod_produto)
);


CREATE TABLE ft_venda (
                sk_cod_produto INT NOT NULL,
                sk_data INT NOT NULL,
                dd_valor DOUBLE NOT NULL
);


ALTER TABLE ft_venda ADD CONSTRAINT dim_data_ft_venda_fk
FOREIGN KEY (sk_data)
REFERENCES dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ft_venda ADD CONSTRAINT dim_produto_ft_venda_fk
FOREIGN KEY (sk_cod_produto)
REFERENCES dim_produto (sk_cod_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
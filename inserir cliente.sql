use vendas_de_veiculos;

ALTER TABLE cliente
ADD column valor double;

DELIMITER $$
create procedure inserir_cliente() 
begin
	declare i int default 1;
    while i<= 100 do 
		insert into cliente (nome, cnh , tipo_cliente, cartao)
        values 
        (
			concat('cliente', i),
            concat('CNH', LPAD(i,5,'0')),
            if(i% 2 = 0,'Física','Jurídica'),
            concat(LPAD(i,16,0))
		);
        set i = 1;
	end while;
end $$
DELIMITER;
CALL inserir_cliente();
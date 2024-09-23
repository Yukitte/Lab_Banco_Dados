use vendas_veiculos;
 
ALTER TABLE funcionarios
ADD column valor double;
 
DELIMITER $$ 
create procedure inserir_funcionarios()
begin 
	declare i int default 1;
    while i <=50 do
		insert into funcionario(nome_funcionario,salario, departamento)
        values
		(
			concat('nome_funcionario',i),
            ROUND(RAND()*5000+2000,2),
            IF(i %2 =0, 'venda','manutençao')
		);
        set i =1 ; 
	end while;
end $$
DELIMITER;
call inserir_funcionario();
        


create database db_venda_veiculo;

use db_venda_veiculo;

create table cliente
(
	id_cliente int unsigned not null auto_increment,
    
    cnh varchar(25) null, 
    tipo_cliente varchar(45) not null,
    check (tipo_cliente in ('Física','Jurídica')),
    cartao varchar(16),
    primary key(id_cliente)
);

alter table cliente 
add column nome varchar(45) not null;

create table funcionario
(
	id int unsigned not null auto_increment,
	nome_funcionario varchar(45) not null,
    salario double not null default '0',
    departamento varchar(45),
    primary key(id)
);

create table veiculo_venda
(
	id_venda int unsigned not null auto_increment,
    valor_venda double not null, 
    data_venda date not null,
    cliente_id int unsigned not null,
    funcionario_id int unsigned not null,
    primary key(id_venda),
    constraint fk_cliente_id foreign key (cliente_id) references cliente(id_cliente),
    constraint fk_funcionario_id foreign key(funcionario_id) references funcionario(id)
);

create table veiculo
( 
	id_veiculo int unsigned not null auto_increment,
    placa varchar(7) not null,
    marca varchar(45) not null,
    modelo varchar(45) not null,
    valor double not null,
    ano int unsigned not null,
    venda_id int unsigned null,
    constraint fk_venda_id foreign key (venda_id) references veiculo_venda(id_venda),
    primary key(id_veiculo)
);

insert into cliente(nome, cnh, tipo_cliente,cartao)
values
	('Chico Moedas', '23141541', 'Física', '231412421'),
    ('Luiza sonza', '23142541', 'Jurídica', '2131223421'),
    ('Ana Maria', '215415511', 'Física', '546556545'),
    ('Tobias', '45451541', 'Física', '6564878698');
    
select * from cliente;
    
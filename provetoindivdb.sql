create database projetoindivdb;

create table vitima(
	vitima_id serial,
	vitima_nome varchar(100),
	vitima_cpf char(11),
	vitima_tel char(11),
	vitima_dt_nasc date,
	vitima_end varchar(250),
	primary key (vitima_id)
	);

create table denuncia(
	denuncia_id serial,
	denuncia_dt_hr timestamp,
	denuncia_local varchar(100),
	denuncia_descric varchar(500),
	fk_vitima_id integer,
	fk_infracao_crime_id integer,
	fk_policial_id integer,
	primary key (denuncia_id),
	foreign key (fk_vitima_id) references vitima (vitima_id),
	foreign key (fk_infracao_crime_id) references infracao_crime (infracao_crime_id),
	foreign key (fk_policial_id) references policial (policial_id)
);

create table policial(
	policial_id serial,
	policial_nome varchar(100),
	primary key (policial_id)
);

create table infracao_crime(
	infracao_crime_id serial,
	infracao_crime_tipo varchar(100),
	fk_policial_id integer,
	primary key (infracao_crime_id),
	foreign key (fk_policial_id) references policial (policial_id)
);
-- insert das infrações/crimes:

insert
	into
	infracao_crime(infracao_crime_tipo,
	fk_policial_id)
values ('Roubo',
1);

insert
	into
	infracao_crime(infracao_crime_tipo,
	fk_policial_id)
values ('Furto',
2);

insert
	into
	infracao_crime(infracao_crime_tipo,
	fk_policial_id)
values ('Racismo' 3);

insert
	into
	infracao_crime(infracao_crime_tipo,
	fk_policial_id)
values ('Agressão' 4);

insert
	into
	infracao_crime(infracao_crime_tipo,
	fk_policial_id)
values ('Homicídio' 5);
-- update para trocar o crime q eu coloquei homicidio rs
update 
	infracao_crime
set 
	infracao_crime_tipo = 'Homofobia'
where
	infracao_crime_id = 5;
-- insert dos policiais:

insert
	into
	policial (policial_nome)
values ('Murilo Peçanha');

insert
	into
	policial (policial_nome)
values ('João Barbosa');

insert
	into
	policial (policial_nome)
values ('Celia Moraes');

insert
	into
	policial (policial_nome)
values ('Regina Omero');
-- update para alterar nome do policial que foi cadastrado 2x com msm nome.
update
	policial
set
	policial_nome = 'Paula Rodrigues'
where
	policial_id = 3;
-- insert para adicionar as vitimas:

insert
	into
	vitima (vitima_nome)
values ('Carla Silva');
-- update para adicionar infos da vitima q não tinham sido cadastradas
update
	vitima
set
	vitima_cpf = '01569874365',
	vitima_tel = '21998512569',
	vitima_dt_nasc = '1982-04-01',
	vitima_end = 'Rua Visconde da Pedra'
where
	vitima_id = 1;

insert
	into
	vitima (vitima_nome)
values ('Valter Franco');
-- update para adicionar infos da vitima q não tinham sido cadastradas
update
	vitima
set
	vitima_cpf = '65872596310',
	vitima_tel = '21992634785',
	vitima_dt_nasc = '1949-05-26',
	vitima_end = 'Rua Maria Lopes'
where
	vitima_id = 2;

insert
	into
	vitima (vitima_nome,
	vitima_cpf,
	vitima_tel,
	vitima_dt_nasc,
	vitima_end)
values ('Alberto Granja',
'18532594702',
'21981630042',
'1874-08-14',
'Rua das Flores, sem nº' );

insert
	into
	vitima (vitima_nome,
	vitima_cpf,
	vitima_tel,
	vitima_dt_nasc,
	vitima_end)
values ('Armando Costa',
'87266931524',
'2299710026',
'1998-12-28',
'Ladeira das Bromelias');

insert
	into
	vitima (vitima_nome,
	vitima_cpf,
	vitima_tel,
	vitima_dt_nasc,
	vitima_end)
values ('Jessica Passos',
'25633108713',
'24988509014',
'2004-02-06',
'Rua União e Indústria, nº 680');
-- insert das denúncias:

insert
	into
	denuncia 
(denuncia_dt_hr,
	denuncia_local,
	denuncia_descric,
	fk_policial_id,
	fk_vitima_id,
	fk_infracao_crime_id,
	)
values
('2023-06-12 21:55:41',
'Rio de Janeiro',
'A vitima sofreu assalto.',
1,
1,
1);

insert
	into
	denuncia 
(denuncia_dt_hr,
	denuncia_local,
	denuncia_descric,
	fk_policial_id,
	fk_vitima_id,
	fk_infracao_crime_id)
values
('2023-07-22 08:36:44',
'Rio de Janeiro',
'A vitima sofreu furto.',
2,
2,
2);

insert
	into
	denuncia 
(denuncia_dt_hr,
	denuncia_local,
	denuncia_descric,
	fk_policial_id,
	fk_vitima_id,
	fk_infracao_crime_id)
values
('2023-01-30 14:09:51',
'Rio de Janeiro',
'A vitima sofreu racismo.',
3,
3,
3);

insert
	into
	denuncia 
(denuncia_dt_hr,
	denuncia_local,
	denuncia_descric,
	fk_policial_id,
	fk_vitima_id,
	fk_infracao_crime_id)
values
('2021-09-16 02:44:18',
'Campos dos Goytacazes',
'A vitima sofreu agressão.',
4,
4,
4);

insert
	into
	denuncia 
(denuncia_dt_hr,
	denuncia_local,
	denuncia_descric,
	fk_policial_id,
	fk_vitima_id,
	fk_infracao_crime_id)
values
('2023-02-26 16:20:33',
'Petrópolis',
'A vítima sofreu homofobia.',
5,
5,
5);

-- comando com inner join:
select
	d.denuncia_id,
	d.denuncia_descric,
	v.vitima_nome,
	p.policial_nome,
	ic.infracao_crime_tipo
from
	denuncia d
inner join vitima v on
	v.vitima_id = d.fk_vitima_id
inner join policial p on
	p.policial_id = d.fk_policial_id
inner join infracao_crime ic on
	ic.infracao_crime_id = d.fk_infracao_crime_id
where
	d.fk_vitima_id = 5
	-- comando com order by:
select
	*
from
	vitima v
order by
	vitima_id desc
	-- comando com group by:
	
select
	count (v.vitima_id),
	v.vitima_nome,
	v.vitima_end
from
	vitima v
group by
	v.vitima_end,
	v.vitima_nome
	-- Criação da view para ver as denúncias

create view view_denuncia as
select
	d.denuncia_id,
	d.denuncia_dt_hr,
	d.denuncia_local,
	d.denuncia_descric,
	v.vitima_nome,
	p.policial_nome,
	ic.infracao_crime_tipo
from
	denuncia d
inner join vitima v on
	v.vitima_id = d.fk_vitima_id
inner join policial p on
	p.policial_id = d.fk_policial_id
inner join infracao_crime ic on
	ic.infracao_crime_id = d.fk_infracao_crime_id;

select *from view_denuncia

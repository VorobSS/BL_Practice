--CREATE TABLE address (
--	id                   bigint  NOT NULL  AUTO_INCREMENT,
--	countrie             bigint  NOT NULL  ,
--	city                 bigint  NOT NULL  ,
--	street               bigint  NOT NULL  ,
--	house                varchar(10)  NOT NULL  ,
--	CONSTRAINT pk_address_id PRIMARY KEY ( id ),
--	CONSTRAINT unq_address_city UNIQUE ( city ) ,
--	CONSTRAINT unq_address_countrie UNIQUE ( countrie )
-- ) ;
--
--CREATE INDEX idx_address_id ON address ( id );
--
--COMMENT ON TABLE address IS 'Справочник адресов';
--
--ALTER TABLE address MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';
--
--ALTER TABLE address MODIFY countrie bigint  NOT NULL   COMMENT 'Страна';
--
--ALTER TABLE address MODIFY city bigint  NOT NULL   COMMENT 'Город';
--
--ALTER TABLE address MODIFY street bigint  NOT NULL   COMMENT 'Улица';
--
--ALTER TABLE address MODIFY house varchar(10)  NOT NULL   COMMENT 'Дом/строение';
--
--CREATE TABLE city (
--	id                   bigint  NOT NULL  ,
--	name                 varchar(100)  NOT NULL  ,
--	CONSTRAINT pk_city_id PRIMARY KEY ( id )
-- ) ;
--
--CREATE INDEX idx_city_id ON city ( id );
--
--CREATE INDEX idx_city_name ON city ( name );
--
--COMMENT ON TABLE city IS 'Город';
--
--ALTER TABLE city MODIFY id bigint  NOT NULL   COMMENT 'Уникальный идентификатор';
--
--ALTER TABLE city MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименование города';
--
--CREATE TABLE countrie (
--	id                   bigint  NOT NULL  AUTO_INCREMENT,
--	code                 int  NOT NULL  ,
--	name                 varchar(100)  NOT NULL  ,
--	CONSTRAINT pk_countrie_id PRIMARY KEY ( id ),
--	CONSTRAINT unq_countrie_code UNIQUE ( code )
-- ) ;
--
--CREATE INDEX idx_countrie_id ON countrie ( id );
--
--COMMENT ON TABLE countrie IS 'Страна';
--
--ALTER TABLE countrie MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';
--
--ALTER TABLE countrie MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименование';
--
--CREATE TABLE doc_type (
--	id                   bigint  NOT NULL  AUTO_INCREMENT,
--	code                 int  NOT NULL  ,
--	name                 varchar(100)  NOT NULL  ,
--	CONSTRAINT pk_doc_type_id PRIMARY KEY ( id )
-- ) ;
--
--CREATE INDEX idx_doc_type_id ON doc_type ( id );
--
--CREATE INDEX idx_doc_type_code ON doc_type ( code );
--
--COMMENT ON TABLE doc_type IS 'Тип документа, удостоверяющего личность';
--
--ALTER TABLE doc_type MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';
--
--ALTER TABLE doc_type MODIFY code int  NOT NULL   COMMENT 'Код документа';
--
--ALTER TABLE doc_type MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименование документа';

CREATE TABLE organization (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	name                 varchar(100)  NOT NULL  ,
	full_name            varchar(100)  NOT NULL  ,
	inn                  varchar(15)  NOT NULL  ,
	kpp                  varchar(15)  NOT NULL  ,
	address              bigint  NOT NULL  ,
	phone                varchar(50)    ,
	is_active            bool   DEFAULT true ,
	CONSTRAINT pk_organization_id PRIMARY KEY ( id ),
	CONSTRAINT unq_organization_address UNIQUE ( address )
 ) ;

CREATE INDEX idx_organization_id ON organization ( id );

CREATE INDEX idx_organization_name ON organization ( name );

CREATE INDEX idx_organization_inn ON organization ( inn );

CREATE INDEX idx_organization_kpp ON organization ( kpp );

CREATE INDEX idx_organization_phone ON organization ( phone );

COMMENT ON TABLE organization IS 'Организации';

ALTER TABLE organization MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';

ALTER TABLE organization MODIFY name varchar(100)  NOT NULL   COMMENT 'Краткое наименование организации';

ALTER TABLE organization MODIFY full_name varchar(100)  NOT NULL   COMMENT 'Полное наименование организации';

ALTER TABLE organization MODIFY inn varchar(15)  NOT NULL   COMMENT 'ИНН организации';

ALTER TABLE organization MODIFY kpp varchar(15)  NOT NULL   COMMENT 'КПП организации';

ALTER TABLE organization MODIFY address bigint  NOT NULL   COMMENT 'Адрес организации';

ALTER TABLE organization MODIFY phone varchar(50)     COMMENT 'Телефон организации';

ALTER TABLE organization MODIFY is_active bool   DEFAULT true  COMMENT 'Актуальность';

--CREATE TABLE em_position (
--	id                   bigint  NOT NULL  AUTO_INCREMENT,
--	name                 varchar(100)  NOT NULL  ,
--	CONSTRAINT pk_position_id PRIMARY KEY ( id )
-- ) ;
--
--CREATE INDEX idx_position_id ON em_position ( id );
--
--CREATE INDEX idx_position_name ON em_position ( name );
--
--COMMENT ON TABLE em_position IS 'Справочник должностей';
--
--ALTER TABLE em_position MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';
--
--ALTER TABLE em_position MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименвоание должности';

CREATE TABLE employee (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	first_name           varchar(50)  NOT NULL  ,
	last_name            varchar(50)  NOT NULL  ,
	middle_name          varchar(50)  NOT NULL  ,
	position_id          bigint  NOT NULL  ,
	phone                varchar(50)    ,
	citizenship_code     int  NOT NULL  ,
	is_identified        bool  NOT NULL DEFAULT true,
	CONSTRAINT pk_employee_id PRIMARY KEY ( id )
 ) ;

CREATE INDEX idx_employee_citizenship_code ON employee ( citizenship_code );

CREATE INDEX idx_employee_id ON employee ( id );

CREATE INDEX idx_employee_first_name ON employee ( first_name );

CREATE INDEX idx_employee_last_name ON employee ( last_name );

COMMENT ON TABLE employee IS 'Сотрудники организации';

ALTER TABLE employee MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор сотрудника';

ALTER TABLE employee MODIFY first_name varchar(50)  NOT NULL   COMMENT 'Имя сотрудника';

ALTER TABLE employee MODIFY last_name varchar(50)  NOT NULL   COMMENT 'Фамилия сотрудника';

ALTER TABLE employee MODIFY middle_name varchar(50)  NOT NULL   COMMENT 'Отчество сотрудника';

ALTER TABLE employee MODIFY position_id bigint  NOT NULL   COMMENT 'Должность сотрудника';

ALTER TABLE employee MODIFY phone varchar(50)     COMMENT 'Номер телефона сотрудника';

ALTER TABLE employee MODIFY citizenship_code int  NOT NULL   COMMENT 'Код страны гражданства';

CREATE TABLE office (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	name                 varchar(100)  NOT NULL  ,
	address              bigint  NOT NULL  ,
	phone                varchar(50)    ,
	is_active            bool  NOT NULL  ,
	org_id               bigint  NOT NULL  ,
	CONSTRAINT pk_office_id PRIMARY KEY ( id ) ,
	CONSTRAINT unq_office_address UNIQUE ( address )
 ) ;

CREATE INDEX idx_office_id ON office ( id );

CREATE INDEX idx_office_name ON office ( name );

CREATE INDEX idx_office_phone ON office ( phone );

COMMENT ON TABLE office IS 'Офис организации';

ALTER TABLE office MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор офиса';

ALTER TABLE office MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименование офиса';

ALTER TABLE office MODIFY address bigint  NOT NULL   COMMENT 'Адрес офиса';

ALTER TABLE office MODIFY phone varchar(50)     COMMENT 'Телефон офиса';

ALTER TABLE office MODIFY is_active bool  NOT NULL   COMMENT 'Актуальность';

ALTER TABLE office MODIFY org_id bigint  NOT NULL   COMMENT 'Идентификатор организации';

--CREATE TABLE docs (
--	id                   bigint  NOT NULL  AUTO_INCREMENT,
--	number               varchar(50)  NOT NULL  ,
--	date_doc               date  NOT NULL  ,
--	doc_type_id          bigint  NOT NULL  ,
--	employee_id          bigint  NOT NULL  ,
--	CONSTRAINT pk_docs_id PRIMARY KEY ( id ),
--	CONSTRAINT unq_docs_doc_type_id UNIQUE ( doc_type_id ) ,
--	CONSTRAINT idx_docs_number UNIQUE ( number )
-- ) ;
--
--CREATE INDEX idx_docs_id ON docs ( id );
--
--CREATE INDEX idx_docs_employee_id ON docs ( employee_id );
--
--COMMENT ON TABLE docs IS 'Документы, удостоверяющие личность';
--
--ALTER TABLE docs MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';
--
--ALTER TABLE docs MODIFY number varchar(50)  NOT NULL   COMMENT 'Номер документа';
--
--ALTER TABLE docs MODIFY date_doc date  NOT NULL   COMMENT 'Дата выдачи документа';
--
--ALTER TABLE docs MODIFY doc_type_id bigint  NOT NULL   COMMENT 'Код типа документа';
--
--ALTER TABLE docs MODIFY employee_id bigint  NOT NULL   COMMENT 'Идентификатор сотрудника';

CREATE TABLE employee_office (
	employee_id          bigint  NOT NULL  ,
	office_id            bigint  NOT NULL  ,
	CONSTRAINT pk_employee_office_id PRIMARY KEY ( employee_id, office_id )
 ) ;

CREATE INDEX unq_employee_office_employee_id ON employee_office ( employee_id );

CREATE INDEX unq_employee_office_office_id ON employee_office ( office_id );

COMMENT ON TABLE employee_office IS 'Таблица, связывающая сотрудника и офис';

ALTER TABLE employee_office MODIFY employee_id bigint     COMMENT 'Идентификатор сотрудника';

ALTER TABLE employee_office MODIFY office_id bigint     COMMENT 'Идентификатор офиса';

--ALTER TABLE city ADD CONSTRAINT fk_city_address FOREIGN KEY ( id ) REFERENCES address( city ) ;
--
--ALTER TABLE countrie ADD CONSTRAINT fk_countrie_address FOREIGN KEY ( id ) REFERENCES address( countrie ) ;
--
--ALTER TABLE docs ADD CONSTRAINT fk_docs_doc_type FOREIGN KEY ( doc_type_id ) REFERENCES doc_type( id ) ;
--
--ALTER TABLE docs ADD CONSTRAINT fk_docs_employee FOREIGN KEY ( employee_id ) REFERENCES employee( id ) ;

--ALTER TABLE employee ADD CONSTRAINT fk_employee_countrie FOREIGN KEY ( citizenship_code ) REFERENCES countrie( code ) ;
--
--ALTER TABLE employee ADD CONSTRAINT fk_employee_position FOREIGN KEY ( position_id ) REFERENCES em_position( id ) ;

ALTER TABLE employee_office ADD CONSTRAINT fk_employee_office_office FOREIGN KEY ( office_id ) REFERENCES office( id ) ;

ALTER TABLE employee_office ADD CONSTRAINT fk_employee_office_employee FOREIGN KEY ( employee_id ) REFERENCES employee( id ) ;

ALTER TABLE office ADD CONSTRAINT fk_office_organization FOREIGN KEY ( org_id ) REFERENCES organization( id ) ;

--ALTER TABLE office ADD CONSTRAINT fk_office_address FOREIGN KEY ( address ) REFERENCES address( id ) ;

--ALTER TABLE organization ADD CONSTRAINT fk_organization_address FOREIGN KEY ( address ) REFERENCES address( id ) ;

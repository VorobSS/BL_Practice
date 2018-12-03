CREATE SCHEMA practice_db;

CREATE TABLE practice_db.address (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	countrie             bigint  NOT NULL  ,
	city                 bigint  NOT NULL  ,
	street               bigint  NOT NULL  ,
	house                varchar(10)  NOT NULL  ,
	CONSTRAINT pk_address_id PRIMARY KEY ( id ),
	CONSTRAINT unq_address_city UNIQUE ( city ) ,
	CONSTRAINT unq_address_countrie UNIQUE ( countrie )
 );

CREATE INDEX idx_address_id ON practice_db.address ( id );

ALTER TABLE practice_db.address COMMENT 'Справочник адресов';

ALTER TABLE practice_db.address MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';

ALTER TABLE practice_db.address MODIFY countrie bigint  NOT NULL   COMMENT 'Страна';

ALTER TABLE practice_db.address MODIFY city bigint  NOT NULL   COMMENT 'Город';

ALTER TABLE practice_db.address MODIFY street bigint  NOT NULL   COMMENT 'Улица';

ALTER TABLE practice_db.address MODIFY house varchar(10)  NOT NULL   COMMENT 'Дом/строение';

CREATE TABLE practice_db.city (
	id                   bigint  NOT NULL  ,
	name                 varchar(100)  NOT NULL  ,
	CONSTRAINT pk_city_id PRIMARY KEY ( id )
 );

CREATE INDEX idx_city_id ON practice_db.city ( id );

CREATE INDEX idx_city_name ON practice_db.city ( name );

ALTER TABLE practice_db.city COMMENT 'Город';

ALTER TABLE practice_db.city MODIFY id bigint  NOT NULL   COMMENT 'Уникальный идентификатор';

ALTER TABLE practice_db.city MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименование города';

CREATE TABLE practice_db.countrie (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	code                 int  NOT NULL  ,
	name                 varchar(100)  NOT NULL  ,
	CONSTRAINT pk_countrie_id PRIMARY KEY ( id ),
	CONSTRAINT unq_countrie_code UNIQUE ( code )
 );

CREATE INDEX idx_countrie_id ON practice_db.countrie ( id );

CREATE INDEX idx_countrie_name ON practice_db.countrie ( name );

ALTER TABLE practice_db.countrie COMMENT 'Страна';

ALTER TABLE practice_db.countrie MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';

ALTER TABLE practice_db.countrie MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименование';

CREATE TABLE practice_db.doc_type (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	code                 int  NOT NULL  ,
	name                 varchar(100)  NOT NULL  ,
	CONSTRAINT pk_doc_type_id PRIMARY KEY ( id )
 );

CREATE INDEX idx_doc_type_id ON practice_db.doc_type ( id );

CREATE INDEX idx_doc_type_code ON practice_db.doc_type ( code );

ALTER TABLE practice_db.doc_type COMMENT 'Тип документа, удостоверяющего личность';

ALTER TABLE practice_db.doc_type MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';

ALTER TABLE practice_db.doc_type MODIFY code int  NOT NULL   COMMENT 'Код документа';

ALTER TABLE practice_db.doc_type MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименование документа';

CREATE TABLE practice_db.docs (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	number               varchar(50)  NOT NULL  ,
	`date`               date  NOT NULL  ,
	doc_type_id          bigint  NOT NULL  ,
	CONSTRAINT pk_docs_id PRIMARY KEY ( id ),
	CONSTRAINT unq_docs_doc_type_id UNIQUE ( doc_type_id )
 );

CREATE INDEX idx_docs_id ON practice_db.docs ( id );

CREATE INDEX idx_docs_number ON practice_db.docs ( number );

ALTER TABLE practice_db.docs COMMENT 'Документы, удостоверяющие личность';

ALTER TABLE practice_db.docs MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';

ALTER TABLE practice_db.docs MODIFY number varchar(50)  NOT NULL   COMMENT 'Номер документа';

ALTER TABLE practice_db.docs MODIFY `date` date  NOT NULL   COMMENT 'Дата выдачи документа';

ALTER TABLE practice_db.docs MODIFY doc_type_id bigint  NOT NULL   COMMENT 'Код типа документа';

CREATE TABLE practice_db.organization (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	name                 varchar(100)  NOT NULL  ,
	full_name            varchar(100)  NOT NULL  ,
	inn                  int  NOT NULL  ,
	kpp                  int  NOT NULL  ,
	address               bigint  NOT NULL  ,
	phone                varchar(50)    ,
	is_active            bool   DEFAULT true ,
	CONSTRAINT pk_organization_id PRIMARY KEY ( id ),
	CONSTRAINT unq_organization_address UNIQUE ( address )
 );

CREATE INDEX idx_organization_id ON practice_db.organization ( id );

CREATE INDEX idx_organization_name ON practice_db.organization ( name );

CREATE INDEX idx_organization_inn ON practice_db.organization ( inn );

CREATE INDEX idx_organization_kpp ON practice_db.organization ( kpp );

ALTER TABLE practice_db.organization COMMENT 'Организации';

ALTER TABLE practice_db.organization MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';

ALTER TABLE practice_db.organization MODIFY name varchar(100)  NOT NULL   COMMENT 'Краткое наименование организации';

ALTER TABLE practice_db.organization MODIFY full_name varchar(100)  NOT NULL   COMMENT 'Полное наименование организации';

ALTER TABLE practice_db.organization MODIFY inn int  NOT NULL   COMMENT 'ИНН организации';

ALTER TABLE practice_db.organization MODIFY kpp int  NOT NULL   COMMENT 'КПП организации';

ALTER TABLE practice_db.organization MODIFY address bigint  NOT NULL   COMMENT 'Адрес организации';

ALTER TABLE practice_db.organization MODIFY phone varchar(50)     COMMENT 'Телефон организации';

ALTER TABLE practice_db.organization MODIFY is_active bool   DEFAULT true  COMMENT 'Актуальность';

CREATE TABLE practice_db.position (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	name                 varchar(100)  NOT NULL  ,
	CONSTRAINT pk_position_id PRIMARY KEY ( id )
 );

CREATE INDEX idx_position_id ON practice_db.position ( id );

CREATE INDEX idx_position_name ON practice_db.position ( name );

ALTER TABLE practice_db.position COMMENT 'Справочник должностей';

ALTER TABLE practice_db.position MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';

ALTER TABLE practice_db.position MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименвоание должности';

CREATE TABLE practice_db.office (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	name                 varchar(100)  ,
	address               bigint  ,
	phone                varchar(50)    ,
	is_active            bool  ,
	org_id               bigint  NOT NULL  ,
	CONSTRAINT pk_office_id PRIMARY KEY ( id ),
	CONSTRAINT unq_office_id_org UNIQUE ( org_id ) ,
	CONSTRAINT unq_office_address UNIQUE ( address )
 );

CREATE INDEX idx_office_id ON practice_db.office ( id );

CREATE INDEX idx_office_name ON practice_db.office ( name );

ALTER TABLE practice_db.office COMMENT 'Офис организации';

ALTER TABLE practice_db.office MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор офиса';

ALTER TABLE practice_db.office MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименование офиса';

ALTER TABLE practice_db.office MODIFY address bigint  NOT NULL   COMMENT 'Адрес офиса';

ALTER TABLE practice_db.office MODIFY phone varchar(50)     COMMENT 'Телефон офиса';

ALTER TABLE practice_db.office MODIFY is_active bool  NOT NULL   COMMENT 'Актуальность';

ALTER TABLE practice_db.office MODIFY org_id bigint  NOT NULL   COMMENT 'Идентификатор организации';

CREATE TABLE practice_db.employee (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	first_name           varchar(50)  NOT NULL  ,
	last_name            varchar(50)   ,
	middle_name          varchar(50)   ,
	position_id          bigint  NOT NULL  ,
	phone                varchar(50)    ,
	doc_id               bigint   ,
	doc_name             varchar(100)  ,
	doc_number           varchar(50)  ,
	doc_date             date   ,
	citizenship_name     varchar(100)   ,
	citizenship_code     int   ,
	is_identified        bool  DEFAULT true ,
	office_id            bigint  ,
	CONSTRAINT pk_employee_id PRIMARY KEY ( id ),
	CONSTRAINT unq_employee_position_id UNIQUE ( position_id ) ,
	CONSTRAINT unq_employee_doc_id UNIQUE ( doc_id ) ,
	CONSTRAINT unq_employee_office_id UNIQUE ( office_id )
 );

CREATE INDEX idx_employee_id ON practice_db.employee ( id );

CREATE INDEX idx_employee_first_name ON practice_db.employee ( first_name );

ALTER TABLE practice_db.employee COMMENT 'Сотрудники организации';

ALTER TABLE practice_db.employee MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор сотрудника';

ALTER TABLE practice_db.employee MODIFY first_name varchar(50)  NOT NULL   COMMENT 'Имя сотрудника';

ALTER TABLE practice_db.employee MODIFY last_name varchar(50)  NOT NULL   COMMENT 'Фамилия сотрудника';

ALTER TABLE practice_db.employee MODIFY middle_name varchar(50)  NOT NULL   COMMENT 'Отчество сотрудника';

ALTER TABLE practice_db.employee MODIFY position_id bigint  NOT NULL   COMMENT 'Должность сотрудника';

ALTER TABLE practice_db.employee MODIFY phone varchar(50)     COMMENT 'Номер телефона сотрудника';

ALTER TABLE practice_db.employee MODIFY doc_name varchar(100)  NOT NULL   COMMENT 'Наименование документа, удостоверяющего личность';

ALTER TABLE practice_db.employee MODIFY doc_number varchar(50)  NOT NULL   COMMENT 'Номер документа, удостоверяющего личность';

ALTER TABLE practice_db.employee MODIFY doc_date date  NOT NULL   COMMENT 'Дата выдачи документа, удостоверяющего личность';

ALTER TABLE practice_db.employee MODIFY citizenship_name varchar(100)  NOT NULL   COMMENT 'Гражданство';

ALTER TABLE practice_db.employee MODIFY citizenship_code int  NOT NULL   COMMENT 'Код страны гражданства';

ALTER TABLE practice_db.employee MODIFY office_id bigint  NOT NULL   COMMENT 'Код оффиса';

ALTER TABLE practice_db.city ADD CONSTRAINT fk_city_address FOREIGN KEY ( id ) REFERENCES practice_db.address( city );

ALTER TABLE practice_db.countrie ADD CONSTRAINT fk_countrie_address FOREIGN KEY ( id ) REFERENCES practice_db.address( countrie );

ALTER TABLE practice_db.docs ADD CONSTRAINT fk_docs_doc_type FOREIGN KEY ( doc_type_id ) REFERENCES practice_db.doc_type( id );

ALTER TABLE practice_db.employee ADD CONSTRAINT fk_employee_office FOREIGN KEY ( office_id ) REFERENCES practice_db.office( id );

ALTER TABLE practice_db.employee ADD CONSTRAINT fk_employee_countrie FOREIGN KEY ( citizenship_code ) REFERENCES practice_db.countrie( code );

ALTER TABLE practice_db.employee ADD CONSTRAINT fk_employee_docs FOREIGN KEY ( doc_id ) REFERENCES practice_db.docs( id );

ALTER TABLE practice_db.employee ADD CONSTRAINT fk_employee_position FOREIGN KEY ( position_id ) REFERENCES practice_db.position( id );

ALTER TABLE practice_db.office ADD CONSTRAINT fk_office_organization FOREIGN KEY ( org_id ) REFERENCES practice_db.organization( id );

ALTER TABLE practice_db.office ADD CONSTRAINT fk_office_address FOREIGN KEY ( address ) REFERENCES practice_db.address( id );

ALTER TABLE practice_db.organization ADD CONSTRAINT fk_organization_address FOREIGN KEY ( address ) REFERENCES practice_db.address( id );

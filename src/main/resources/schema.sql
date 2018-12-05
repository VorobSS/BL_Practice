CREATE TABLE practice_db.address (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	countrie             bigint  NOT NULL  ,
	city                 bigint  NOT NULL  ,
	street               bigint  NOT NULL  ,
	house                varchar(10)  NOT NULL  ,
	CONSTRAINT pk_address_id PRIMARY KEY ( id ),
	CONSTRAINT unq_address_city UNIQUE ( city ) ,
	CONSTRAINT unq_address_countrie UNIQUE ( countrie )
 ) engine=InnoDB;

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
 ) engine=InnoDB;

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
 ) engine=InnoDB;

CREATE INDEX idx_countrie_id ON practice_db.countrie ( id );

ALTER TABLE practice_db.countrie COMMENT 'Страна';

ALTER TABLE practice_db.countrie MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';

ALTER TABLE practice_db.countrie MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименование';

CREATE TABLE practice_db.doc_type (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	code                 int  NOT NULL  ,
	name                 varchar(100)  NOT NULL  ,
	CONSTRAINT pk_doc_type_id PRIMARY KEY ( id )
 ) engine=InnoDB;

CREATE INDEX idx_doc_type_id ON practice_db.doc_type ( id );

CREATE INDEX idx_doc_type_code ON practice_db.doc_type ( code );

ALTER TABLE practice_db.doc_type COMMENT 'Тип документа, удостоверяющего личность';

ALTER TABLE practice_db.doc_type MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';

ALTER TABLE practice_db.doc_type MODIFY code int  NOT NULL   COMMENT 'Код документа';

ALTER TABLE practice_db.doc_type MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименование документа';

CREATE TABLE practice_db.organization (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	name                 varchar(100)  NOT NULL  ,
	full_name            varchar(100)  NOT NULL  ,
	inn                  int  NOT NULL  ,
	kpp                  int  NOT NULL  ,
	address              bigint  NOT NULL  ,
	phone                varchar(50)    ,
	is_active            bool   DEFAULT true ,
	CONSTRAINT pk_organization_id PRIMARY KEY ( id ),
	CONSTRAINT unq_organization_address UNIQUE ( address )
 ) engine=InnoDB;

CREATE INDEX idx_organization_id ON practice_db.organization ( id );

CREATE INDEX idx_organization_name ON practice_db.organization ( name );

CREATE INDEX idx_organization_inn ON practice_db.organization ( inn );

CREATE INDEX idx_organization_kpp ON practice_db.organization ( kpp );

CREATE INDEX idx_organization_phone ON practice_db.organization ( phone );

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
 ) engine=InnoDB;

CREATE INDEX idx_position_id ON practice_db.position ( id );

CREATE INDEX idx_position_name ON practice_db.position ( name );

ALTER TABLE practice_db.position COMMENT 'Справочник должностей';

ALTER TABLE practice_db.position MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';

ALTER TABLE practice_db.position MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименвоание должности';

CREATE TABLE practice_db.employee (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	first_name           varchar(50)  NOT NULL  ,
	last_name            varchar(50)  NOT NULL  ,
	middle_name          varchar(50)  NOT NULL  ,
	position_id          bigint  NOT NULL  ,
	phone                varchar(50)    ,
	citizenship_code     int  NOT NULL  ,
	is_identified        bool  NOT NULL DEFAULT true
	CONSTRAINT pk_employee_id PRIMARY KEY ( id ),
 ) engine=InnoDB;

CREATE INDEX idx_employee_citizenship_code ON practice_db.employee ( citizenship_code );

CREATE INDEX idx_employee_id ON practice_db.employee ( id );

CREATE INDEX idx_employee_first_name ON practice_db.employee ( first_name );

CREATE INDEX idx_employee_last_name ON practice_db.employee ( last_name );

ALTER TABLE practice_db.employee COMMENT 'Сотрудники организации';

ALTER TABLE practice_db.employee MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор сотрудника';

ALTER TABLE practice_db.employee MODIFY first_name varchar(50)  NOT NULL   COMMENT 'Имя сотрудника';

ALTER TABLE practice_db.employee MODIFY last_name varchar(50)  NOT NULL   COMMENT 'Фамилия сотрудника';

ALTER TABLE practice_db.employee MODIFY middle_name varchar(50)  NOT NULL   COMMENT 'Отчество сотрудника';

ALTER TABLE practice_db.employee MODIFY position_id bigint  NOT NULL   COMMENT 'Должность сотрудника';

ALTER TABLE practice_db.employee MODIFY phone varchar(50)     COMMENT 'Номер телефона сотрудника';

ALTER TABLE practice_db.employee MODIFY citizenship_code int  NOT NULL   COMMENT 'Код страны гражданства';

CREATE TABLE practice_db.office (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	name                 varchar(100)  NOT NULL  ,
	address              bigint  NOT NULL  ,
	phone                varchar(50)    ,
	is_active            bool  NOT NULL  ,
	org_id               bigint  NOT NULL  ,
	CONSTRAINT pk_office_id UNIQUE ( id ) ,
	CONSTRAINT unq_office_id_org UNIQUE ( org_id ) ,
	CONSTRAINT unq_office_address UNIQUE ( address )
 ) engine=InnoDB;

CREATE INDEX idx_office_id ON practice_db.office ( id );

CREATE INDEX idx_office_name ON practice_db.office ( name );

CREATE INDEX idx_office_phone ON practice_db.office ( phone );

ALTER TABLE practice_db.office COMMENT 'Офис организации';

ALTER TABLE practice_db.office MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор офиса';

ALTER TABLE practice_db.office MODIFY name varchar(100)  NOT NULL   COMMENT 'Наименование офиса';

ALTER TABLE practice_db.office MODIFY address bigint  NOT NULL   COMMENT 'Адрес офиса';

ALTER TABLE practice_db.office MODIFY phone varchar(50)     COMMENT 'Телефон офиса';

ALTER TABLE practice_db.office MODIFY is_active bool  NOT NULL   COMMENT 'Актуальность';

ALTER TABLE practice_db.office MODIFY org_id bigint  NOT NULL   COMMENT 'Идентификатор организации';

CREATE TABLE practice_db.docs (
	id                   bigint  NOT NULL  AUTO_INCREMENT,
	number               varchar(50)  NOT NULL  ,
	`date`               date  NOT NULL  ,
	doc_type_id          bigint  NOT NULL  ,
	employee_id          bigint  NOT NULL  ,
	CONSTRAINT pk_docs_id PRIMARY KEY ( id ),
	CONSTRAINT unq_docs_doc_type_id UNIQUE ( doc_type_id ) ,
	CONSTRAINT idx_docs_number UNIQUE ( number )
 ) engine=InnoDB;

CREATE INDEX idx_docs_id ON practice_db.docs ( id );

CREATE INDEX idx_docs_employee_id ON practice_db.docs ( employee_id );

ALTER TABLE practice_db.docs COMMENT 'Документы, удостоверяющие личность';

ALTER TABLE practice_db.docs MODIFY id bigint  NOT NULL  AUTO_INCREMENT COMMENT 'Уникальный идентификатор';

ALTER TABLE practice_db.docs MODIFY number varchar(50)  NOT NULL   COMMENT 'Номер документа';

ALTER TABLE practice_db.docs MODIFY `date` date  NOT NULL   COMMENT 'Дата выдачи документа';

ALTER TABLE practice_db.docs MODIFY doc_type_id bigint  NOT NULL   COMMENT 'Код типа документа';

ALTER TABLE practice_db.docs MODIFY employee_id bigint  NOT NULL   COMMENT 'Идентификатор сотрудника';

CREATE TABLE practice_db.employee_office (
	employee_id          bigint  NOT NULL  ,
	office_id            bigint  NOT NULL  ,
	CONSTRAINT pk_employee_office_id PRIMARY KEY ( employee_id, office_id )
 ) engine=InnoDB;

CREATE INDEX unq_employee_office_employee_id ON practice_db.employee_office ( employee_id );

CREATE INDEX unq_employee_office_office_id ON practice_db.employee_office ( office_id );

ALTER TABLE practice_db.employee_office COMMENT 'Таблица, связывающая сотрудника и офис';

ALTER TABLE practice_db.employee_office MODIFY employee_id bigint     COMMENT 'Идентификатор сотрудника';

ALTER TABLE practice_db.employee_office MODIFY office_id bigint     COMMENT 'Идентификатор офиса';

ALTER TABLE practice_db.city ADD CONSTRAINT fk_city_address FOREIGN KEY ( id ) REFERENCES practice_db.address( city ) ;

ALTER TABLE practice_db.countrie ADD CONSTRAINT fk_countrie_address FOREIGN KEY ( id ) REFERENCES practice_db.address( countrie ) ;

ALTER TABLE practice_db.docs ADD CONSTRAINT fk_docs_doc_type FOREIGN KEY ( doc_type_id ) REFERENCES practice_db.doc_type( id ) ;

ALTER TABLE practice_db.docs ADD CONSTRAINT fk_docs_employee FOREIGN KEY ( employee_id ) REFERENCES practice_db.employee( id ) ;

ALTER TABLE practice_db.employee ADD CONSTRAINT fk_employee_countrie FOREIGN KEY ( citizenship_code ) REFERENCES practice_db.countrie( code ) ;

ALTER TABLE practice_db.employee ADD CONSTRAINT fk_employee_position FOREIGN KEY ( position_id ) REFERENCES practice_db.position( id ) ;

ALTER TABLE practice_db.employee_office ADD CONSTRAINT fk_employee_office_office FOREIGN KEY ( office_id ) REFERENCES practice_db.office( id ) ;

ALTER TABLE practice_db.employee_office ADD CONSTRAINT fk_employee_office_employee FOREIGN KEY ( employee_id ) REFERENCES practice_db.employee( id ) ;

ALTER TABLE practice_db.office ADD CONSTRAINT fk_office_organization FOREIGN KEY ( org_id ) REFERENCES practice_db.organization( id ) ;

ALTER TABLE practice_db.office ADD CONSTRAINT fk_office_address FOREIGN KEY ( address ) REFERENCES practice_db.address( id ) ;

ALTER TABLE practice_db.organization ADD CONSTRAINT fk_organization_address FOREIGN KEY ( address ) REFERENCES practice_db.address( id ) ;

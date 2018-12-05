INSERT INTO city (id, name) VALUES (1, 'Саратов');
INSERT INTO city (id, name) VALUES (2, 'Москва');
INSERT INTO city (id, name) VALUES (3, 'Киев');
INSERT INTO city (id, name) VALUES (4, 'Минск');

INSERT INTO countrie (id, code, name) VALUES (1, 643, 'Россия');
INSERT INTO countrie (id, code, name) VALUES (2, 804, 'Украина');
INSERT INTO countrie (id, code, name) VALUES (3, 112, 'Беларусь');

INSERT INTO address (id, countrie, city, street, house) VALUES (1, 1, 1, 'ул.Университетская', '16');
INSERT INTO address (id, countrie, city, street, house) VALUES (2, 1, 1, 'ул.Московская', '33');
INSERT INTO address (id, countrie, city, street, house) VALUES (3, 1, 2, 'ул.Ленина', '103/Б');
INSERT INTO address (id, countrie, city, street, house) VALUES (4, 2, 3, 'ул.Шевченко', '11');

INSERT INTO doc_type (id, code, name) VALUES (1, 21, 'Паспорт гражданина РФ');
INSERT INTO doc_type (id, code, name) VALUES (2, 22, 'Загранпаспорт гражданина РФ');
INSERT INTO doc_type (id, code, name) VALUES (3, 03, 'Свидетельство о рождении');

INSERT INTO practice_db.organization
	( id, name, full_name, inn, kpp, address, phone, is_active)
	VALUES ( 1, 'Ромашка', 'Общество с ограниченной ответственностью Ромашка', 1111111111, 111111111, 1, '89998877', true );
INSERT INTO practice_db.organization
	( id, name, full_name, inn, kpp, address, phone, is_active)
	VALUES ( 2, 'Лютик', 'Общество с ограниченной ответственностью Лютик', 2222222222, 222222222, 3, '88889966', true );
INSERT INTO practice_db.organization
	( id, name, full_name, inn, kpp, address, phone, is_active)
	VALUES ( 3, 'Одуванчик', 'Общество с ограниченной ответственностью Одуванчик', 3333333333, 333333333, 2, '855553576', true );

INSERT INTO practice_db.position ( id, name) VALUES ( 1, 'директор' );
INSERT INTO practice_db.position ( id, name) VALUES ( 2, 'бухгалтер' );
INSERT INTO practice_db.position ( id, name) VALUES ( 3, 'продавец' );

INSERT INTO practice_db.employee
	( id, first_name, last_name, middle_name, position_id, phone, citizenship_code, is_identified)
	VALUES ( 1, 'Иванов', 'Иван', 'Иванович', 1, '789654', 1, true );
INSERT INTO practice_db.employee
    ( id, first_name, last_name, middle_name, position_id, phone, citizenship_code, is_identified)
    VALUES ( 2, 'Петров', 'Петр', 'Петрович', 3, '555666', 1, true );
INSERT INTO practice_db.employee
    ( id, first_name, last_name, middle_name, position_id, phone, citizenship_code, is_identified)
    VALUES ( 3, 'Сергеев', 'Сергей', 'Сергеевич', 2, '', 3, true );

INSERT INTO practice_db.office
    ( id, name, address, phone, is_active, org_id)
    VALUES ( 1, 'Главный офис', 1, '899988771', true, 1);
INSERT INTO practice_db.office
    ( id, name, address, phone, is_active, org_id)
    VALUES ( 2, 'Второй офис', 2, '899988772', true, 1);
INSERT INTO practice_db.office
    ( id, name, address, phone, is_active, org_id)
    VALUES ( 3, 'Главный офис', 3, '888899661', true, 2);

INSERT INTO practice_db.docs
    ( id, number, `date`, doc_type_id, employee_id) VALUES ( 1, '111 222 33', `01.01.1980`, 1, 1 );
INSERT INTO practice_db.docs
    ( id, number, `date`, doc_type_id, employee_id) VALUES ( 2, '222 333 22', `01.02.1967`, 2, 2 );
INSERT INTO practice_db.docs
    ( id, number, `date`, doc_type_id, employee_id) VALUES ( 3, '555 444 11', `03.05.1992`, 1, 3 );

INSERT INTO practice_db.employee_office
	( employee_id, office_id) VALUES ( 1, 1 );
INSERT INTO practice_db.employee_office
	( employee_id, office_id) VALUES ( 2, 1 );
INSERT INTO practice_db.employee_office
	( employee_id, office_id) VALUES ( 3, 3 );
INSERT INTO practice_db.employee_office
	( employee_id, office_id) VALUES ( 2, 2 );
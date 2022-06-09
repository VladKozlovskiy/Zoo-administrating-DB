--3 Crud

--C - Create (Insert)
--R - Read   (Select)
--U - Update (Update)
--D - Delete (Delete)

--1 Insert

--1.1
INSERT INTO Zoo.Excursions (excursion_title,excursion_date, excursion_start, excursion_end, amount_of_visitors)
VALUES
('Piggy Trip','05/16/2022', '13:00', '18:10', 29),
('Unique Birds','05/16/2022', '15:00', '17:58', 19);

--1.2
INSERT INTO Zoo.Workers_and_Excursions (worker_id, excursion_id)
VALUES
(8,11),
(7,12);

--1.3
INSERT INTO Zoo.Employees (employee_name, employee_surname, employee_mobile_phone,employee_email,employee_payment, employee_card_number, employee_passport_number)
VALUES
('Alexander', 'Gavrilov', '1-748-547-8569', 'alexander_deb@yahoo.org',1800,'4556895455819568' ,'WKZrg3H3rtienibLuLZQ0zqi6WGol2');

--1.4
INSERT INTO Zoo.Animals (animal_name, animal_spiecies, animal_weight, animal_age, chipped, vaccinated)
VALUES
('Nick', 'Giraph', 10, 0, false, false);

--2 Select

--2.1

SELECT DISTINCT  empl.employee_name , empl.employee_surname FROM Zoo.Employees as empl
INNER JOIN Zoo.Workers_and_Animals as wa on wa.worker_id = empl.employee_id
INNER JOIN Zoo.animals animals on animals.animal_id = wa.animal_id
WHERE animals.animal_age >= 5;

--2.2
SELECT DISTINCT  empl.employee_name, empl.employee_surname, empl.employee_payment FROM Zoo.Employees as empl
Right JOIN Zoo.Workers_and_Excursions as we on we.worker_id = empl.employee_id
Where empl.employee_payment is not null;

--2.3

SELECT DISTINCT  empl.employee_name, empl.employee_surname FROM Zoo.Employees as empl
Right JOIN Zoo.Workers_and_Excursions as we on we.worker_id = empl.employee_id
Right JOIN Zoo.Excursions as ex on we.excursion_id=ex.excursion_id
Where EXTRACT(ISODOW FROM ex.excursion_date) IN (6, 7);

--3 Update

--3.1
UPDATE Zoo.Animals
SET animal_age = animal_age+1
WHERE lower(animal_name) = 'bob';

--3.2
UPDATE Zoo.Employees
SET employee_payment = employee_payment - 200
WHERE lower(employee_name) = 'oliver' and lower(employee_surname) = 'rodriquez';

--3.3
UPDATE Zoo.Establishments_Nearby
SET establishment_rating = 4.89
WHERE lower(establishment_type) = 'rent';

--4 Delete

--4.1
DELETE FROM Zoo.Workers_and_Animals wa
USING Zoo.Animals an
WHERE wa.animal_id = an.animal_id and lower(an.animal_spiecies) = 'lion';

Delete FROM Zoo.Animals where lower(animal_spiecies) = 'lion';
--4.2
DELETE FROM Zoo.Workers_and_Establishments we
USING Zoo.Establishments_Nearby est
WHERE we.establishment_name = est.establishment_name and lower(est.establishment_name) = 'masala';

Delete FROM Zoo.Establishments_Nearby where lower(establishment_name) = 'masala';


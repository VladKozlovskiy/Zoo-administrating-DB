-- 6. Индексы

-- 6.1 Индекс по фаммилилии и имени работника

CREATE INDEX employee_name_surname_ind
ON Zoo.Employees(employee_name, employee_surname);

EXPLAIN (ANALYSE )
SELECT * from Zoo.employees
WHERE employee_name='Audra' and employee_surname='Shaw';

-- 6.2 Индекс по виду животного

CREATE INDEX animal_spiecies_ind
ON Zoo.Animals(animal_spiecies);

EXPLAIN (ANALYSE )
SELECT * from Zoo.animals
WHERE animal_spiecies='Giraph';

-- 6.3 Индекс по типу заведения

CREATE INDEX estab_type_in
ON Zoo.establishments_nearby(establishment_type);

EXPLAIN(ANALYSE )
SELECT *
from Zoo.Establishments_Nearby
WHERE establishment_type='Caffe';
-- 6.4 Индекс по названию экскурсии

CREATE INDEX excursion_name_ind
ON Zoo.Excursions(excursion_title);

EXPLAIN (ANALYSE )
SELECT * from Zoo.Excursions
WHERE excursion_title='Piggy Trip';

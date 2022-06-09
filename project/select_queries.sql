-- 5 Осмысленные Select-запросы

--5.1 Посмотрим, кто из работников ухаживает за крупными животными
--(GROUP BY + HAVING)

WITH HUGE_ANIMALS AS (SELECT b.animal_spiecies FROM Zoo.Animals as b
where  animal_weight > 100
GROUP BY b.animal_spiecies
Having AVG(animal_age) > 3)

SELECT DISTINCT e.employee_name, e.employee_surname from Zoo.Employees as e
INNER JOIN Zoo.Workers_and_Animals as a on a.worker_id = e.employee_id
INNER JOIN Zoo.Animals as an on an.animal_id = a.animal_id
INNER JOIN HUGE_ANIMALS on HUGE_ANIMALS.animal_spiecies = an.animal_spiecies
WHERE an.animal_spiecies = HUGE_ANIMALS.animal_spiecies;


--5.2 Посмотрим, каких животных чаще всего посещают в ходе экскурсий
--(С использованием ORDER BY)
SELECT DISTINCT an.animal_spiecies, count(ex.excursion_id) as amount  FROM Zoo.Animals as an
JOIN Zoo.Excursions_Program as e on e.animal_spieceis=an.animal_spiecies
JOIN Zoo.Excursions as ex on ex.excursion_title=e.excursion_title
GROUP BY an.animal_spiecies
ORDER BY count(ex.excursion_id);

--5.3 Выберем дни, в которые было более трех экскурсий, и посмотрим на места, в которые заходят маршруты в эти дни
--(Оконная агрегационная функция)
WITH AMOUNTS_PER_DATE AS(
SELECT ex.excursion_title, count(ex.excursion_id) OVER(PARTITION BY ex.excursion_date) AS Sum
FROM Zoo.Excursions as ex)

SELECT DISTINCT ep.establishment_name FROM Zoo.Excursions_Program as ep
JOIN AMOUNTS_PER_DATE as d on d.excursion_title=ep.excursion_title
where d.Sum>3;



--5.4 Рассмотрим топ3 самые популярные экскурсии
--(Оконная ранжирующая функция)
WITH EXCURSIONS AS (
SELECT ex.excursion_title, count(ex.excursion_id) as cnt
FROM Zoo.Excursions as ex
GROUP BY ex.excursion_title),

FAMOUS_EXCURSIONS AS (
SELECT ex.excursion_title, dense_rank() over (ORDER BY ex.cnt DESC) as rank
from EXCURSIONS as ex)

SELECT fam_ex.excursion_title FROM  FAMOUS_EXCURSIONS as fam_ex
where fam_ex.rank <= 3;

--5.5 Посмотрим сколько длятся экскурсии, которые начинаются с утра
--(Оконная скользящая функция)

WITH EARLY_EXCURSIONS AS(
SELECT ex.excursion_date,ex.excursion_start,  FIRST_VALUE(ex.excursion_title) OVER(PARTITION BY ex.excursion_date ORDER BY ex.excursion_start) as earliest
From Zoo.Excursions as ex
)

SELECT Distinct ex.excursion_duration FROM Zoo.Excursions_Program as ex
INNER JOIN EARLY_EXCURSIONS as e on e.earliest = ex.excursion_title;

--5.6 Посмотрим, каких животных посетили более 70-ти человек (меняя количество людей можно отслежитвать популярность зверей)

WITH PEOPLE_AMOUNT AS (SELECT ex.excursion_title, sum(ex.amount_of_visitors) as amount
                       From Zoo.Excursions as ex
                       GROUP BY ex.excursion_title
                       Having sum(ex.amount_of_visitors) > 70
                       )

SELECT e.animal_spieceis, p.amount From Zoo.Excursions_Program as e
JOIN PEOPLE_AMOUNT as p on p.excursion_title = e.excursion_title;


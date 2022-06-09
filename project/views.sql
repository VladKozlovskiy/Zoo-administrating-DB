--7 Представления

--7.1 Таблица представления работников с животными
CREATE VIEW WORKERS_WITH_ANIMALS
AS
     SELECT Distinct
     employee_id as id,
     employee_name as name,
     employee_surname as surname,
     employee_email as email,
     employee_mobile_phone as phone_number,
     CONCAT(SUBSTR(employee_card_number, 1, 4),'********',SUBSTR(employee_card_number, 13, 4)) as card_number,
     CONCAT(SUBSTR(employee_passport_number,1,5),'*******************',SUBSTR(employee_passport_number,25,5)) as passport_number
     FROM Zoo.employees as w
     INNER JOIN ZOO.Workers_and_Animals as wa on w.employee_id=wa.worker_id;


--7.2 Таблица представления экскурсоводов
CREATE VIEW GUIDES
AS
     SELECT Distinct
     employee_id as id,
     employee_name as name,
     employee_surname as surname,
     employee_email as email,
     employee_mobile_phone as phone_number,
     employee_payment as payment,
     CONCAT(SUBSTR(employee_card_number, 1, 4),'********',SUBSTR(employee_card_number, 13, 4)) as card_number,
     CONCAT(SUBSTR(employee_passport_number,1,5),'*******************',SUBSTR(employee_passport_number,25,5)) as passport_number
     FROM Zoo.employees as w
     INNER JOIN ZOO.Workers_and_Excursions as we on w.employee_id=we.worker_id;


--7.3 Таблица представления работников заведений на территории

CREATE VIEW Estab_workers
AS
     SELECT Distinct
     w.employee_id as id,
     w.employee_name as name,
     w.employee_surname as surname,
     w.employee_email as email,
     w.employee_mobile_phone as phone_number,
     w.employee_payment as payment,
     CONCAT(SUBSTR(w.employee_card_number, 1, 4),'********',SUBSTR(employee_card_number, 13, 4)) as card_number,
     CONCAT(SUBSTR(w.employee_passport_number,1,5),'*******************',SUBSTR(employee_passport_number,25,5)) as passport_number,
     we.establishment_name,
     e.establishment_type
     FROM Zoo.employees as w
     INNER JOIN ZOO.Workers_and_Establishments as we on w.employee_id=we.worker_id
     INNER JOIN ZOO.Establishments_Nearby as e on we.establishment_name = e.establishment_name;

select * from Estab_workers;


--7.4 Таблица представления информаци о жвиотных

CREATE VIEW ANIMAL_STATS
AS
    SELECT DISTINCT
    animal_spiecies,
    COUNT(animal_id) as amount_of_spiecies,
    AVG(animal_age) as average_age,
    AVG(animal_weight) as average_weight,
    count(*) filter (where vaccinated)/count(*) * 100 as vaccinated_percentage,
    count(*) filter (where chipped)/count(*) * 100 as chipped_percentage
    FROM Zoo.Animals
    GROUP BY animal_spiecies;

SELECT * FROM ANIMAL_STATS;

--7.5 Таблица представления информации со стастистикой о экскурсиях за предыдущий год

CREATE VIEW EXCURSIONS_STATS
AS
    SELECT DISTINCT
    ep.excursion_title,
    ep.animal_spieceis,
    ep.establishment_name,
    ep.excursion_duration,
    ep.excursion_cost,
    st.amount_of_excursions,
    st.average_visitors_amount,
    st.average_rating
    FROM Zoo.Excursions_Program AS ep
    INNER JOIN
         (SELECT DISTINCT excursion_title,
                          COUNT(excursion_id)                       as amount_of_excursions,
                          AVG(amount_of_visitors)                   as average_visitors_amount,
                          AVG(rating_from_audience_after_excursion) as average_rating

          FROM Zoo.Excursions
          where excursion_date between '01/01/2021' and '12/31/2021'
          GROUP BY excursion_title) as st
    on st.excursion_title = ep.excursion_title;


--7.6 Таблица представления информации о заведениях

CREATE VIEW ESTAB_STATS
AS
    SELECT DISTINCT
    est.establishment_name,
    est.open_time,
    est.close_time,
    est.establishment_rating,
    stat.avg_payment,
    stat.amount_of_workers
    FROM Zoo.Establishments_Nearby as est
    RIGHT JOIN
        (SELECT DISTINCT   we.establishment_name,
                           AVG(e.employee_payment) as avg_payment,
                           COUNT(e.employee_id) as amount_of_workers
          FROM Zoo.Employees as e
          INNER JOIN ZOO.Workers_and_Establishments as we on we.worker_id = e.employee_id
          GROUP BY we.establishment_name
        ) as stat on est.establishment_name = stat.establishment_name;


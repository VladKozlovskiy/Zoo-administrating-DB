--8 Хранимые Процедуры ( Функции )

--8.1 Напишем функцию, которая для даты будет показывать, какие в этот день проходили экскурсии и кто их провел

CREATE OR REPLACE FUNCTION excursions_and_guides(date DATE)
    RETURNS TABLE (excursion_name VARCHAR(200), excursion_start TIME, excursion_end TIME,guide_name VARCHAR(200), guide_surname VARCHAR(200)) AS
    $$
    BEGIN
        RETURN query(
            SELECT ex.excursion_title, ex.excursion_start, ex.excursion_end,guide.employee_name as guide_name, guide.employee_surname as guide_name
            FROM Zoo.Excursions as ex
            LEFT JOIN Zoo.Workers_and_excursions wae on ex.excursion_id = wae.excursion_id
            LEFT JOIN Zoo.Employees as guide on wae.worker_id = guide.employee_id
            WHERE ex.excursion_date = date
        );
    END;
    $$ LANGUAGE plpgsql;



SELECT excursions_and_guides('05/13/2022');



--8.2 Фунцкция, которая показывает, сколько экскурсий провел экскурсовод в нужный временной интервал
CREATE OR REPLACE FUNCTION amount_of_excursions(from_dt DATE, to_dt DATE, guide_name VARCHAR(200), guide_surname VARCHAR(200))
    RETURNS TABLE (amount_of_excursions bigint) AS
    $$
    BEGIN
        RETURN query (
            SELECT COUNT(*)
            FROM Zoo.Excursions as ex
            LEFT JOIN Zoo.Workers_and_excursions wae on ex.excursion_id = wae.excursion_id
            LEFT JOIN Zoo.Employees emp on emp.employee_id = wae.worker_id
            WHERE ex.excursion_date between from_dt and to_dt and emp.employee_name= guide_name and emp.employee_surname = guide_surname
        );
    END;
    $$ LANGUAGE plpgsql;

SELECT amount_of_excursions('05/01/2022','05/25/2022','Fulton','Levy' );


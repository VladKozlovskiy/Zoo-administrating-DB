--9 Триггеры
--9.1 Триггеры на удаление. Удаляет записи из зависмых таблиц

CREATE OR REPLACE FUNCTION delete_info_about_animal_() RETURNS TRIGGER AS
    $$
    BEGIN
        DELETE
        FROM Zoo.Workers_and_Animals AS animals
        WHERE animals.animal_id = OLD.animal_id;
        RETURN OLD;
    END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER delete_info_about_animal BEFORE DELETE
    ON Zoo.Animals
FOR EACH ROW
    EXECUTE PROCEDURE delete_info_about_animal_();


CREATE OR REPLACE FUNCTION delete_info_about_employee_() RETURNS TRIGGER AS
    $$
    BEGIN
        DELETE
        FROM Zoo.Workers_and_Animals AS animals
        WHERE animals.worker_id = OLD.employee_id;
        DELETE
        FROM Zoo.Workers_and_Establishments AS estabs
        WHERE estabs.worker_id = OLD.employee_id;
        DELETE
        FROM Zoo.Workers_and_Excursions AS ex
        WHERE ex.worker_id = OLD.employee_id;
        RETURN OLD;

    END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER delete_info_about_employee BEFORE DELETE
    ON Zoo.Employees
FOR EACH ROW
    EXECUTE PROCEDURE delete_info_about_employee_();

 --9.2 Триггер на добавление.
CREATE OR REPLACE FUNCTION set_vaccinated() RETURNS TRIGGER AS
    $$
    BEGIN
        Update Zoo.Animals as animals SET vaccinated=true
        WHERE animals.animal_id = NEW.animal_id;
        RETURN NEW;
    END;
    $$LANGUAGE plpgsql;

CREATE TRIGGER vaccinate
    AFTER INSERT
    ON Zoo.Animals_vaccination
    FOR EACH ROW
    EXECUTE PROCEDURE set_vaccinated();


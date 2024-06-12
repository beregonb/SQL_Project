CREATE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson varchar DEFAULT 'Dmitriy',
                                                   IN pprice numeric DEFAULT 500,
                                                   IN pdate date DEFAULT '2022-01-08') 
RETURNS varchar 
AS $$
DECLARE 
    pz_name varchar;
BEGIN
    SELECT pz.name INTO pz_name
    FROM person p
    INNER JOIN person_visits pv on p.id = pv.person_id
    INNER JOIN person_order po on pv.visit_date = po.order_date
    INNER JOIN menu m on m.id = po.menu_id
    INNER JOIN pizzeria pz on pv.pizzeria_id = pz.id
    WHERE p.name = pperson AND m.price = pprice AND pv.visit_date = pdate;

    RETURN pz_name;
END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 900,pdate := '2022-01-01');
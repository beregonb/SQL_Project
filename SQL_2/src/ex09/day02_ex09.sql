WITH female AS (
    SELECT *
    FROM person
    INNER JOIN person_order ON person.id = person_order.person_id
    WHERE person.gender = 'female')
SELECT name
FROM female
INNER JOIN menu ON female.menu_id = menu.id
WHERE menu.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT female.name
FROM female
         JOIN menu ON menu.id = female.menu_id
WHERE menu.pizza_name = 'cheese pizza'
ORDER BY name ASC;
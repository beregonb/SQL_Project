WITH not_ordered AS (
    SELECT id AS menu_id
    FROM menu
    EXCEPT
    SELECT menu_id
    FROM person_order
)
SELECT m.pizza_name, m.price, pz.name AS pizzeria_name
FROM menu m
INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
INNER JOIN not_ordered nor ON nor.menu_id = m.id
ORDER BY pizza_name, price;
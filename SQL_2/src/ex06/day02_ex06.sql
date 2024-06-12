SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
FROM person_order
INNER JOIN person ON person_order.person_id = person.id
INNER JOIN menu ON person_order.menu_id = menu.id
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person.name IN('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name;
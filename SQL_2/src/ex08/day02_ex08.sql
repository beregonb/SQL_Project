SELECT name
FROM person
INNER JOIN person_order ON person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id and pizza_name IN ('pepperoni pizza', 'mushroom pizza')
WHERE person.gender = 'male' AND person.address IN ('Moscow', 'Samara')
ORDER BY name DESC;
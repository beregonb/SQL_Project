SELECT p.address, pz.name, COUNT(pizzeria_id) AS count_of_orders
FROM person_order po
INNER JOIN person p ON po.person_id = p.id
INNER JOIN menu m ON po.menu_id = m.id
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY p.address, pz.name
ORDER BY p.address, pz.name;
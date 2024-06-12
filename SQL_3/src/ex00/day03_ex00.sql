SELECT m.pizza_name, m.price, pz.name AS pizzeria_name, visit_date
FROM person_visits pv
INNER JOIN person p ON p.id = pv.person_id AND p.name = 'Kate'
INNER JOIN pizzeria pz ON pz.id = pv.pizzeria_id
INNER JOIN menu m ON m.pizzeria_id = pz.id
WHERE price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;
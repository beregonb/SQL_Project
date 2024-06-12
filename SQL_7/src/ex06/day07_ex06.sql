SELECT pz.name, COUNT(m.pizzeria_id), ROUND(AVG(m.price)), MAX(m.price), MIN(m.price)
FROM person_order po
	JOIN menu m ON m.id = po.menu_id
	JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY pz.name
ORDER BY pz.name;
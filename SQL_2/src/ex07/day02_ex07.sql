SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON menu.pizzeria_id = pizzeria.id AND menu.price < 800
INNER JOIN person_visits ON person_visits.pizzeria_id = menu.pizzeria_id AND person_visits.visit_date = '2022-01-08'
INNER JOIN person ON person.id = person_visits.person_id AND person.name = 'Dmitriy';
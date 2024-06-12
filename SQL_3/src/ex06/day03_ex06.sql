SELECT m1.pizza_name, pz1.name AS pizzeria1_name,
                pz2.name AS pizzeria2_name, m1.price
FROM menu m1
    INNER JOIN menu m2 ON m1.pizza_name = m2.pizza_name 
                    AND m1.price = m2.price 
                    AND m1.pizzeria_id <> m2.pizzeria_id
    INNER JOIN pizzeria pz1 ON m1.pizzeria_id = pz1.id
    INNER JOIN pizzeria pz2 ON m2.pizzeria_id = pz2.id
WHERE pz1.name < pz2.name
ORDER BY m1.pizza_name;
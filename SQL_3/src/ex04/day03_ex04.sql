SELECT name
FROM pizzeria pz
CROSS JOIN (
    SELECT m.pizzeria_id
    FROM person_order po
    INNER JOIN person p ON po.person_id = p.id
    INNER JOIN menu m ON po.menu_id = m.id
    GROUP BY m.pizzeria_id
    HAVING COUNT(DISTINCT CASE WHEN p.gender = 'male' THEN p.id END) = 0
) AS pz_id
WHERE pz.id = pz_id.pizzeria_id

UNION ALL

SELECT name
FROM pizzeria pz
CROSS JOIN (
    SELECT m.pizzeria_id
    FROM person_order po
    INNER JOIN person p ON po.person_id = p.id
    INNER JOIN menu m ON po.menu_id = m.id
    GROUP BY m.pizzeria_id
    HAVING COUNT(DISTINCT CASE WHEN p.gender = 'female' THEN p.id END) = 0
) AS pz_id
WHERE pz.id = pz_id.pizzeria_id
ORDER BY name;





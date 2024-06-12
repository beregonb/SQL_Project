SELECT name, SUM(visit_order) AS total_count
FROM 
    ((SELECT pz.name, COUNT(*) AS visit_order
    FROM person_order po
    INNER JOIN menu m ON po.menu_id = m.id
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name)
    UNION ALL
    (SELECT pz.name, COUNT(*) AS visit_order
    FROM person_visits pv
    INNER JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name)) AS table_all
GROUP BY name
ORDER BY total_count DESC, name;



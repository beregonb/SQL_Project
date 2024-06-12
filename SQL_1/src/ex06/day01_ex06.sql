SELECT merg.data_of AS action_date, p.name AS person_name
FROM (
    SELECT order_date AS data_of, person_id FROM person_order
    UNION
    SELECT visit_date AS data_of, person_id FROM person_visits
) AS merg
JOIN person AS p ON merg.person_id = p.id
ORDER BY merg.data_of, p.name DESC;
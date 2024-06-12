SELECT
    (SELECT name FROM person p WHERE p.id = po.person_id) AS NAME
FROM
    person_order po
WHERE
    DATE(po.order_date) = '2022-01-07' AND po.menu_id IN (13, 14, 18);

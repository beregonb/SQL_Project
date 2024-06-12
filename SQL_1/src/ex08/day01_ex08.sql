SELECT order_date, CONCAT(name, ' (возраст:', age, ')') as person_information
FROM (SELECT person_id as id, order_date FROM person_order) table_vrem
NATURAL JOIN person
ORDER BY order_date, person_information
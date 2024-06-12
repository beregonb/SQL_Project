SELECT data::date AS missing_date
FROM (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) AS pv_visits
    RIGHT JOIN generate_series('2022-01-01'::timestamp, '2022-01-10', '1 day') AS data
        ON pv_visits.visit_date = data
WHERE pv_visits.visit_date IS NULL 
ORDER BY missing_date;
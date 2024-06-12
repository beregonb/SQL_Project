WITH updated_rates AS (
    SELECT *,
        CASE 
            WHEN EXISTS (SELECT rate_to_usd FROM currency WHERE id = b.currency_id AND updated < b.updated ORDER BY updated DESC LIMIT 1)
                THEN (SELECT rate_to_usd FROM currency WHERE id = b.currency_id AND updated < b.updated ORDER BY updated DESC LIMIT 1)
            ELSE (SELECT rate_to_usd FROM currency WHERE id = b.currency_id AND updated > b.updated ORDER BY updated LIMIT 1)
        END AS rate_to_usd
    FROM balance b
)
SELECT  
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    (SELECT DISTINCT name FROM currency WHERE id = ur.currency_id) AS currency_name,
    CAST((money * COALESCE(rate_to_usd, 1)) AS REAL) AS currency_in_usd
FROM updated_rates ur
LEFT JOIN "user" u ON u.id = ur.user_id
WHERE EXISTS (SELECT * FROM currency c WHERE c.id = ur.currency_id)
ORDER BY name DESC, lastname, currency_name;
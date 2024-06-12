WITH last_rate_cur AS (
    SELECT  id,
            name AS currency_name,
            (
                SELECT rate_to_usd
                FROM currency c
                WHERE c.updated IN (
                    SELECT MAX(c.updated)
                    FROM currency c
                ) AND b.currency_id = id
            ) AS last_rate
    FROM currency c
    JOIN balance b ON c.id = b.currency_id
    GROUP BY id, currency_name, currency_id
)
SELECT
    COALESCE(name, 'not defined') AS name,
    COALESCE(lastname, 'not defined') AS lastname,
    type,
    SUM(money) AS volume,
    COALESCE(lrc.currency_name, 'not defined') AS currency_name,
    COALESCE(lrc.last_rate, 1) AS last_rate_to_usd,
    CAST(SUM(COALESCE(money, 1) * COALESCE(last_rate, 1)) AS REAL) AS total_volume_in_usd
FROM "user" u
FULL JOIN balance b ON u.id = b.user_id
LEFT JOIN last_rate_cur lrc ON b.currency_id = lrc.id
GROUP BY type, u.id, name, lastname, currency_name, last_rate
ORDER BY name DESC, lastname, type;
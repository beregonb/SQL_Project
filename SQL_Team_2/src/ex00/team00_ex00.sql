CREATE TABLE nodes (
  point1 CHAR NOT NULL,
  point2 CHAR NOT NULL,
  cost INT NOT NULL
);

INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('b', 'a', 10),
       ('a', 'c', 15),
       ('c', 'a', 15),
       ('b', 'c', 35),
       ('c', 'b', 35),
       ('a', 'd', 20),
       ('d', 'a', 20),
       ('b', 'd', 25),
       ('d', 'b', 25),
       ('c', 'd', 30),
       ('d', 'c', 30);

WITH RECURSIVE
  ways(total_cost, last_point, tour) AS (
    SELECT  0 AS cost,
            point1,
            point1::bpchar
    FROM nodes
    WHERE point1 = 'a'
    UNION
    SELECT ways.total_cost + n.cost     AS total_cost,
          n.point2                      AS last_point, 
          ways.tour || ',' || n.point2  AS tour
    FROM nodes AS n
      JOIN ways ON n.point1 = ways.last_point
    WHERE ways.tour NOT LIKE '%' || n.point2 || '%'
  ),
  actual_ways(total_cost, last_point, tour) AS (
    SELECT total_cost, last_point, tour
    FROM ways
    WHERE length(tour) = (SELECT MAX(length(tour)) FROM ways)
  ),
  full_ways(total_cost, tour) AS (
    SELECT  total_cost + nodes.cost         AS total_cost,
            '{' || aw.tour || ',' || nodes.point2 || '}'  AS tour
    FROM actual_ways AS aw
      JOIN nodes ON nodes.point2 = 'a'
      AND  nodes.point1 = aw.last_point
  )
SELECT * FROM full_ways
WHERE total_cost = (SELECT MIN(total_cost) FROM full_ways)
ORDER BY total_cost, tour
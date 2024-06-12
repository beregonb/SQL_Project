CREATE FUNCTION fnc_persons_female()
RETURNS SETOF TEXT 
AS $$
	SELECT name FROM person WHERE gender='female';
$$ LANGUAGE SQL;

CREATE FUNCTION fnc_persons_male()
RETURNS SETOF TEXT 
AS $$
	SELECT name FROM person WHERE gender='male';
$$ LANGUAGE SQL;

-- SELECT *
-- FROM fnc_persons_male();

-- SELECT *
-- FROM fnc_persons_female();
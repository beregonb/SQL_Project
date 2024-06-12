DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE FUNCTION fnc_persons(IN pgender varchar DEFAULT 'female') 
RETURNS SETOF TEXT 
AS $$
	SELECT name FROM person WHERE gender = pgender;
$$ LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
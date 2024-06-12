CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE (fibonacci_num numeric)
AS $$
DECLARE
    result   numeric := 0;
    previous numeric := 1;
BEGIN
    WHILE result < pstop LOOP
        fibonacci_num := result;
        RETURN NEXT;
        result := result + previous;
        previous := fibonacci_num;
    END LOOP;
    
    RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci();
SELECT * FROM fnc_fibonacci(100);
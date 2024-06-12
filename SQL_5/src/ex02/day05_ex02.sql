CREATE INDEX idx_person_name ON person (UPPER(name));

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE SELECT name
		FROM person
		WHERE UPPER(name) = 'KATE';
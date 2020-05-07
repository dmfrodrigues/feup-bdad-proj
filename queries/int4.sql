.mode	columns
.headers	on
.nullvalue	NULL

SELECT name FROM (SELECT vat FROM Client INTERSECT SELECT vat FROM Employee) NATURAL JOIN Person;
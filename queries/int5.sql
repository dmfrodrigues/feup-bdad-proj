.mode	columns
.headers	on
.nullvalue	NULL

SELECT name FROM (SELECT issuer, count(*) as result FROM Bill GROUP BY issuer ORDER BY result desc limit 1),Person WHERE issuer=Person.vat;
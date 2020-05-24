.mode	columns
.headers	on
.nullvalue	NULL

SELECT name, registers FROM (SELECT issuer, count(*) as registers FROM Bill GROUP BY issuer ORDER BY registers desc limit 1),Person WHERE issuer=Person.vat;
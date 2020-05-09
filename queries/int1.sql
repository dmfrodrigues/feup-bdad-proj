.mode	columns
.headers	on
.nullvalue	NULL

SELECT name, date(timeBegin) as date, (julianday(timeEnd) - julianday(timeBegin)) * 24 AS OrderDuration FROM Person INNER JOIN Order_ ON Person.vat=Order_.postman ORDER BY name;
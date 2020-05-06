.mode	columns
.headers	on
.nullvalue	NULL

SELECT name, date(timeBegin), (julianday(timeEnd) - julianday(timeBegin)) * 24 FROM Person INNER JOIN Order_ ON Person.vat=Order_.postman ORDER BY name;
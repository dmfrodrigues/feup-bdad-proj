.mode	columns
.headers	on
.nullvalue	NULL

SELECT Person.name as Postman_Name, count(*) as Number_of_Orders FROM Order_, Postman, Person WHERE Postman.vat=Person.vat AND Order_.timeEnd like '%2020-07-%' AND Order_.postman=Postman.vat GROUP BY Person.name ORDER BY count(*) DESC;
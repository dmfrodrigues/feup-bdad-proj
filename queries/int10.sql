.mode	columns
.headers	on
.nullvalue	NULL

SELECT town, count(*) as numberOfClients FROM ZipCode WHERE code in (SELECT zipCode FROM Address, Person, Employee WHERE Address.id==Person.address AND Person.vat==Employee.vat) GROUP BY town ORDER BY count(*) DESC;
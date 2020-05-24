.mode	columns
.headers	on
.nullvalue	NULL

SELECT name as Employee_Name FROM Employee NATURAL JOIN Person WHERE salary > (SELECT avg(salary) FROM Employee) GROUP BY Employee.vat;
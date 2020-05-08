.mode	columns
.headers	on
.nullvalue	NULL

SELECT name, salary, postOffice FROM Person NATURAL JOIN Employee ORDER BY salary desc;
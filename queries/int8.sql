.mode	columns
.headers	on
.nullvalue	NULL

SELECT name as Employee_name, salary as Salary, postOffice as Post_Office_id FROM Person NATURAL JOIN Employee ORDER BY salary desc;
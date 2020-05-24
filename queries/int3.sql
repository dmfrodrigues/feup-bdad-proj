.mode	columns
.headers	on
.nullvalue	NULL

SELECT name 
FROM Client NATURAL JOIN Person 
WHERE Person.vat NOT IN (SELECT consumer FROM Bill WHERE strftime('%Y', timeIssue) = strftime('%Y', 'now'));
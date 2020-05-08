.mode	columns
.headers	on
.nullvalue	NULL

SELECT PostalService.name, PostOffice.name, PostOffice.id FROM PostOffice,PostalService WHERE hq==id;
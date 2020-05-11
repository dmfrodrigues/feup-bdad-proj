.mode	columns
.headers	on
.nullvalue	NULL

SELECT PostalService.name as Postal_Service, PostOffice.name as Headquarters_Name, PostOffice.id as HQ_PostOffice_id FROM PostOffice,PostalService WHERE hq=id;
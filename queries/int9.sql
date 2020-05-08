.mode	columns
.headers	on
.nullvalue	NULL

SELECT PostalService.name as Postal_Service_Name, sum(Bill.price) as Net_Profit FROM PostalService, Bill, Employee, PostOffice WHERE (PostOffice.id==Employee.postOffice AND Bill.issuer==Employee.vat);
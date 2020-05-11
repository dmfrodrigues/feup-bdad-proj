.mode	columns
.headers	on
.nullvalue	NULL

SELECT CatalogItem.description as Product_Description, BillItem.amount as Number_of_items, BillItem.amount * BillItem.priceThen as Net_Profit FROM BillItem NATURAL JOIN CatalogItem WHERE BillItem.catalogItem=CatalogItem.id ORDER BY BillItem.amount DESC;
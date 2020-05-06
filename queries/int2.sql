.mode	columns
.headers	on
.nullvalue	NULL

SELECT vehicle, sum(weight) FROM Order_ LEFT JOIN Delivery ON Order_.id=Delivery.order_ GROUP BY Order_.id;
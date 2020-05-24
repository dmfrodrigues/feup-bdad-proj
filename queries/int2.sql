.mode	columns
.headers	on
.nullvalue	NULL

SELECT Order_.id, vehicle, sum(weight) AS totalWeight FROM Order_ LEFT JOIN Delivery ON Order_.id=Delivery.order_ GROUP BY Order_.id;
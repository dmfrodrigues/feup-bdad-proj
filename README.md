# BDAD

![test](https://github.com/dmfrodrigues/feup-bdad-proj/workflows/test/badge.svg)

To create povoar.sql, run
```bash
./create-povoar.sh
```

# Notes

Get category name for `Delivery` with `id=2`
```sql
SELECT name FROM (
    SELECT name,min(maxWeight) FROM Category WHERE maxWeight>=(
        SELECT weight FROM Delivery WHERE id=2
    )
);
```

# ToDo
## Triggers

- [x] Calculate Bill price
- [x] If stamp, delivery must be light
- [ ] When inserting/updating a Postman, check if he's already a Manager or ShopKeeper
- [ ] Check if lightDelivery is being made by motorbike, and generalOrder by a van
- [ ] Addresses of people and stores must have a NULL personName

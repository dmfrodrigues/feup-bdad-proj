rm -f povoar.sql
python3 data/zip-codes/parse_zipcodes.py < data/zip-codes/todos_cp/todos_cp.csv >> povoar.sql
cat data/postal-services.sql >> povoar.sql
cat data/post-offices.sql >> povoar.sql
cat data/persons.sql >> povoar.sql
cat data/prices.sql >> povoar.sql

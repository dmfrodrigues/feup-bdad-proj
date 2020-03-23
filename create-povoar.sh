rm -f povoar.sql
python3 data/zip-codes/parse_zipcodes.py < data/zip-codes/todos_cp/todos_cp.csv >> povoar.sql

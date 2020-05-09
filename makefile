DATABASE=ctt.db

all: ctt.db

ctt.db:
	sqlite3 ctt.db ".read criar.sql"
	sqlite3 ctt.db ".read gatilho1_adiciona.sql"
	sqlite3 ctt.db ".read gatilho2_adiciona.sql"
	sqlite3 ctt.db ".read gatilho3_adiciona.sql"
	sqlite3 ctt.db ".read povoar.sql"

clean:
	rm -f ctt.db

test: clean
	make testqueries
	make testtriggers

testqueries: ctt.db
	sqlite3 ctt.db ".read queries/int1.sql"
	sqlite3 ctt.db ".read queries/int2.sql"
	sqlite3 ctt.db ".read queries/int3.sql"
	sqlite3 ctt.db ".read queries/int4.sql"
	sqlite3 ctt.db ".read queries/int5.sql"
	sqlite3 ctt.db ".read queries/int6.sql"
	sqlite3 ctt.db ".read queries/int7.sql"
	sqlite3 ctt.db ".read queries/int8.sql"
	sqlite3 ctt.db ".read queries/int9.sql"
	sqlite3 ctt.db ".read queries/int10.sql"

testtriggers: ctt.db	
	sqlite3 ctt.db ".read gatilho1_remove.sql"
	sqlite3 ctt.db ".read gatilho2_remove.sql"
	sqlite3 ctt.db ".read gatilho3_remove.sql"
	
	sqlite3 ctt.db ".read gatilho1_adiciona.sql"
	sqlite3 ctt.db ".read gatilho2_adiciona.sql"
	sqlite3 ctt.db ".read gatilho3_adiciona.sql"
	
	./expect.sh 0 "sqlite3 ctt.db \".read gatilho1_verifica.sql\""
	./expect.sh 1 "sqlite3 ctt.db \".read gatilho2_verifica.sql\""
	./expect.sh 1 "sqlite3 ctt.db \".read gatilho3_verifica.sql\""

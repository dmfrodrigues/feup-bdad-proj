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
	echo Testqueries

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

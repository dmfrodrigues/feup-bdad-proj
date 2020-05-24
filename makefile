DATABASE=ctt.db
ZIPNAME=feup-bdad-proj-delivery3

all: povoar.sql ctt.db

povoar.sql: create-povoar.sh
	./create-povoar.sh


ctt.db:
	sqlite3 ctt.db ".read criar.sql"
	sqlite3 ctt.db ".read triggers/gatilho1_adiciona.sql"
	sqlite3 ctt.db ".read triggers/gatilho2_adiciona.sql"
	sqlite3 ctt.db ".read triggers/gatilho3_adiciona.sql"
	sqlite3 ctt.db ".read povoar.sql"

clean:
	rm -f ctt.db
	rm -f povoar.sql

test: clean
	make testqueries
	make testtriggers

testqueries: all
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

testtriggers: all	
	sqlite3 ctt.db ".read triggers/gatilho1_remove.sql"
	sqlite3 ctt.db ".read triggers/gatilho2_remove.sql"
	sqlite3 ctt.db ".read triggers/gatilho3_remove.sql"
	
	sqlite3 ctt.db ".read triggers/gatilho1_adiciona.sql"
	sqlite3 ctt.db ".read triggers/gatilho2_adiciona.sql"
	sqlite3 ctt.db ".read triggers/gatilho3_adiciona.sql"
	
	./expect.sh 0 "sqlite3 ctt.db \".read triggers/gatilho1_verifica.sql\""
	./expect.sh 1 "sqlite3 ctt.db \".read triggers/gatilho2_verifica.sql\""
	./expect.sh 1 "sqlite3 ctt.db \".read triggers/gatilho3_verifica.sql\""

report_delivery3.pdf: report_delivery3.tex uml2.png
	latexmk --shell-escape report_delivery3.tex -pdf

zip: povoar.sql report_delivery3.pdf
	rm -rf $(ZIPNAME)
	rm -f $(ZIPNAME).zip
	mkdir $(ZIPNAME)
	cp -r queries triggers criar.sql povoar.sql README.md report_delivery3.pdf $(ZIPNAME)
	zip --symlinks $(ZIPNAME).zip -r $(ZIPNAME)
	rm -rf $(ZIPNAME)

testzip: zip
	rm -rf $(DEST)/$(ZIPNAME)
	unzip $(ZIPNAME).zip -d $(DEST)
	make -C $(DEST)/$(ZIPNAME)/ test
	rm -rf $(DEST)/$(ZIPNAME)

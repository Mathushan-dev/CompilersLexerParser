LANG = SC
VERJFLEX = 1.8.2
VERCUP = 11b
TESTCASES := $(shell find 'tests' -name '*.s')

all: bin/$(LANG).class

bin/$(LANG).class: src/Lexer.lex src/Parser.cup src/$(LANG).java
	mkdir -p bin
	java -jar lib/jflex-$(VERJFLEX).jar -d src/ src/Lexer.lex
	java -jar lib/java-cup-$(VERCUP).jar -destdir src/ -parser Parser src/Parser.cup
	javac -cp lib/java-cup-$(VERCUP)-runtime.jar -sourcepath src/ -d bin/ src/$(LANG).java

TESTS = $(TESTCASES)
.PHONY: test $(TESTCASES) 
test: $(TESTCASES)
	@./check_tests.py
	@echo done
$(TESTS):	clobber_csv
	echo $@ >> result.csv
	./run_tests.sh $(VERCUP) $(LANG) $@

.PHONY: clobber_csv
clobber_csv:
	echo > result.csv

clean:
	rm -rf src/Lexer.java src/Lexer.java~ src/sym.java src/Parser.java bin/*.class

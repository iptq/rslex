AR := ar
CC := clang
LEX := flex
YACC := bison
CFLAGS := -g -std=c11

all: librslexparser.a

librslexparser.a: lexer.o parser.o lib.o
	$(AR) r -o $@ $^

y.tab.c y.tab.h: rslex.y
	$(YACC) -d -o y.tab.c $^

lex.yy.c: rslex.l
	$(LEX) --header-file=lex.yy.h -o $@ $^

lexer.o: lex.yy.c y.tab.h
	$(CC) -c $(CFLAGS) -o $@ $<

parser.o: y.tab.c
	$(CC) -c $(CFLAGS) -o $@ $^

lib.o: lib.c
	$(CC) -c $(CFLAGS) -o $@ $^

clean:
	rm -f *.a *.o y.tab.* lex.yy.*

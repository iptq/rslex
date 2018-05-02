AR := ar
CC := clang
LEX := flex
YACC := bison
CFLAGS := -g -std=c11

all: librslexparser.a

librslexparser.a: lib.o lexer.o parser.o
	$(AR) r -o $@ $^

y.tab.c: rslex.y
	$(YACC) -d -o $@ $^

lex.yy.c: rslex.l
	$(LEX) -o $@ $^

lexer.o: lex.yy.c y.tab.c
	$(CC) -c $(CFLAGS) -o $@ $<

parser.o: y.tab.c
	$(CC) -c $(CFLAGS) -o $@ $^

lib.o: lib.c
	$(CC) -c $(CFLAGS) -o $@ $^

clean:
	rm -f *.a *.o y.tab.* lex.yy.*

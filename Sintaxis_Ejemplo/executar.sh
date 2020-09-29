flex Lexico_ClasePractica.l
bison -dyv Sintactico_ClasePractica.y
gcc lex.yy.c y.tab.c -o compilador
./compilador PruebaSintClasePractica.txt
rm lex.yy.c
rm y.tab.c
rm y.output
rm y.tab.h
rm compilador
%{
#include <stdio.h>
#include <stdlib.h>
FILE  *yyin;
int yylval;
char *yyltext;


int yyerror(void);

%}

%option noyywrap  
%option yylineno 

DIGITO			[0-9]
LETRA			[a-zA-Z]

ID                {LETRA}({LETRA}|{DIGITO})*
CTE_CADENA        \"([^\"\\\\]|\\\\.)*\"
CTE_ENTERA        {DIGITO}+
CTE_REAL          ([0-9]*\.[0-9]+|[0-9]+)
PUNTO_COMA        [";"]
COMA              [","]
OP_AS   		      [":"]
OP_SUM		        ["+"]
OP_MUL            ["*"]
OP_DIV            ["/"]
COMP_MAYOR        [">"]
COMP_MENOR        ["<"]
COMP_MENOR_IGUAL  ["<="]
COMP_DISTINTO     ["!="]

LLAVE_A           ["{"]
LLAVE_C           ["}"]
PARENTESIS_A      ["("]
PARENTESIS_C      [")"]


%%

"DECVAR"              printf("\nDECVAR  (%s)", yytext);
"ENDDEC"              printf("\nENDDEC  (%s)", yytext);
"write"               printf("\nWRITE   (%s)", yytext);
"Integer"             printf("\nINTEGER (%s)", yytext);
"Float"               printf("\nFLOAT   (%s)", yytext);

"while"               printf("\nWHILE (%s)", yytext);
"if"                  printf("\nIF (%s)", yytext);
"else"                printf("\nELSE (%s)", yytext);

{COMA}                printf("\nCOMA (%s)", yytext);
{PUNTO_COMA}          printf("\nPUNTO_COMA (%s)", yytext);
{LLAVE_A}             printf("\nLLAVE_A (%s)", yytext);
{LLAVE_C}             printf("\nLLAVE_C (%s)", yytext);
{PARENTESIS_A}        printf("\nPARENTESIS_A (%s)", yytext);
{PARENTESIS_C}        printf("\nPARENTESIS_C (%s)", yytext);


{CTE_ENTERA}          printf("\nCTE_ENTERA (%s)", yytext); 
{CTE_REAL}            printf("\nCTE_REAL (%s)", yytext);  
{CTE_CADENA}          printf("\nCTE_CADENA (%s)", yytext);  

{ID}                  printf("\nID (%s)", yytext);

{COMP_MENOR}          printf("\nCOMP_MENOR (%s)", yytext);

{COMP_MENOR_IGUAL}    printf("\nCOMP_MENOR_IGUAL (%s)", yytext);
{COMP_DISTINTO}       printf("\nCOMP_DISTINTO (%s)", yytext);
{COMP_MAYOR}          printf("\nCOMP_MAYOR (%s)", yytext);


{OP_SUM}		          printf("\nOP_SUM (%s)", yytext);
{OP_AS}			          printf("\nOP_AS (%s)", yytext);
{OP_MUL}		          printf("\nOP_MUL (%s)", yytext);
{OP_DIV}              printf("\nOP_DIV (%s)", yytext);

"\n"      		
"\t"
"\n\t"
"\r\n"
" "          
.                     yyerror();		

%%

int main(int argc,char *argv[])
{
  if ((yyin = fopen(argv[1], "rt")) == NULL)
  {
  	printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
  }
  else
  {
	  yylex();
  }
  fclose(yyin);
  return 0;
}

int yyerror(void)
{
   printf("Error léxico: Caracter inválido: %s\n", yytext);
	 exit (1);
}








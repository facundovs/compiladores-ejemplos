/* this is the scanner example from the JLex website
   (with small modifications to make it more readable) */

%%

%public

%{
//  private int comment_count = 0;
%}

%line
%column
%unicode
%type Symbol

ALPHA=[A-Za-z]
DIGIT=[0-9]

%%

<YYINITIAL> {

  "," { System.out.println(","); return (new Symbol(0, "COMMA", yytext(), yyline, yycolumn, yycolumn + 1)); }
  "." { System.out.println("."); return (new Symbol(1, "DOT", yytext(), yyline, yycolumn, yycolumn + 1)); }
}

. {
  System.out.println("Illegal character: <" + yytext() + ">");
	Utility.error(Utility.E_UNMATCHED);
}


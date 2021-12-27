// JFlex example from the user Manual

package jflex.examples.minijava;

import java_cup.runtime.Symbol;

/** Lexer of a very minimal version of the Java programming language. */

%%

%public
%class Lexer
%unicode
%cup
%line
%column
%throws UnknownCharacterException
%eofval{
  return symbol(ParserSym.EOF);
%eofval}

%{
  StringBuffer string = new StringBuffer();

  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
  }
%}


LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]

/* comments */
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
// Comment can be the last line of the file, without line terminator.
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*

Identifier = [:jletter:] [:jletterdigit:]*
IntegerConstant = [0-9]+

%state STRING

%%


/* keywords */

<YYINITIAL> {
  "Program"                      { return symbol(ParserSym.PROGRAM); }
  "Integer"                      { return symbol(ParserSym.INTEGER); }

  /* identifiers */
  {Identifier}                   { return symbol(ParserSym.IDENTIFIER); }


  /* Constants */
  {IntegerConstant}              { return symbol(ParserSym.INTEGER_CONSTANT); }

  /* operators */
  "="                            { return symbol(ParserSym.EQ); }
  "=="                           { return symbol(ParserSym.EQEQ); }
  "+"                            { return symbol(ParserSym.PLUS); }

  /* comments */
  {Comment}                      { /* ignore */ }

  /* whitespace */
  {WhiteSpace}                   { /* ignore */ }
}


/* error fallback */
[^]                              { throw new UnknownCharacterException(yytext()); }

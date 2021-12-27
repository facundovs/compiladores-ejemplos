/** The tokens returned by the scanner. */
class Symbol {
  public int index;
  public String token;
  public String lexeme;
  public int lineNumber;
  public long columnNumberBegin;
  public long columnNumberEnd;


  public Symbol(int index, String token, String lexeme, int lineNumber, long columnNumberBegin, long columnNumberEnd) {
    this.index = index;
    this.token = token;
    this.lexeme = lexeme;
    this.lineNumber = lineNumber;
    this.columnNumberBegin = columnNumberBegin;
    this.columnNumberEnd = columnNumberEnd;
  }

  public int getIndex() {
    return index;
  }

  public String getToken() {
    return token;
  }

  public String getLexeme() {
    return lexeme;
  }

  public int getLineNumber() {
    return lineNumber;
  }

  public long getColumnNumberBegin() {
    return columnNumberBegin;
  }

  public long getColumnNumberEnd() {
    return columnNumberEnd;
  }
}

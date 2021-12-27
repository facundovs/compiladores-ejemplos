package jflex.examples.minijava;

class UnknownCharacterException extends Exception {
  private static final long serialVersionUID = -8839023592847976068L;

  UnknownCharacterException(String unknownInput) {
    super("Unknown character « " + unknownInput + " »");
  }
}

%%

%unicode 5.1
%public
%class UnicodeUppercase_5_1

%type int
%standalone

%include ../../resources/common-unicode-all-enumerated-property-java

%%

<<EOF>> { printOutput(); return 1; }
[:uppercase:] { setCurCharPropertyValue("Uppercase"); }
[^[:uppercase:]] { setCurCharPropertyValue("Not-Uppercase"); }

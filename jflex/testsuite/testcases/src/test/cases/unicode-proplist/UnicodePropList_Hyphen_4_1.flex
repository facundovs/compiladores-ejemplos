%%

%unicode 4.1
%public
%class UnicodePropList_Hyphen_4_1

%type int
%standalone

%include ../../resources/common-unicode-all-binary-property-java

%%

\p{Hyphen} { setCurCharPropertyValue(); }
[^] { }

<<EOF>> { printOutput(); return 1; }

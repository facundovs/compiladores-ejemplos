%%

%unicode 6.2
%public
%class UnicodePropList_White_Space_6_2

%type int
%standalone

%include ../../resources/common-unicode-all-binary-property-java

%%

\p{White_Space} { setCurCharPropertyValue(); }
[^] { }

<<EOF>> { printOutput(); return 1; }

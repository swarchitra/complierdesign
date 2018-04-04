%{
   #include<stdio.h>
   #include "y.tab.h"
%}

%%

int {return INT;}
float {return FLOAT;}
double {return DOUBLE;}
char {return CHAR;}
"{" {return OPEN;}
"}" {return CLOSE;}
"(" {return OP;}
")" {return CP;}
[A-Za-z_]+[0-9A-Za-z_]* {yylval = yytext;return ID;}
; {return SC;}
, {return COMMA;}
\n {return NL;}
. {}
%%

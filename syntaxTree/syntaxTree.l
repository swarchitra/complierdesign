%{
#include"y.tab.h"
%}
%%
[A-Za-z_][A-Za-z0-9_]*  return ID;
[0-9]+			{yylval = (int)yytext;return INT;}
"="		        return ASSIGN;
"+"			return ADD;
"-"			return SUB;
"*"			return MULTIPLY;
"/"			return DIVIDE; 
"^"			return POWER;
;			return END;
"("			return OP;
")"			return CP;
[.\n\t]                 ;
%%
int yywrap(){
  return 1;
}

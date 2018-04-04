%{
	#include<stdio.h>
	#include "y.tab.h"
	
%}

%%
[ \t\n]
int|float|char|double				yylval.s = strdup(yytext);return KEY ;
[a-zA-Z_][a-zA-Z0-9_]* 				yylval.s = strdup(yytext);return ID;
[0-9]+						yylval.s = strdup(yytext);return NUM;
;						return SC;
,						return COM;
"{"						return OB;
"}"						return CB;
"["						return OS;
"]"						return CS;
"="						return EQ;
"+"						return ADD;
"-"						return SUB;
"*"						return MUL;
"/"						return DIV;
"("						return OP;
")"						return CP;
%%

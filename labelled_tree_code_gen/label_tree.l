%{
#include "label_tree.c"
#include "y.tab.h"
#include<stdio.h>
int yywrap(void);
%}
IDENTIFIER [A-Za-z_][A-Za-z0-9_]* 
%%
=  {	
		ECHO; 
		return ASSIGN;
	}
;   {
		ECHO;
		return SC;
	}
[+] {	
		ECHO;
		return PLUS;
	}
[-] {	
		ECHO;
		return MINUS;
	}
[%] {	
		ECHO;
		return MOD;
	}
[/] {		ECHO;
		return DIV;
	}
[*] {	ECHO;
		return MUL;
	}
[(] {
		ECHO;
		return LP;
	}
[)] {		
		ECHO;
		return RP;
	}
[0-9]+ {	
			yylval.num = strdup(yytext);
			ECHO;
			return NUM;
		}
{IDENTIFIER} {
				yylval.str=strdup(yytext);
				ECHO;
				return ID;
			}
[\n\t] {}
. {printf("Invalid character");}
%%
int yywrap(void){
	return 0;
}
/*int main(){
	while(1){	
	   yylex();
	}
}*/

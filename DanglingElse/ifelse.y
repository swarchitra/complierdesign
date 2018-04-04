%{
#include <stdio.h>
#include <stdlib.h>
extern FILE* yyout;
FILE* yyin;
%}
%token ID NUM IF ELSE  SC OPR B
%%

S      	: ST ST1 {printf("Input accepted.\n");exit(0);};
ST      : ifstmt 
	| elsestmt 
        |
        ;
ifstmt	: IF B E B ST1 {fprintf(yyout,"else{}");}
	;
elsestmt: IF B E B ST1 ELSE ST1  {fprintf(yyin,"\n");}
        ;
ST1  	: B ST1 B {printf("here");}
	| ST
        | E SC
        ;
E    	: E OPR E
        | ID
        | NUM
        ;

%%
int main()
{
  yyin = fopen("input.txt","r");
  yyout = fopen("out.txt","w");
  yyparse();

}
void yyerror(char* s){
 
} 


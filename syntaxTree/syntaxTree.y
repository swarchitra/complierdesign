%{
#include<stdio.h>
#include<malloc.h>
#include<string.h>
FILE* yyin;
typedef struct node{
   struct node* LEFT;
   struct node* RIGHT;
   char* value;
 }NODE;
NODE* make_node(NODE* left,NODE* right,char* val);
void print_syntax_tree(NODE* tree);
#define YYSTYPE struct node*
%}


%token INT ID ADD SUB MULTIPLY DIVIDE POWER ASSIGN END OP CP
%left ADD SUB
%left MULTIPLY DIVIDE
%right POWER
%%
S:      S E
	|E 
	;
E:	exp END{printf("valid");print_syntax_tree($1);printf("\n");}
exp:	TERM 		    {$$ = $1;}
	| exp ADD TERM	    {$$ = make_node($1,$3,"+");}
	| exp SUB TERM      {$$ = make_node($1,$3,"-");}
	| exp MULTIPLY TERM {$$ = make_node($1,$3,"*");}
	| exp DIVIDE TERM   {$$ = make_node($1,$3,"/");} 
	| exp POWER TERM    {$$ = make_node($1,$3,"^");} 
	| SUB TERM	    {$$ = make_node(0,$2,"-");} 	    
	;
TERM:   INT 		    {$$=make_node(NULL,NULL,(char*)yylval);}
	| OP exp CP         {$$ = $2;}
	;
%%
int main(){
 yyin = fopen("input.txt","r");
 yyparse();
 return 0;
}
NODE* make_node(NODE* left,NODE* right,char* val){
 NODE* newNode = (NODE*)malloc(sizeof(NODE));
 char* value = (char*)malloc(sizeof(val)+1);
 strcpy(value,val);
 newNode->LEFT = left;
 newNode->RIGHT = right;
 newNode->value = value;
 return newNode;
 }

void print_syntax_tree(NODE* TREE){
 if(TREE==NULL) return;
 printf("%s",TREE->value); 
 print_syntax_tree(TREE->LEFT);
 print_syntax_tree(TREE->RIGHT);
}
int yyerror(char* s)
{printf("ERROR HAI");}

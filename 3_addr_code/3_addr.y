%{
	#include<stdio.h>
	#include<string.h>
	int yylex();
	void yyerror(char *s);
	int tempno=0;
	typedef enum{INT,FLOAT,CHAR,DOUBLE}TYPE;
	typedef struct {char name[20];char type[10];}SYM;
	typedef struct symbolTable{SYM sym[100]; int size;}SYMTAB;
	SYMTAB s;
	char type[10]=" ";
	char rhs_exp[40]=" ";
	void add_symbol(SYMTAB*,char*,char*);
	void print_sym_tab(SYMTAB);
	typedef struct node{char addr[10],array[10];int type;}NODE;
	NODE* makeNode();
	NODE* makeNode1(char*);
	char ins[100][100];
	int n=0;
		

%}
%token KEY ID SC COM OB CB OS CS NUM EQ ADD SUB MUL DIV OP CP
%union{
	char* s;
	struct node *n;
}

%start start
%type<s> ID
%type<s> KEY
%type<s> NUM
%type<n> EXP
%type<n> ASS
%type<n>  T F
%type<n> L
%type<n> R 
%%
start	: OB BLOCK CB {}
	;

BLOCK	: DECL BLOCK 
	| ASS  BLOCK
	| {}
	;

DECL	: KEY ID ARR {add_symbol(&s,$1,$2);strcpy(type,$1);}
	  ID_DEC {} SC DECL
        |
	;

ID_DEC	: COM ID {add_symbol(&s,type,$2);} ID_DEC
	| 
	;

ARR	: OS NUM CS ARR
	|
	;
 
ASS	: ID EQ EXP SC {sprintf(ins[n],"%s = %s \n",$1,$3->addr);n++;}
	| L EQ R SC {sprintf(ins[n],"%s[%s] = %s\n",$1->array,$1->addr,$3->addr);n++;}
	;

L	:ID OS EXP CS  { $$=makeNode();strcpy($$->array,$1);sprintf(ins[n],"%s = %s * %d\n",$$->addr,$3->addr,get_width($1));n++; }
        |L OS EXP CS   { NODE* temp=makeNode();$$=makeNode();strcpy($$->array,$1->array);
		          $$->type=$1->type;sprintf(ins[n],"%s = %s * %d\n",temp->addr,$3->addr,get_width($1));n++;
		          sprintf(ins[n],"%s = %s + %s\n",$$->addr,$1->addr,temp->addr);n++;
			}
	 
	;

R	: EXP{$$=$1;}
	;


EXP	: EXP ADD EXP {$$=makeNode();sprintf(ins[n],"%s = %s + %s\n",$$->addr,$1->addr,$3->addr);n++;}
	| EXP SUB T {$$=makeNode();sprintf(ins[n],"%s = %s - %s\n",$$->addr,$1->addr,$3->addr);n++;}
	| T {$$=$1;}
	| L {$$=makeNode();sprintf(ins[n],"%s = %s[%s]\n",$$->addr,$1->array,$1->addr);n++;}
	;

T	: T MUL F {$$=makeNode();sprintf(ins[n],"%s = %s * %s\n",$$->addr,$1->addr,$3->addr);n++;}
	| T DIV F{$$=makeNode();sprintf(ins[n],"%s = %s / %s\n",$$->addr,$1->addr,$3->addr);n++;}
	| F {$$=$1;}
	;

F	: OP EXP CP {$$=$2;}
	| ID {$$=makeNode1($1);}
	| NUM {$$=makeNode1($1);}
	| SUB F {$$=makeNode();sprintf(ins[n],"%s = - %s \n",$$->addr,$2->addr);n++;}
	;

%%
int main(){
	s.size=0;
	yyparse();
	int i;
	for(i=0;i<n;i++)
		printf("%d :%s",i,ins[i]);
	//printf("The symbol table of the block is\n");
	//print_sym_tab(s);
}
void add_symbol(SYMTAB *s,char* name,char* type){

	strcpy(s->sym[s->size].name,name);
	strcpy(s->sym[s->size].type,type);
	s->size+=1;
}

void print_sym_tab(SYMTAB s){
	for(int i=0;i<s.size;i++)
		printf("%s - %s\n",s.sym[i].name,s.sym[i].type);
}
void yyerror(char* s){
	printf("syntax error");
}

int get_width(SYMTAB s,char *name){
	int i;
	char type[10]="";
	for(;i<s.size;i++){
		if(strcmp(s.sym[i].name,name)==0)
			strcpy(type,s.sym[i].type); 	
	}
	if(strcmp(type,"int")){return 4;}
	if(strcmp(type,"char")){return 1;}
	if(strcmp(type,"float")){return 4;}
	if(strcmp(type,"double")){return 8;}
	return -1;

}


NODE* makeNode(){
	NODE* temp=NULL;
	temp = (NODE*)malloc(sizeof(NODE)*1);
	char t[10];
	sprintf(t,"T%d",tempno);
	tempno+=1;
	strcpy(temp->addr,t);
	return temp;
}

NODE* makeNode1(char* t){
	NODE* temp = (NODE*)malloc(sizeof(NODE));
	strcpy(temp->addr,t);
	return temp;
}

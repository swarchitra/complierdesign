%{
   #include<stdio.h>
   #include<stdlib.h>
   #include<malloc.h>
   #include<string.h>
   int yylex();
   FILE* yyin;
   typedef struct {
   	int type;
   	char name[100];
   	int blockNo;
   	}SYM;
  typedef struct{
  	SYM sym[100];
  	int size;
   	}SYMTAB;
   SYMTAB* s;
   int x=0;
   char temp[100];
   void yyerror(const char* s);
   char type[4][10] = {"int","char","double","float"};
%}

%token ID INT FLOAT DOUBLE CHAR SC COMMA NL OPEN CLOSE OP CP
%start S1
%%
S1:S2 {return;};
S2: OPEN S2 CLOSE{x++;}| S2 S2 |S|NL|%empty;
S: A {display(s);};
A: B NL A|B NL| B|B A;
B: INT I SC | FLOAT F SC|CHAR CH SC|DOUBLE D SC|FUNC;
I: I COMMA ID { strcpy(temp,(char*)$3);insert_sym(0,temp,x);}|ID { strcpy(temp,(char*)$1);insert_sym(0,temp,x);};
CH: CH COMMA ID { strcpy(temp,(char*)$3);insert_sym(1,temp);}|ID { strcpy(temp,(char*)$1);insert_sym(1,temp);};
D: D COMMA ID { strcpy(temp);,(char*)$3);insert_sym(2,temp);}|ID { strcpy(temp,(char*)$1);insert_sym(2,temp);};
F: F COMMA ID { strcpy(temp,(char*)$3);insert_sym(3,temp);}|ID { strcpy(temp,(char*)$1);insert_sym(3,temp);};
FUNC: TYPE ID OP DEC CP SC ;
TYPE: INT|FLOAT|DOUBLE|CHAR;
DEC: TYPE ID DEC|COMMA DEC |%empty;
%% 
void yyerror (char const *s) {
   printf (stderr, "%s\n", s);
 }
int main(){
  s = (SYMTAB*) malloc(sizeof(SYMTAB));
  s->size = 0;
  yyin = fopen("a.txt","r");
  yyparse(););
  display(s);
 return 1;
 }
SYMTAB* create_tab(){
   SYMTAB* s;
   s = (SYMTAB*) malloc(sizeof(SYMTAB));
   s->size = 0;
   return s;
}
void display(SYMTAB* s){
 int i;);
 printf("TYPE---NAME---BLKNO\n");
 for(i=0;i<s->size;i++){
   printf("%s-----%s---%d\n",type[s->sym[i].type],s->sym[i].name,x);
  }
}
int find(SYMTAB* s,char* name,int type){
 if(s->size==0) return 0;
 int i;
 for(i=0;i<s->size;i++){
   if(strcmp(name,s->sym[i].name)==0)
     {
        if(type==s->sym[i].type)
          return 1;//re dec
        else
          return 2;//multi dec
   }
 }
  return 0;
}
void insert_sym(int type,char* name,int x){
 SYM sym = {type,name,x};
 int res = find(s,name,type);
 if(res==0){
  s->sym[s->size].type = type;
  strcpy(s->sym[s->size].name,name);
  s->sym[s->size].blockNo = x--;
  s->size++;
  }
  else
   {
      if(res==1) printf("redeclaration of %s\n",name);
      if(res==2) printf("multi declaration of %s\n",name);
    }
}



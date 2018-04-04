#include<stdio.h>
#include<stdlib.h>
#include<string.h>
typedef struct node{
	char data[300];
	int label;
	struct node* left;
	struct node* right;
}NODE;
NODE* createNode(char* data,NODE* left,NODE* right){
	NODE* N = (NODE*)malloc(sizeof(NODE));
	strcpy(N->data,data);
	N->left = left;
	N->right = right;
	return N;
}
void postOrder(NODE* N){
	if(N==NULL) return;
	postOrder(N->left);
	postOrder(N->right);
	printf("DATA:%s  LABEL:%d  \n",N->data,N->label);
}
void labelTree(NODE* N){
	if(N==NULL) return;
	if(N->left == NULL && N->right ==NULL){
		N->label = 1;
		return;
	}
	labelTree(N->left);
	labelTree(N->right);
	int l = N->left->label;
	int r = N->right->label;
	if( l == r ){
		N->label = l + 1;
	}
	else{
		N->label = l > r ? l : r; 
	}
}
void genCode(NODE* N,int b){
	if(N->left==NULL && N->right==NULL){
		printf("MOV %d,%s\n",b,N->data);
		return;
	}
	int left = N->left->label;
	int right = N->right->label;

		char* op;
		if(strcmp(N->data,"+")==0) op="ADD";
		if(strcmp(N->data,"-")==0) op="SUB";
		if(strcmp(N->data,"*")==0) op="MUL";
		if(strcmp(N->data,"/")==0) op="DIV";
		if(strcmp(N->data,"%")==0) op="MOD";
		//printf("op->%s",op);


	if(left == right){
		int k = left;
		genCode(N->right,b+1);
		genCode(N->left,b);
		printf("%s R%d R%d R%d\n",op,b+k,b+k-1,b+k);	

	}else{
		int k = N->label;
		int m = left < right ?left:right;
		genCode(N->right,b);
		genCode(N->left,b);
		printf("%s R%d R%d R%d\n",op,b+k-1,b+m-1,b+k-1);	
	}

}

/*int main(){
	NODE *n1,*n2,*n3,*n4,*n5;
	n1 = createNode("a",NULL,NULL);
	n2 = createNode("b",NULL,NULL);
	n3 = createNode("+",n1,n2);
	n4 = createNode("c",NULL,NULL);
	n5 = createNode("-",n3,n4);
	postOrder(n5);
}*/

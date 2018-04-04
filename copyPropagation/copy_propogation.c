#include<iostream>
#include<stdio.h>
#include<string>
#include<vector>
#include<map>
#include<fstream>
using namespace std;

vector<string> split(string str, string delim){
   vector<string> tokens;
    size_t prev = 0, pos = 0;
    do
    {
        pos = str.find(delim, prev);
        if (pos == string::npos) pos = str.length();
        string token = str.substr(prev, pos-prev);
        if (!token.empty()) tokens.push_back(token);
        prev = pos + delim.length();
    }
    while (pos < str.length() && prev < str.length());
    return tokens;
}

string find_table(vector< pair<string,string> >table,string s){
	vector< pair<string,string> > ::iterator it=table.begin();
	while(it!=table.end()){
		//cout<<it->first<<"@"<<s;
		if(it->first==s){
			return it->second;
		}
		it++;
	}	
	return "no";
}

void update(vector< pair<string,string > > *table,string s,string r){
	vector< pair<string,string> > ::iterator it=table->begin();
	int pos=0;
	while(it!=table->end()){
		//cout<<it->first<<"@"<<s;
		if(it->first==s){
			it->second=r;
			//cout<<"hi";
			return;
		}
		it++;
	}	
	
	table->push_back(make_pair(s,r));


}
void print_table(vector< pair<string,string> > table){
	vector< pair<string,string> > ::iterator it=table.begin();

	int pos=0;
	while(it!=table.end()){
		cout<<it->first<<"---"<<it->second<<endl;
		it++;
		pos++;
	}	
	return;
}

int main()
{
 
  string code;
  ifstream in;
  in.open("in.txt");
  vector< pair<string,string> > table;
  while(true){
  	getline(in,code);
	if(code=="END") break;
  	int i;
  	string de=string("=");	
  	vector<string> v = split(code,de);
  	if(v.size()==2){
	string lhs=v[0];
	string rhs=v[1];
	string replace = find_table(table,rhs);
	if(replace!="no"){ cout<<lhs<<"="<<replace<<endl;update(&table,lhs,replace);}
	else{cout<<lhs<<"="<<rhs<<endl;table.push_back(make_pair(lhs,rhs));update(&table,lhs,rhs);}
	if()
	
   }
 }
  
  

}

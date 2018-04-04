This folder contains all the programs solved in the Compiler Design Laboratory. 

The programs were complied and executed in Ubuntu 16.04.

To run these programs two tools are required...

  1)lex
  
  2)yacc
  
To install lex:

  sudo apt-get install flex

To install yacc:

  sudo appt-get install bison
  
Both these tools are mandatory for the execution of the programs.

The lex file is stored using  ".l" extension
The yacc file is stored using ".y" extension
Each subfolder consists of a lex file, yacc file, c files(optional),input files and output files.

How to compile and execute the code???

  1) compile the lex file -------> lex file_name.l
  
  2) compile the yacc file ------>  yacc -d filename.y
  
  3) Type the command ------------> gcc lex.yy.c y.tab.c -ll -ly
  
  4) Run using the command---------> ./a.out

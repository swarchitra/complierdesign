Lab Exercise Description:
 Input: C declarations
 Output: Symbol Table for the declarations
 ADT Used:  SYM and SYMTAB
    SYM---->  structure of symbol name,symbol type and block number
    SYMTAB--> structure of array of SYM
 Algorithm:
    1) The parser reads the input.txt file
    2) It gets the tokens from the symbolTable.l file and the yacc file checks for valid declarations of variables, array and functions.
    3) It identifies variable names and inserts it into the symbol table
    4) If the symbol already exists                  -> Multiple Declaration Error
    5) If the symbol is redeclared as another type   -> Redeclaration Error
    6) Display the symbol table after reading the entire file

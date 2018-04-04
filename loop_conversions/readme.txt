Loop_conversions Description:
    This programs checks for valid for, while and do while loops. And also converts for loop and do while loop into while loop.
    
    1) The yacc program "loop.y" reads the input file and the lex file sends the tokens to the parser. The syntax is checked.
    2) A for loop is transformed into while loop as follows:
        consider->
                    for(ST1;ST2;ST3){}
        
        is converted as->
        
                    ST1
                    while(ST2){
                      ST3
                    }
     3) A do while loop is converted into while loop as follows:
          consider->
                    do{}while(ST);
          
          is converted as ->
          
                    while(ST){}

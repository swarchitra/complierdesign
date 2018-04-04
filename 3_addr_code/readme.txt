Three_Address_code Generation

    Input   : Block of declarations and expressions.
    Output  : Three address code for the block of statements
    DS used : NODE -> this contains name of the variable and its type
    
    Example:
          {
            int a,b,c,d;
            a = 1;
            b = 2;
            c = 3;
            d = 4;
            a = b + c * d;
           }
           
   Output:
            a = 1
            b = 2
            c = 3
            d = 4
            T0 = c * d
            T1 = b + T0 
            a = T1
    
    

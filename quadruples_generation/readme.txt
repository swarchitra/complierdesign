Quadruples Generation

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
            = 1 a
            = 2 b
            = 3 c
            = 4 d
            * c d T0
            + b T0 T1
            = T1 a
            
            

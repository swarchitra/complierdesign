Copy_propagation Description:
  Input : Copy statements
  Output: Modified statements
  
  Example:
          a = b
          c = a
          d = c
   
   Here a table is maintained that holds the list of variables having same values.
   If any variable is reassigned, then the variable is taken from the list
   
   Output:
          a = b
          c = b
          d = b
          

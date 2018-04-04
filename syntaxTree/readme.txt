SyntaxTree Description:
    Input:                Expression
    Output:               Syntax Tree
    DataStructure used :  Tree 
    Example:
                 input :         1+2*3
                 
                 output:         +
                                / \ 
                               1   *
                                  / \
                                 2   3
                                 
    The algorithm for converting expression into syntax tree is:
        1) If operands are leaf nodes.
        2) When an operator is the root and its child are the operands of the operator.
        
      

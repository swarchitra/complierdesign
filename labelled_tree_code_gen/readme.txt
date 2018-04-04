Labelled Tree Code generation:
      Input:   Expressions
      Output:  Labelled Tree and Machine Level Code for the three address statement
      DS used: Tree
      
      Construction of labelled tree from syntax tree
        1) Assign all leaf nodes a label "1"
        2) The label of other nodes is calculated as follows:
            -> if both the children have same label then label of parent = label of child+1
            -> if both the children have different label then label of parent = max(label of children)
            
This programs assumes that number of registers available for expression evaluation is equal to the label of the root node of tree.
      

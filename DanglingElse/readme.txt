Dangling Else Description:
 Dangling else is a statement that contains only if statement but no matching else. This makes the grammar ambiguous. An Example of
dangling else is,
      if(condition)
        statement1
      if(condition)
        statement2
      else
        statement
Here the else can be matched with either the first or the second if condition. Thus an ambiguity.This happens only in nested if blocks.
This program identifies an if with no else and adds an empty else to avoid confusion.  
 
 1) The lex program "ifelse.l" identifies the tokens in a if else statement.
 2) The yacc program "ifelse.y" checks if the if else statement matches the grammar rules.
 3) If a dangling else is identified then append an empty else block there
  

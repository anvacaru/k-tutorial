module LESSON-04-EX3

  syntax Exp ::= "true" | "false"
  syntax Tree ::= "Leaf" Exp
                | "Left" Tree [prefer]
                | "Left" Tree "Right" Tree
endmodule
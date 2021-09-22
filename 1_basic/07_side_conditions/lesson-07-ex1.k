module LESSON-07-EX1
  imports BOOL
  imports INT

    syntax Bool ::= isEven ( Int ) [function]
 // -----------------------------------------
    rule isEven(X) => true requires X %Int 2 ==Int 0
    rule isEven(_) => false [owise]
endmodule
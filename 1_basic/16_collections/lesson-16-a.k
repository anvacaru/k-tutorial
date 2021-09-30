module LESSON-16-A-SYNTAX
  imports INT-SYNTAX
  imports ID-SYNTAX

  syntax Exp ::= Id | Int
  syntax Stmt ::= Id "=" Exp ";" [strict(2)]
  syntax Decl ::= "int" Id "=" Exp ";" [strict(2)]
                | Stmt
  syntax Pgm ::= List{Decl,""}
endmodule

module LESSON-16-A
  imports LESSON-16-A-SYNTAX
  imports BOOL

  configuration <T>
                  <k> $PGM:Pgm </k>
                  <state> .Map </state>
                </T>

  // declaration sequence
  rule <k> D:Decl P:Pgm => D ~> P ...</k>
  rule <k> .Pgm => . ...</k>

  // variable declaration
  rule <k> int X:Id = I:Int ; => . ...</k>
       <state> STATE => STATE [ X <- I ] </state>

  // variable lookup
  rule <k> X:Id => I ...</k>
       <state>... X |-> I ...</state>

  // variable assignment
//  rule <k> X:Id = I:Int ; => . ...</k>
//       <state> STATE => STATE [ X <- I ] </state>

  rule <k> X:Id = I:Int ; => . ...</k>
       <state>... X |-> (_ => I) ...</state>

  syntax Bool ::= isKResult(K) [symbol, function]
  rule isKResult(_:Int) => true
  rule isKResult(_) => false [owise]
endmodule

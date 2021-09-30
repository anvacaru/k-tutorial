module LESSON-16-B-SYNTAX
  imports INT-SYNTAX
  imports ID-SYNTAX
  imports STRING-SYNTAX

  syntax Exp ::= Id "(" ")" | Int | String
  syntax Stmt ::= "return" Exp ";" [strict]
                | "stackTrace" ";"
  syntax Decl ::= "fun" Id "(" ")" "{" Stmt "}"
  syntax Pgm ::= List{Decl,""}
  syntax Id ::= "main" [token]
endmodule

module LESSON-16-B
  imports LESSON-16-B-SYNTAX
  imports BOOL
  imports LIST
  imports STRING
  imports ID

  configuration <T>
                  <k> $PGM:Pgm ~> main () </k>
                  <functions> .Map </functions>
                  <fstack> .List </fstack>
                </T>

  // declaration sequence
  rule <k> D:Decl P:Pgm => D ~> P ...</k>
  rule <k> .Pgm => . ...</k>

  // function definitions
  rule <k> fun X:Id () { S } => . ...</k>
       <functions>... .Map => X |-> S ...</functions>

  // function call
  syntax KItem ::= stackFrame(Id, K)
  rule <k> X:Id () ~> K => S </k>
       <functions>... X |-> S ...</functions>
       <fstack> .List => ListItem(stackFrame(X, K)) ...</fstack>

  // return statement
  rule <k> return I:Exp ; ~> _ => I ~> K </k>
       <fstack> ListItem(stackFrame(_, K)) => .List ...</fstack>

  // stackTrace statement

  rule <k> stackTrace ; => return printStackTrace(LS) ; ... </k>
       <fstack> LS </fstack>

  syntax String ::= printStackTrace(List) [function]
  rule printStackTrace(.List) => ""
  rule printStackTrace(ListItem(stackFrame(I:Id, _)) L) => Id2String(I) +String " " +String printStackTrace(L)

  syntax Bool ::= isKResult(K) [function, symbol]
  rule isKResult(_:Int) => true
  rule isKResult(_:String) => true
  rule isKResult(_) => false [owise]
endmodule

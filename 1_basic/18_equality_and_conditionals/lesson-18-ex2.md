
```k
module CALCULATOR-SYNTAX
  imports BOOL-SYNTAX
  imports INT-SYNTAX
  imports ID-SYNTAX



  syntax Stmt ::= "return" Exp ";" [strict]
                | Id "=" Exp ";" [strict(2)]
                | "if" "(" Exp ")" "{" Stmts "}" [strict(1)]

  syntax Stmts ::= List{Stmt, ""}
  syntax Decl ::= "fun" Id "(" ")" "{" Stmts "}"
                | "int" Id "=" Exp ";" [strict(2)]
                | "bool" Id "=" Exp ";" [strict(2)]

  syntax Decls ::= List{Decl,""}

  syntax Id ::= "main" [token]

  syntax Exp ::= Bool | Int | Id "(" ")" | Id
               | "(" Exp ")" [bracket]
               > "!" Exp     [color(cyan)]
               > left:
                 Exp "*" Exp [seqstrict, color(yellow)]
               | Exp "/" Exp [seqstrict, color(yellow)]
               > left:
                 Exp "+" Exp [seqstrict, color(yellow)]
               | Exp "-" Exp [seqstrict, color(yellow)]
               > left:
                 Exp "<"  Exp [seqstrict, color(green)]
               | Exp "<=" Exp [seqstrict, color(green)]
               | Exp ">"  Exp [seqstrict, color(green)]
               | Exp ">=" Exp [seqstrict, color(green)]
               | Exp "==" Exp [seqstrict, color(green)]
               | Exp "!=" Exp [seqstrict, color(green)]
               > left:
                 Exp "&&" Exp [seqstrict, color(cyan)]
               | Exp "^"  Exp [seqstrict, color(cyan)]
               | Exp "||" Exp [seqstrict, color(cyan)]
               | Exp "->" Exp [seqstrict, color(cyan)]

endmodule
```

```k
module CALCULATOR
  imports CALCULATOR-SYNTAX
  imports INT
  imports BOOL
  imports ID
  imports SET
  imports LIST
  imports K-EQUAL
  configuration <T>
                  <k> $PGM:Decls ~> main () </k>
                  <state> .Map </state>
                  <declared> .Set </declared>
                  <functions> .Map </functions>
                  <fstack> .List </fstack>
                </T>

  // declaration sequence
  rule <k> D:Decl P:Decls => D ~> P ...</k>
  rule <k> S:Stmt P:Stmts => S ~> P ...</k>
  rule <k> .Decls => . ...</k>
  rule <k> .Stmts => . ...</k>

  // variable declaration
  rule <k> int X:Id = I:Int ; => . ...</k>
       <state> STATE => STATE [ X <- I ] </state>
       <declared> D => D SetItem(X) </declared>
    requires notBool X in D

  // variable declaration
  rule <k> bool X:Id = I:Bool ; => . ...</k>
       <state> STATE => STATE [ X <- I ] </state>
       <declared> D => D SetItem(X) </declared>
    requires notBool X in D

  // function definitions
  rule <k> fun X:Id () { S } => . ...</k>
       <functions>... .Map => X |-> S ...</functions>

  // function call
  syntax KItem ::= stackFrame(K)
  rule <k> X:Id () ~> K => S </k>
       <functions>... X |-> S ...</functions>
       <fstack> .List => ListItem(stackFrame(K)) ...</fstack>

  // variable lookup
  rule <k> X:Id => I ...</k>
       <state>... X |-> I ...</state>
       <declared>... SetItem(X) ...</declared>

  // return statement
  rule <k> return I:Exp ; ~> _ => I ~> K </k>
       <fstack> ListItem(stackFrame(K)) => .List ...</fstack>

  // assignment statement
  rule <k> X:Id = I:Exp ; => . ...</k>
       <state>... X |-> (_ => I) ...</state>

  // if statement
  rule <k> if ( B:Bool ) { S:Stmts } => #if B #then S #else . #fi ... </k>

  rule <k> A >  B => A  >Int  B ...</k>
  rule <k> A >= B => A >=Int  B ...</k>
  rule <k> A <  B => A  <Int  B ...</k>
  rule <k> A <= B => A <=Int  B ...</k>
  rule <k> A:Int == B:Int => A ==Int  B ...</k>
  rule <k> A:Int != B:Int => A =/=Int B ...</k>

  rule <k> A:Bool == B:Bool => A ==Bool  B ...</k>
  rule <k> A:Bool != B:Bool => A =/=Bool B ...</k>

  rule <k> A - B => A -Int   B ...</k>
  rule <k> A + B => A +Int   B ...</k>
  rule <k> A * B => A *Int   B ...</k>
  rule <k> A / B => A divInt B ...</k> requires B =/=Int 0

  rule <k> ! B    =>   notBool B ...</k>
  rule <k> A && B => A andBool B ...</k>
  rule <k> A ^ B  => A xorBool B ...</k>
  rule <k> A || B => A orBool  B ...</k>
  rule <k> A -> B => A impliesBool B ...</k>

  syntax Bool ::= isKResult(K) [function, symbol]
  rule isKResult(_:Int) => true
  rule isKResult(_:Bool) => true
  rule isKResult(_) => false [owise]
```

```k
endmodule
```
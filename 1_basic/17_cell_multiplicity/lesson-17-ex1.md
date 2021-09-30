
```k
module CALCULATOR-SYNTAX
  imports BOOL-SYNTAX
  imports INT-SYNTAX
  imports ID-SYNTAX



  syntax Stmt ::= "return" Exp ";" [strict]
                | Id "=" Exp ";" [strict(2)]

  syntax Stmts ::= List{Stmt, ""}
  syntax Decl ::= "fun" Id "(" ")" "{" Stmts "}"
                | "int" Id "=" Exp ";" [strict(2)]
                | "bool" Id "=" Exp ";" [strict(2)]

  syntax Decls ::= List{Decl,""}

  syntax Id ::= "main" [token]
              | ".id" [token]

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
  imports STRING
  configuration <T>
                  <k> $PGM:Decls ~> main () </k>
                  <state> .Map </state>
                  <declared> .Set </declared>
                  <functions>
                    <function multiplicity="*" type="Map">
                      <id> .id </id>
                      <body> .Stmts </body>
                    </function>
                  </functions>
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
       <functions>
       (.Bag =>
         <function>
           <id> X </id>
           <body> S </body>
         </function>
       )
       ...
       </functions>

  // function call
  syntax KItem ::= stackFrame(K)
  rule <k> X:Id () ~> K => S </k>
       <function>
         <id> X </id>
         <body> S </body>
       </function>
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

  rule <k> A >  B => A  >Int  B ...</k>
  rule <k> A >= B => A >=Int  B ...</k>
  rule <k> A <  B => A  <Int  B ...</k>
  rule <k> A <= B => A <=Int  B ...</k>
  rule <k> A == B => A ==Int  B ...</k>
  rule <k> A != B => A =/=Int B ...</k>

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
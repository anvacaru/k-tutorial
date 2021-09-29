
```k
module CALCULATOR-SYNTAX
  imports BOOL-SYNTAX
  imports INT-SYNTAX

  syntax Exp ::= Bool | Int
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

  syntax Stmt ::= Bool ";" Exp
                | "reset" ";" Exp
endmodule
```

```k
module CALCULATOR
  imports CALCULATOR-SYNTAX
  imports INT
  imports BOOL

  configuration <k> $PGM:K </k>
                <state>
                  <flag> false </flag>
                </state>

  rule <k> B:Bool ; E => E ...</k>
       <state>
         <flag> _ => B </flag>
       </state>

  rule <k> reset ; E => E ...</k>
       (S:StateCell => <state>... .Bag ...</state>)

  rule <k> A >  B => A  >Int  B ...</k>
  rule <k> A >= B => A >=Int  B ...</k>
  rule <k> A <  B => A  <Int  B ...</k>
  rule <k> A <= B => A <=Int  B ...</k>
  rule <k> A == B => A ==Int  B ...</k>
  rule <k> A != B => A =/=Int B ...</k>

  rule <k> A - B => A -Int   B ...</k>
  rule <k> A + B => A +Int   B ...</k>
  rule <k> A * B => A *Int   B ...</k>
  rule <k> A / B => A divInt B ...</k>
       <flag> true </flag> requires B =/=Int 0
  rule <k> A / B => A /Int B ...</k>
       <flag> false </flag> requires B =/=Int 0

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
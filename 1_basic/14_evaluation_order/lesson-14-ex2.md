
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

endmodule
```

```k
module CALCULATOR
  imports CALCULATOR-SYNTAX
  imports INT
  imports BOOL

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
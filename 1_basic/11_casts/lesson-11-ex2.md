
```k
module CALCULATOR-SYNTAX
  imports BOOL-SYNTAX
  imports INT-SYNTAX


  syntax Exp ::= Bool | Int
               | "(" Exp ")" [bracket]
               > "!" Exp     [color(cyan)]
               > left:
                 Exp "*" Exp [color(yellow)]
               | Exp "/" Exp [color(yellow)]
               > left:
                 Exp "+" Exp [color(yellow)]
               | Exp "-" Exp [color(yellow)]
               > left:
                 Exp "<"  Exp [color(green)]
               | Exp "<=" Exp [color(green)]
               | Exp ">"  Exp [color(green)]
               | Exp ">=" Exp [color(green)]
               | Exp "==" Exp [color(green)]
               | Exp "!=" Exp [color(green)]
               > left:
                 Exp "&&" Exp [color(cyan)]
               | Exp "^"  Exp [color(cyan)]
               | Exp "||" Exp [color(cyan)]
               | Exp "->" Exp [color(cyan)]

  syntax Exp ::= eval (Exp) [function]
endmodule
```

```k
module CALCULATOR
  imports CALCULATOR-SYNTAX
  imports INT
  imports BOOL

  rule eval (I:Int)  => I
  rule eval (B:Bool) => B

  rule eval(A >  B) => {eval(A)}:>Int  >Int  {eval(B)}:>Int
  rule eval(A >= B) => {eval(A)}:>Int >=Int  {eval(B)}:>Int
  rule eval(A <  B) => {eval(A)}:>Int  <Int  {eval(B)}:>Int
  rule eval(A <= B) => {eval(A)}:>Int <=Int  {eval(B)}:>Int
  rule eval(A == B) => {eval(A)}:>Int ==Int  {eval(B)}:>Int
  rule eval(A != B) => {eval(A)}:>Int =/=Int {eval(B)}:>Int

  rule eval(A - B) => {eval(A)}:>Int -Int   {eval(B)}:>Int
  rule eval(A + B) => {eval(A)}:>Int +Int   {eval(B)}:>Int
  rule eval(A * B) => {eval(A)}:>Int *Int   {eval(B)}:>Int
  rule eval(A / B) => {eval(A)}:>Int divInt {eval(B)}:>Int requires {eval(B)}:>Int =/=Int 0

  rule eval (! B   ) =>                 notBool {eval(B)}:>Bool
  rule eval (A && B) => {eval(A)}:>Bool andBool {eval(B)}:>Bool
  rule eval (A ^ B ) => {eval(A)}:>Bool xorBool {eval(B)}:>Bool
  rule eval (A || B) => {eval(A)}:>Bool orBool  {eval(B)}:>Bool
  rule eval (A -> B) => {eval(A)}:>Bool impliesBool {eval(B)}:>Bool

```

```k
endmodule
```
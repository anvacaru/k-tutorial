module LESSON-13-C-SYNTAX
  imports UNSIGNED-INT-SYNTAX
  imports BOOL-SYNTAX

  syntax Val ::= Int | Bool
  syntax Exp ::= Val
               > left: Exp "+" Exp
                     | Exp "-" Exp
               > left: Exp "&&" Exp
endmodule

module LESSON-13-EX1
  imports LESSON-13-C-SYNTAX
  imports INT
  imports BOOL

  rule <k> I1:Int + I2:Int => I1 +Int I2 ...</k>
  rule <k> I1:Int - I2:Int => I1 -Int I2 ...</k>
  rule <k> B1:Bool && B2:Bool => B1 andBool B2 ...</k>

  syntax KItem ::= freezer1(Val) | freezer2(Exp)
                 | freezer3(Val) | freezer4(Exp)
                 | freezer5(Val) | freezer6(Exp)

  rule <k> E1:Val + E2:Exp => E2 ~> freezer1(E1) ...</k> [priority(51)]
  rule <k> E1:Exp + E2:Exp => E1 ~> freezer2(E2) ...</k> [priority(52)]
  rule <k> E1:Val && E2:Exp => E2 ~> freezer3(E1) ...</k> [priority(51)]
  rule <k> E1:Exp && E2:Exp => E1 ~> freezer4(E2) ...</k> [priority(52)]
  rule <k> E1:Val - E2:Exp => E2 ~> freezer5(E1) ...</k> [priority(51)]
  rule <k> E1:Exp - E2:Exp => E1 ~> freezer6(E2) ...</k> [priority(52)]

  rule <k> E2:Val ~> freezer1(E1) => E1 + E2 ...</k>
  rule <k> E1:Val ~> freezer2(E2) => E1 + E2 ...</k>
  rule <k> E2:Val ~> freezer3(E1) => E1 && E2 ...</k>
  rule <k> E1:Val ~> freezer4(E2) => E1 && E2 ...</k>
  rule <k> E2:Val ~> freezer5(E1) => E1 - E2 ...</k>
  rule <k> E1:Val ~> freezer6(E2) => E1 - E2 ...</k>
endmodule
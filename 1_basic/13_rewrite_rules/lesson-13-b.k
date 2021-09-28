module LESSON-13-B-SYNTAX
  imports UNSIGNED-INT-SYNTAX
  imports BOOL-SYNTAX

  syntax Val ::= Int | Bool
  syntax Exp ::= Val
               > left: Exp "+" Exp
               > left: Exp "&&" Exp
endmodule

module LESSON-13-B
  imports LESSON-13-B-SYNTAX
  imports INT
  imports BOOL

  rule <k> I1:Int + I2:Int ~> K:K </k> => <k> I1 +Int I2 ~> K </k>
  rule <k> B1:Bool && B2:Bool ~> K:K </k> => <k> B1 andBool B2 ~> K </k>

  syntax KItem ::= freezer1(Val) | freezer2(Exp)
                 | freezer3(Val) | freezer4(Exp)

  rule <k> E1:Val + E2:Exp ~> K:K </k> => <k> E2 ~> freezer1(E1) ~> K </k> [priority(51)]
  rule <k> E1:Exp + E2:Exp ~> K:K </k> => <k> E1 ~> freezer2(E2) ~> K </k> [priority(52)]
  rule <k> E1:Val && E2:Exp ~> K:K </k> => <k> E2 ~> freezer3(E1) ~> K </k> [priority(51)]
  rule <k> E1:Exp && E2:Exp ~> K:K </k> => <k> E1 ~> freezer4(E2) ~> K </k> [priority(52)]

  rule <k> E2:Val ~> freezer1(E1) ~> K:K </k> => <k> E1 + E2 ~> K </k>
  rule <k> E1:Val ~> freezer2(E2) ~> K:K </k> => <k> E1 + E2 ~> K </k>
  rule <k> E2:Val ~> freezer3(E1) ~> K:K </k> => <k> E1 && E2 ~> K </k>
  rule <k> E1:Val ~> freezer4(E2) ~> K:K </k> => <k> E1 && E2 ~> K </k>
endmodule
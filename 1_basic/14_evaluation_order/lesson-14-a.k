module LESSON-14-A-SYNTAX
  imports UNSIGNED-INT-SYNTAX
  imports BOOL-SYNTAX

  syntax Exp ::= Int
               | Bool
               > left: Exp "+" Exp
               | Exp "-" Exp
               > left: Exp "&&" Exp
endmodule

module LESSON-14-A
  imports LESSON-14-A-SYNTAX
  imports INT
  imports BOOL

  rule <k> I1:Int + I2:Int => I1 +Int I2 ...</k>
  rule <k> B1:Bool && B2:Bool => B1 andBool B2 ...</k>
  rule <k> I1:Int - I2:Int => I1 -Int I2 ... </k>

  syntax KItem ::= freezer1(Exp) | freezer2(Exp)
                 | freezer3(Exp) | freezer4(Exp)
                 | freezer5(Exp) | freezer6(Exp)

  rule <k> E:Exp + HOLE:Exp => HOLE ~> freezer1(E) ...</k>
    requires isKResult(E) [heat]
  rule <k> HOLE:Exp + E:Exp => HOLE ~> freezer2(E) ...</k> [heat]
  rule <k> E:Exp && HOLE:Exp => HOLE ~> freezer3(E) ...</k>
    requires isKResult(E) [heat]
  rule <k> HOLE:Exp && E:Exp => HOLE ~> freezer4(E) ...</k> [heat]
  rule <k> E:Exp - HOLE:Exp => HOLE ~> freezer5(E) ...</k>
    requires isKResult(E) [heat]
  rule <k> HOLE:Exp - E:Exp => HOLE ~> freezer6(E) ...</k> [heat]

  rule <k> HOLE:Exp ~> freezer1(E) => E + HOLE ...</k> [cool]
  rule <k> HOLE:Exp ~> freezer2(E) => HOLE + E ...</k> [cool]
  rule <k> HOLE:Exp ~> freezer3(E) => E && HOLE ...</k> [cool]
  rule <k> HOLE:Exp ~> freezer4(E) => HOLE && E ...</k> [cool]
  rule <k> HOLE:Exp ~> freezer5(E) => E - HOLE ...</k> [cool]
  rule <k> HOLE:Exp ~> freezer6(E) => HOLE - E ...</k> [cool]

  syntax Bool ::= isKResult(K) [function, symbol]
  rule isKResult(_:Int) => true
  rule isKResult(_:Bool) => true
  rule isKResult(_) => false [owise]
endmodule


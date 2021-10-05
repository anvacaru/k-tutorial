module LESSON-19-C
  imports INT
  imports BOOL

  syntax Bool ::= isEven(Int) [function]
  rule [isEven]: isEven(I) => true requires I %Int 2 ==Int 0
  rule [isOdd]: isEven(I) => false requires I %Int 2 =/=Int 0

endmodule
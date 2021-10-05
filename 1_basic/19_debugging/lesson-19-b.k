module LESSON-19-B
  imports BOOL

  syntax Bool ::= isBlue(Fruit) [function]
  syntax Fruit ::= Blueberry() | Banana()
  rule isBlue(Blueberry()) => true
  rule isBlue(Banana()) => false

  rule F:Fruit => isBlue(F)
endmodule
module LESSON-06-A
  imports BOOL

  syntax Fruit ::= Blueberry() | Banana() | Grape()
  syntax Bool ::= isBlue(Fruit) [function]

  rule isBlue(Blueberry()) => true
  rule isBlue(Banana()) => false
  rule isBlue(Grape()) => true
endmodule
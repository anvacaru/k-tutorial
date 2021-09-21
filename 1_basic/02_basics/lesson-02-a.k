module LESSON-02-A

  syntax Color ::= Yellow() | Blue() | Black() | Green()
  syntax Fruit ::= Banana() | Blueberry() | Blackberry() | Kiwi()
  syntax Color ::= colorOf(Fruit) [function]

  rule colorOf(Banana()) => Yellow()
  rule colorOf(Blueberry()) => Blue()
  rule colorOf(Blackberry()) => Black()
  rule colorOf(Kiwi()) => Green()
endmodule
module LESSON-06-EX1-SYNTAX
  imports INT-SYNTAX
syntax Int ::= "(" Int ")" [bracket]
             > left:
               Int "*" Int [function]
             | Int "/" Int [function]
             > left:
               Int "+" Int [function]
             | Int "-" Int [function]
endmodule

module LESSON-06-EX1
  imports LESSON-06-EX1-SYNTAX
  imports INT

  rule A - B => A -Int B
  rule A + B => A +Int B
  rule A * B => A *Int B
  rule A / B => A divInt B requires B =/=Int 0

endmodule
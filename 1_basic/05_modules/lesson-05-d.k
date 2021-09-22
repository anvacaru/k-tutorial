module LESSON-05-D-SYNTAX
  syntax Boolean ::= "true" | "false"
  syntax Boolean ::= "not" Boolean [function]
endmodule

module LESSON-05-D-1
  imports LESSON-05-D-SYNTAX

  rule not true => false
endmodule

module LESSON-05-D-2
  imports LESSON-05-D-SYNTAX

  rule not false => true
endmodule

module LESSON-05-D
  imports LESSON-05-D-SYNTAX
  imports LESSON-05-D-1
  imports LESSON-05-D-2

  rule not true => false
  rule not false => true
endmodule
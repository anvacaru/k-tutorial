module LESSON-12-A-SYNTAX
  imports INT-SYNTAX

  syntax Ints ::= NeList{Int,","}
endmodule

module LESSON-12-A
  imports LESSON-12-A-SYNTAX
endmodule

module LESSON-12-EX1
  imports LESSON-12-A
  imports INT

  syntax Int ::= sum(Ints) [function]
  rule sum(I:Int) => I
  rule sum(I1:Int, I2:Int, Is:Ints) => sum(I1 +Int I2, Is)
endmodule
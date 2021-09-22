requires "lesson-06-c.k"
requires "lesson-06-ex1.k"

module LESSON-07-EX2-SYNTAX
  imports LESSON-06-C-SYNTAX
  imports LESSON-06-EX1-SYNTAX

  syntax Bool ::= Int "<" Int [function]
                | Int "<=" Int [function]
                | Int ">" Int [function]
                | Int ">=" Int [function]
                | Int "==" Int [function]
                | Int "!=" Int [function]
endmodule

module LESSON-07-EX2
  imports LESSON-07-EX2-SYNTAX
  imports LESSON-06-C
  imports LESSON-06-EX1

  rule A > B => A >Int B
  rule A >= B => A >=Int B
  rule A < B => A <Int B
  rule A <= B => A <=Int B
  rule A == B => A ==Int B
  rule A != B => A =/=Int B
endmodule
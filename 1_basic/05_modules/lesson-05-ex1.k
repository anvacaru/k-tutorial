module LESSON-05-EX1-1

syntax Int ::= r"[0-9]+" [token, literal]
             | "(" Int ")" [bracket, atom]
endmodule

module LESSON-05-EX1-2

syntax Int ::="-" Int [function, uneg]
             | Int "+" Int [function, add]
             | Int "-" Int [function, sub]
endmodule

module LESSON-05-EX1-3

syntax Int ::= Int "*" Int [function, prod]
             | Int "/" Int [function, div]
endmodule


module LESSON-05-EX1
  imports LESSON-05-EX1-1
  imports LESSON-05-EX1-2
  imports LESSON-05-EX1-3

syntax priorities literal atom uneg > prod div > add sub
syntax left prod
syntax left div
syntax left add
syntax left sub
endmodule
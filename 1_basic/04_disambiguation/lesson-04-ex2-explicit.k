module LESSON-04-EX2-EXPLICIT

syntax Int ::= r"[0-9]+" [token, literal]
             | "(" Int ")" [bracket, atom]
             | "-" Int [function, uneg]
             | Int "*" Int [function, prod]
             | Int "/" Int [function, div]
             | Int "+" Int [function, add]
             | Int "-" Int [function, sub]

syntax priorities literal atom uneg > prod div > add sub
syntax left prod
syntax left div
syntax left add
syntax left sub
endmodule
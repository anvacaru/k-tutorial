module LESSON-04-EX2

syntax Int ::= r"[0-9]+" [token]
             | "(" Int ")" [bracket]
             > "-" Int [function]
             > left:
               Int "*" Int [function]
             | Int "/" Int [function]
             > left:
               Int "+" Int [function]
             | Int "-" Int [function]
endmodule
module LESSON-03-EX2

syntax Int ::= r"[0-9]+" [token]
             | "(" Int ")" [bracket]
             | Int "+" Int [function]
             | Int "-" Int [function]
             | Int "*" Int [function]
             | Int "/" Int [function]
             | "-" Int [function]
endmodule
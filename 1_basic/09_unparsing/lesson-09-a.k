module LESSON-09-A
  imports BOOL

  syntax Exp ::= "(" Exp ")" [bracket]
               | Bool
               > "!" Exp
               > right:
                 Exp "&&" Exp
               | Exp "^" Exp
               | Exp "||" Exp

  syntax Exp ::= id(Exp) [function]
  rule id(E) => E
endmodule
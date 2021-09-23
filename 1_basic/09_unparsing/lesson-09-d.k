module LESSON-09-D
  imports BOOL

  syntax Exp ::= "(" Exp ")" [bracket]
               | Bool
               > "!" Exp [color(yellow)]
               > left:
                 Exp "&&" Exp [color(red)]
               | Exp "^" Exp [color(blue)]
               | Exp "||" Exp [color(green)]

  syntax Exp ::= id(Exp) [function]
  rule id(E) => E
endmodule
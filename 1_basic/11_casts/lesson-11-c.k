module LESSON-11-C
  imports INT

  syntax Exp ::= Int | Exp "+" Exp [exp]
  syntax Exp2 ::= Exp | Exp2 "+" Exp2 [exp2]

  syntax Int ::= eval (Exp2) [function]
  rule eval(X::Int) => X
  rule eval((A + B)::Exp) => eval(A) +Int eval(B)
  rule eval((A + B)::Exp2) => eval(A) +Int eval(B)

endmodule
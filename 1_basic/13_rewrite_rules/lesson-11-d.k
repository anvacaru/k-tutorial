module LESSON-11-D
  imports INT
  imports BOOL
  imports STRING

  syntax Exp ::= Int | Bool | String | Exp "+" Exp | Exp "&&" Exp | Exp "." Exp

  syntax Exp ::= eval(Exp) [function]
  rule eval(I:Int) => I
  rule eval(B:Bool) => B
  rule eval(S:String) => S
  rule eval(E1 + E2) => {eval(E1)}:>Int +Int {eval(E2)}:>Int
  rule eval(E1 && E2) => {eval(E1)}:>Bool andBool {eval(E2)}:>Bool
  rule eval (E1 . E2) => {eval(E1)}:>String +String {eval(E2)}:>String

  rule <k> 25 + 16 => true </k>
  rule <k> 25 + 16 => false </k>
  rule <k> false => 25 </k>
endmodule
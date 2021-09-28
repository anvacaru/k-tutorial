module CONCAT-SYNTAX
  imports STRING-SYNTAX

  syntax Strings ::= List{String, ","}
  syntax String  ::= concat ( Strings ) [function]

endmodule

module CONCAT
  imports CONCAT-SYNTAX
  imports STRING

  rule concat(S:String) => S
  rule concat(S1:String, S2:String, S:Strings) => concat(S1 +String S2, S)
endmodule
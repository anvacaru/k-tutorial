module LESSON-18-EX1
  imports INT
  imports K-EQUAL


  syntax Int ::= areEqual(K,K) [function]
  rule areEqual(K1, K2) => #if K1 ==K K2 #then 0 #else 1 #fi
endmodule
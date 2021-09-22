module LESSON-07-B
  imports BOOL
  imports INT

  syntax Grade ::= "letter-A" 
                 | "letter-B"
                 | "letter-C"
                 | "letter-D"
                 | "letter-F"
                 | gradeFromPercentile(Int) [function]

  rule gradeFromPercentile(I) => letter-F requires I >=Int 0 andBool I <Int 60
  rule gradeFromPercentile(I) => letter-D requires I <Int 70 [owise]
endmodule
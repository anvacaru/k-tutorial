module LESSON-07-A
  imports BOOL
  imports INT

  syntax Grade ::= "letter-A" 
                 | "letter-B"
                 | "letter-C"
                 | "letter-D"
                 | "letter-F"
                 | gradeFromPercentile(Int) [function]

  rule gradeFromPercentile(I) => letter-A requires I >=Int 90
  rule gradeFromPercentile(I) => letter-B requires I >=Int 80 andBool I <Int 90
endmodule
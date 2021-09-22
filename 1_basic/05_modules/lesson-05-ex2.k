// kompile lesson-05-ex2.k -I ex3

requires "lesson-05-ex2-syntax.k"

module LESSON-05-EX2
  imports LESSON-05-EX2-SYNTAX

  rule contentsOfJar(Jar(F)) => F
endmodule
module LESSON-05-EX2-SYNTAX

  syntax Container ::= Jar(Fruit)
  syntax Fruit ::= Apple() | Pear()

  syntax Fruit ::= contentsOfJar(Container) [function]
endmodule
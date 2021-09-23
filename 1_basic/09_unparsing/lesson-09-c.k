module LESSON-09-C
  imports BOOL

  syntax Stmt ::= "{" Stmt "}" [format(%1%i%n%2%d%n%3),color(MediumOrchid)] | "{" "}" [format(%1%n%2),color(MediumOrchid)]
                > right:
                  Stmt Stmt [format(%1%n%2)]
                | "if" "(" Bool ")" Stmt [format(%1 %2%c%3%4%n%5), colors(DarkSeaGreen, MediumOrchid, Yellow, MediumOrchid)]
                | "if" "(" Bool ")" Stmt "else" Stmt [avoid, format(%1 %2%c%3%4%n%5%n%6%n%7), colors(DarkSeaGreen, MediumOrchid, Yellow, MediumOrchid, DarkSeaGreen)]
endmodule
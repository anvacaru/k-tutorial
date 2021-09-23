module EXERCISE-SYNTAX
  imports STRING
  imports INT

  syntax String ::= processParagraph(String) [function]
                  | process(String)          [function]
                  | takeFirstWord(String)    [function]
                  | chopWhitespace(String)   [function]
                  | chopCommas(String)       [function]
                  | firstSentence(String)    [function]
                  | restOfParagraph(String)  [function]

endmodule

module EXERCISE
  imports EXERCISE-SYNTAX

  rule processParagraph(S) => process(chopWhitespace(chopCommas(S)))

  rule process(S) => takeFirstWord(firstSentence(S)) +String process(restOfParagraph(S)) requires lengthString(restOfParagraph(S)) >Int 0
  rule process(S) => takeFirstWord(S) [owise]

  rule takeFirstWord(S) => S +String "." requires findChar(S, " ", 0) <Int 0
  rule takeFirstWord(S) => substrString(S, 0, findChar(S, " ", 0)) +String "." [owise]

  rule chopWhitespace(S) => replaceAll(S, ". ", ".")
  rule chopCommas(S)     => replaceAll(S, ",", "")

  rule firstSentence(S)   => substrString(S, 0, findChar(S, ".", 0))
  rule restOfParagraph(S) => substrString(S, findChar(S, ".", 0) +Int 1, lengthString(S))

endmodule
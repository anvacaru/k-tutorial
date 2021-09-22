requires "lesson-06-a.k"

module LESSON-06-B
  imports LESSON-06-A

  syntax Bool ::= isYellow(Fruit) [function]
                | isBlueOrYellow(Fruit) [function]
                | isBlueAndNotYellow(Fruit) [function]

  rule isYellow(Banana()) => true
  rule isYellow(Blueberry()) => false
  rule isYellow(Grape()) => true

  rule isBlueOrYellow(F) => isBlue(F) orBool isYellow(F)
  rule isBlueAndNotYellow(F) => isBlue(F) andBool notBool isYellow(F)
endmodule
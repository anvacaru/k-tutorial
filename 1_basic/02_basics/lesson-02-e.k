module LESSON-02-E

  syntax Color ::= Black() | White()
  syntax Boolean ::= True() | False()

  syntax Hat   ::= Cap(Color)
  syntax Shirt ::= Sweather(Color)
  syntax Pants ::= Jeans(Color)
  syntax Shoes ::= Sneakers(Color)

  syntax Outfit ::= Casual(Hat, Shirt, Pants, Shoes)
  syntax Boolean ::= outfitMatching(Outfit) [function]

  rule outfitMatching(Casual(Cap(C), Sweather(C), Jeans(C), Sneakers(C))) => True()
endmodule
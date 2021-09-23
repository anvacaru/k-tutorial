Calculator
----------
In this document, we're defining our own syntax and rules in order to make our own calculator.

- Booleans
First, we're defining the syntax of the Bool sort. The literals are imported from the builtin module `BOOL-SYNTAX`.
```k
module BOOL-DEFINED-SYNTAX
  imports BOOL-SYNTAX

  syntax Bool ::= "(" Bool ")" [bracket]
                > "!" Bool     [function]
                > left:
                  Bool "&&" Bool [function]
                | Bool "^"  Bool [function]
                | Bool "||" Bool [function]
                | Bool "->" Bool [function]
endmodule
```

Next, we define the rules for our syntax.
```k
module BOOL-DEFINED
  imports BOOL-DEFINED-SYNTAX
  imports BOOL

  rule ! B    =>   notBool B
  rule A && B => A andBool B
  rule A ^ B  => A xorBool B
  rule A || B => A orBool  B
  rule A -> B => A impliesBool B
endmodule
```

- Int

Defining the syntax. Again, the literals and the unary negation are imported from the builtin module.
```k
module INT-DEFINED-SYNTAX
  imports INT-SYNTAX
syntax Int ::= "(" Int ")" [bracket]
             > left:
               Int "*" Int [function]
             | Int "/" Int [function]
             > left:
               Int "+" Int [function]
             | Int "-" Int [function]
endmodule
```

Defining the rules for the syntax.
```k
module INT-DEFINED
  imports INT-DEFINED-SYNTAX
  imports INT

  rule A - B => A -Int B
  rule A + B => A +Int B
  rule A * B => A *Int B
  rule A / B => A divInt B requires B =/=Int 0

endmodule
```

- Defining comparison operators

First, we import all dependent modules in a single module.
```k
module CALCULATOR-SYNTAX
  imports BOOL-DEFINED-SYNTAX
  imports INT-DEFINED-SYNTAX
```

Then, we define the new syntax.
```k
  syntax Bool ::= Int "<"  Int [function]
                | Int "<=" Int [function]
                | Int ">"  Int [function]
                | Int ">=" Int [function]
                | Int "==" Int [function]
                | Int "!=" Int [function]
endmodule
```

- Putting it all together
```k
module CALCULATOR
  imports CALCULATOR-SYNTAX
  imports BOOL-DEFINED
  imports INT-DEFINED

  rule A >  B => A  >Int  B
  rule A >= B => A >=Int  B
  rule A <  B => A  <Int  B
  rule A <= B => A <=Int  B
  rule A == B => A ==Int  B
  rule A != B => A =/=Int B
```

```k
endmodule
```
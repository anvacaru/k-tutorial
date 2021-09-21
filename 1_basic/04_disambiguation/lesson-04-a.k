module LESSON-04-A

  syntax Boolean ::= "true" | "false"
                   | "(" Boolean ")" [bracket]
                   > "!" Boolean [function]
                   > Boolean "||" Boolean [function]
                   > Boolean "^" Boolean [function]
                   > Boolean "&&" Boolean [function]

endmodule
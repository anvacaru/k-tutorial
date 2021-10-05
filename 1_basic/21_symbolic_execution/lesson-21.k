module LESSON-21
    imports INT
    imports BOOL

    rule <k> 0 => ?X:Int ... </k> ensures ?X =/=Int 0
    rule <k> X:Int => 5  ... </k> requires X >=Int 10
    rule <k> X:Int => ?Y:Int ... </k>
      requires X >=Int 10
       andBool X %Int 2 =/=Int 0
      ensures  ?Y >Int 0
       andBool ?Y <Int 10
       andBool ?Y %Int 2 ==Int 0
endmodule
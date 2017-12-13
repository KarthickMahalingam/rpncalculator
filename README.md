# rpncalculator
Ruby script implementing RPN calculator

#### High level description:
 This mini project focuses on implementing RPN calculator with support to basic operations(+ - * /). For short term, this project supports only basic operations. This is implemented using stack when the operands gets popped when arithematic operations are fed as input for calculation. Basic arithematic errors are handled with user defined exceptions.
 
 Currently acccepted formats:
 ```
 > 5 
5
> 8
8
> +
13
```
 
#### DataStructures  used: Stack
 As we are working from right to left, we need the most recent operand to compute first. So I used stack to implement
 
 #### What I'll do if I have additional time to work?
  I'll add advanced features like accepting various input formats and extend arithematic operations. Then make it work with TCP.
  
### Trade-off's:
  This project doesn't support operator precedence. This can be fixed by get complete input operations and all the operators at the end, so that operator precedence can be maintained.
  
#### How to run the code:
  Download the code to local. rpn.rb is the driver script that makes the other calls
  Execute the code with the following command:
 ```
   ruby lib/rpn.rb
 ```

  To run the RSpec test cases:
```
  rspec spec/calculator.rb
```

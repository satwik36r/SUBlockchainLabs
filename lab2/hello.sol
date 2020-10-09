pragma solidity ^ 0.7.2;
   contract hello { /* define variable greeting of the type string */  
    string greeting;
       function greeter(string memory _greeting) public {
              greeting = _greeting;
       } 
       /* main function */
       function greet() public returns(string memory) {
              return greeting;
       }
} 

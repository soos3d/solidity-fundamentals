// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

//this smart contract allows us to store a retrieve a number

contract SimpleStorage{    

    uint256 userNumber;                   

    function store(uint256 _number) public {            // store a number in a variable
        userNumber =  _number;          
    }
    

    function retrieve() public view returns (uint256) {         // retrieve the number from the variable
        return userNumber;                          
    }
                                       
}
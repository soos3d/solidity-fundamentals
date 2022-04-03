// SPDX-License-Identifier: MIT             // The solidity compiler likes to have the licence identifier on top

pragma solidity >= 0.6.0 <0.9.0;            // Always specify what solity versions are used at the top
                                            // this is using the compiler between version 0.6.0 up 0.9.0
                                            // example: ^0.6.0; this is all version 6 

contract Variables {                        // this is a smart contract named variables

// data types variables in solidity
// variables are declared by: variableType VariableName = something

// These are state variables, available in the entire contract
int256  number = -10;                                                    // integer with a sign (+-) up to 256 bits 
uint256 anotherNumber = 5;                                               // integer without a sign (+-) up to 256 bits 
uint standardNumber = 10;                                                // if no bits capacity is specified, it's 256
bool boolean = true;                                                     // boolean variable, can be true or false 
string aString = "A String";                                             // string (text) variable
address favoriteAddress = 0x8f8e7012F8F974707A8F11C7cfFC5d45EfF5c2Ae;    // defines a wallet address
bytes32 someBytes = "bunny";                                             // converts a string in bytes up to 32 (more efficient)

// state variable visibility
// visibility can be public, internal, private

uint256 public publicNumber = 50;           // other contracts can read and modify this
uint256 internal internalNumber = 10;       // can only be modified byt the contract its in and derived contract
uint256 private privatelNumber = 100;       // like internal but the derived contracts do not access

// local variables are inside a function
// functions can be public, external, internal, public
// State mutability can be: view, pure, payable

/* functions layout: function function_name(<param_type> <param_name>) <visibility> <state mutability> [returns(<return_type>)]{ 
    ... } */ 

    function localVariable(uint _num) public pure returns(uint) {    //pure because it doesn not access the blockchain
        uint value = 10;                                             // local variables can be modified and interacted with inside the function
        value = value + _num + 5;
        return value;   
    }


//structs
    struct PeopleStruct{ 
        string name;                                                //stucts allow to store multiple variables and call them
        uint256 id;    
    }

    PeopleStruct public john = PeopleStruct("Jhon" , 20);           // initialize the struct with a var named jhon and the parameters we have set in the struct
}

// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

//this smart contract allows us to store names associated with numbers

contract Storage{                           

    struct People{ 
        string name;                       
        uint256 number;        
    }

    People[] public people;                                             // this array will hold the structs creaded by the contract

    mapping(string => uint256) public nameToNumber;                     // this mapping allows to associate a name to a number so we can search by name


    function addPerson(string memory _name, uint256 _number) public{
        people.push(People(_name, _number));                            // adds a struct People to the array
        nameToNumber[_name] = _number;                                  // adds a name and number to the mapping
    }   
    
}
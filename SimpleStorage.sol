// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

//this smart contract allows us to store numbers, names and associated numbers

contract SimpleStorage{
    
// if the variable is left blank, it's initialized as 0 
    uint256 favoriteNumber;                           // public means everyone can see and interact   

    struct People{ 
        string name;                       //stucts allow to store multiple variables and call them
        uint256 favoritenumber;
        
    }
    People[] public people;               //arrays store lists of data, this is a dynamic array[], can change size

    mapping(string => uint256) public nameToFavoriteNumber; //mapping allows to associate data from arrays to search

// This function makes changes to the blockchain and it costs gas to use (transactions)
    function store(uint256 _favoriteNumber) public { // this function accepts a uint256 called _favorite number
        favoriteNumber =  _favoriteNumber;           // the function substitutes and store the uint in favoritenumber
    }
    
//view only reads off the blockchain and dont make transactions
    function retrieve() public view returns(uint256){  
        return favoriteNumber;                          //return retursn a value 
    }

// this function adds data (name and fav number) to the array People          
// memory and storage are used to store data. memory only stores during the function call
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People(_name, _favoriteNumber));        //.push is used to add to arrays
        nameToFavoriteNumber[_name] = _favoriteNumber;       //this associates the data in the mapping
    } 
                                        
}

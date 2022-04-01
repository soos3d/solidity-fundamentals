// SPDX-License-Identifier: MIT               

pragma solidity ^0.8.13;        // always use the last available version

// conditionals handle decisions, where a conditional statment will give a true or false result
// we can trigger different instructions based on this result
// if a variable meets a condition, return true, else return false

contract Conditionals {

// function to return true if the parameter passed is bigger than 5
    function bigNumber(uint _number) public pure returns(bool){     
        if(_number > 5) {                                          // the condition returns true if it is met
            return true;
        }   
        else {
            return false;
        } 
    }

    uint[] public values = [1,3,5,3,8,32,88,0,21];    // array full of numbers
    
// function to check how many numbers are in the array 
    function howMany() public view returns (uint) {    
        uint keep_count = 0;                          // initialize a count variable 

        for(uint i = 0; i < values.length ; i++ ){    // for loop to go through all the numbers in the array
            keep_count ++;                            // add 1 to keep_count for each iteration
        }
        return keep_count;                            // be careful about the brackets
    }

// check how many numbers bigger than 5 are in the array
    function howManyBig() public view returns (uint){
        uint keep_count = 0;
        
        for(uint i = 0; i < values.length ; i++ ){    // for loop to go through all the numbers in the array
            if(bigNumber(values[i])) {                // if the number is bigger than 5 continue
                keep_count ++;                        // add 1 to keep_count if the condition is met
            }
        }
        return keep_count;                            // returns the count
    }

// more practical example, check if the address that calls the function is the owner of the contract 

    address public owner;                              // a variable containing and address naed owner

    constructor(){                                     // when the contract is created, assigns the address to the variable owner
        owner = msg.sender;
    }

// function to check if the address calling it is the owner
    function areYouOwner() public view returns(bool){       
        if(msg.sender == owner){                       
            return true;
        } else{
            return false;
        }
    }
    
    // most common conditional operators:
     
//    ! (logical negation)
//    && (logical conjunction, “and”)
//    || (logical disjunction, “or”)
//    == (equality)
//    != (inequality)
     
    // comparisons operators:

//     <=   (smaller or equal than)
//     <    (smaller than)
//     ==   (equal to)
//     !=   (different than)
//     >=   (bigger or equal than)
//     >    (bigger than)
}

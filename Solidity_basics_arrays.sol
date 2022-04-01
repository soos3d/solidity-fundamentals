// SPDX-License-Identifier: MIT               

pragma solidity ^0.8.13;

// Arrays are a list of elements, can be variables such as uint, strings, and even struct and mappings
// can be fixed size (holds a specified amount of elements) or dynamic size (elements can be added)
// uint[3] public fixeSizeArray = [1,2,3] - uint array containing 3 uint
// uint[] public dynamicArray = [1,2] - contains 2 uint but more can be added 

contract Arrays{
    uint[4] public numbersArray = [1,2,3,4];                 // fix size array containing four uint
    string[] public letterssArray = ["hello","developer"];   // dinamyc array containing strings, more can de added
    uint[] public emptyArray;                                // empty uint dinamyc array
    uint[][2] public array2D = [[1,2,3,4],[9,8,7,6]];        // 2D array, an array containing 2 arrays. max 15 nested arrays. Must be same type

// arrays indices in solidity zero-based, the first element count is 0

    function addValue(uint _number) public {                // add elements to arrays using the push method
        emptyArray.push(_number);                           // it will give an error if we try to add elements to a fix size array
    }

    function countElements() public view returns(uint){     // this function returns how many elements are in the array using the length method
        return emptyArray.length;
    }

}



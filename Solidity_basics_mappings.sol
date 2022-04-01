// SPDX-License-Identifier: MIT               

pragma solidity ^0.8.13;        // always use the last available version

// mappings are a data type in solidity, similar to a databse held on the blockchain
// it's made of keys => values pairs. Each key has a value associated to it, that can be called and used
// mappings are not zero index based, but are more similar to database staring at 1
// layout: mapping(_KeyType => _ValueType) public mappingName

contract Mappings {
    mapping(uint => string) public colors;      // mapping of numbers associated to strings (colors)

// one way to add data to mappings is a contructor function

    constructor() {          // a constructor function only runs once when the contract is created!
        colors[1] = 'red';
        colors[2] = 'yellow';
        colors[3] = 'orange';
    }
// function to add key=> value pairs to mappings

    function addColor(uint _index, string memory _color) public {   // when passing a string parameter we have to specify the memory usage (memory or calldata)
        colors[_index] = _color;
    }
// we can also use mappings to create a "database" of structs

 struct Car{
        string maker;
        string model;
    }

    mapping(uint => Car) public cars;       // mapping associating an index to a struct   

// function to add structs to the mapping
    function addCar(uint _index, string memory _maker, string memory _model) public {
        cars[_index] = Car(_maker, _model);
    }

// nested mappings can be very powerful system
    mapping(address => mapping(uint => Car)) public playerCars;

// function to add to the nested mapping
    function addPlayerCar(uint _index, string memory _maker, string memory _model) public {
        playerCars[msg.sender][_index] = Car(_maker, _model);       // msg.sender allows to capture the address of the account calling the function
    }                                                               // in this case we take it and associate it to the mapping
}
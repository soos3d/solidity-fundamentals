// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract CheckDoor {

    constructor() {
        door = DoorCondition.Open;       // this construction sets the default state of the door when the contract is created
    }

    // enum restrict how many values a variable can have

    enum DoorCondition {Closed , Open}   // this variable can only have the value Open or value Closed
    DoorCondition door;                  // declare a variable door to keep track of

    function openedDoor() public {       // this function set the door condition to Open
        door = DoorCondition.Open;
        }


    function closedDoor() public {       // this function set the door condition to Closed
        door = DoorCondition.Closed;
    }


    function getCondition() public view returns (DoorCondition){    // function to return the door condition
        return door;
    }
}
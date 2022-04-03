// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

// this contract is an evoluion of RentLamboV1 to show a better way to integrate status changes and errors
// This contract illustrates the use of enum, require, event, modifiers and payable functions applied to rent a Lambo in exchage for ETH
// this contract can be linked to an app that verifies the disponibility of the car, the appropriate payment has been receveid, and releases the keys.

    // explore the logic steps we need for such a contract
        // generate the contract with an owner address that can receive payments
        // have a way to check if the car is available or is already rented
        // have a way to receive a payment and switch the car status to rented
        // implement errors to the payment function so that it's reverted if the car is already rented or the amount provided is not enough

contract RentLambo {

    
    constructor() {                                                                     // from version 0.7.0, the visibility of the constructor function is no longer required
        contractOwner = payable(msg.sender);                                            // the owner is established at the contract deployment
        lambo = LamboConditions.Available;                                              // the Lambo status is Available by default at the contract creation
    }

    address payable public contractOwner;                                               // This address owns the contract and  receives the payments

    enum LamboConditions { Available , Rented }                                         // the variable Lambo can be either available or rented
    LamboConditions lambo;

    event Rented(address _customer, uint _amount);                                      // generate an event when the rentLambo function is triggered

    modifier statusError {
        require(lambo == LamboConditions.Available , "The Lambo is already rented");    // checks that the car is available, if not, the transaction is reverted
        _;                                                                              // this line tells the modifier to excecute the function only if the condition is met 
    }

    modifier paymentError (uint _value) {
        require(msg.value >= _value, "Not enough ETH");                                 // checks that the address calling the function is sending at least 1 ETH
        _;                                                                              // this line tells the modifier to excecute the function only if the condition is met 
    }

    function rentLambo() payable public statusError paymentError(2 ether){              // this function implements modifiers as error checks
        contractOwner.transfer(msg.value);                                              // msg.value takes the value that the address calling the function is sending
        lambo = LamboConditions.Rented;
        emit Rented(msg.sender, msg.value);                                             // emits the status change
    }


    function returnLambo() public {                                                     // changes the status back to avilable                    
        lambo = LamboConditions.Available;
    }


    function getCondition() public view returns(LamboConditions){                      // function to return the lambo status
        return lambo;
    }

// we can make the function to rent the lambo as receive(). Any time an address sends money to this contract, the function is automatically called
// the visibility is external and can only be called from outside the contract

    receive() external payable statusError paymentError(2 ether){                       
        contractOwner.transfer(msg.value);                                            
        lambo = LamboConditions.Rented;
        emit Rented(msg.sender, msg.value);
    }
}
// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

// This contract illustrates the use of enum, require, and payable functions applied to rent a Lambo in exchage for ETH
// this contract can be linked to an app that verifies the disponibility of the car, the appropriate payment has been receveid, and releases the keys.

    // explore the logic steps we need for such a contract
        // generate the contract with an owner address that can receive payments
        // have a way to check if the car is available or is already rented
        // have a way to receive a payment and switch the car status to rented
        // implement errors to the payment function so that it's reverted if the car is already rented or the amount provided is not enough

contract RentLambo {
 
    address payable public contractOwner;               // This address owns the contract and receives the payments

    enum LamboConditions { Available , Rented }         
    LamboConditions lambo;                              // the variable Lambo can be either available or rented

     constructor() public {
        contractOwner = payable(msg.sender);            // the owner is established at the contract deployment
        lambo = LamboConditions.Available;              // the Lambo status is Available by default at the contract creation
    }

// function to receive the payment and book the car
    function rentLambo() payable public { 
        require(msg.value >= 2 ether, "Not enough ETH");                                // checks that the address calling the function is sending at least 2 ETH
        require(lambo == LamboConditions.Available , "The Lambo is already rented");    // checks that the car is available, if not, the transaction is reverted

        contractOwner.transfer(msg.value);              // msg.value takes the value that the address calling the function is sending and transfer it to the owner
        lambo = LamboConditions.Rented;                 // switches the lambo satus to rented
    }

// function to set the status back to available when the lambo is returned 
        function returnLambo() public {
        lambo = LamboConditions.Available;
    }
    

    function getCondition() public view returns (LamboConditions){    // function to return the lambo condition
        return lambo;
    }
}
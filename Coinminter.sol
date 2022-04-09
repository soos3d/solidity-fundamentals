// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// this is an example of a contract to mint coins
// only the owner can call the mint function
// coins can be sent to other adresses
// based on the Coin contract as example in the solidity docs!

contract CoinMinter {
    
    address public owner;                                           // variable ti specify the owner of the contract

    mapping (address => uint) public balances;                     // mapping to associate adreses with the coin balance
    
    event Sent(address _from, address _to, uint _amount);          // Events allow external apps to listen and react to certain events

    error InsufficientBalance(uint _requested, uint _available);   // error to check if the sender has enough coins

    constructor() {
        owner = msg.sender;                                       // associates the addres creating the contract to the owner variable
    }

    
    function mint(address _receiver, uint _amount) public {       // mint and sends new coins to an address, only the owner can call this function
        require(msg.sender == owner);
        balances[_receiver] += _amount;
    }

   
    function send(address _receiver, uint _amount) public {       // send an amout of coins to a selected address
        if (_amount > balances[msg.sender])                       // if checks if the sender has enough coins
            revert InsufficientBalance({
                _requested: _amount,
                _available: balances[msg.sender]
            });

        balances[msg.sender] -= _amount;                          // remove the amount from the sender
        balances[_receiver] += _amount;                           // credits the amount to the receiver
        emit Sent(msg.sender, _receiver, _amount);                // emits the event specifing who sent, who received and how much
    }

    // get an account balance from an app outside of the contract
    function getBalances(address _account) external view returns (uint) {
    return balances[_account];
    }
}
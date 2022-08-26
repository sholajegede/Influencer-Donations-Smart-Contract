// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract SuppotrMembership {
    event Deposit(uint amount);
    event Withdraw(uint amount);
    address payable public owner;
    address payable public payments;

    constructor() {
        owner = payable(msg.sender);
        address _payments
        payments = payable(_payments);
    }

    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Creator account does not belong to you");
        emit Withdraw(address(this).balance);
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}


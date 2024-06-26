// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingExample {
    mapping(address => uint) public balances;

    function subtraction(uint a,  uint b) public pure returns (uint) {
        // Require statements
        require(a > b, "invalid subtraction");
        
        // If no error
        return (a-b);
    }

    function divide(uint numerator, uint denominator) public pure returns (uint) {
        // Assert statement
        assert(denominator != 0);
        
        // If no error
        return numerator / denominator;
    }
    
    function transfer_limit(address account, uint amount) public {
        // Initial amount in sender's account
        balances[msg.sender] = 10000;

        // Revert statement
        if (amount > 1000) {
            revert("limit exceeded");
        }

        // If no error
        balances[msg.sender] -= amount;
        balances[account] += amount;
        
    }
}

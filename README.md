# ERROR HANDLING

This program simply shows the error handling process in solidity

## Description

In this program, error handling process in solidity is demonstrated with the help of three functions. The ErrorHandlingExample contract in Solidity demonstrates various error handling techniques through its functions subtraction, divide, and transfer_limit. First, the subtraction function employs the require statement to verify that the parameter a is greater than b before performing the subtraction operation. If this condition fails, the function aborts and returns an error message, ensuring that invalid operations are prevented upfront. Similarly, the divide function utilizes assert to ensure that the denominator is not zero before executing the division operation. If denominator equals zero, an assertion error is triggered, halting further execution and preventing a division by zero error.

The transfer_limit function showcases the use of revert to manage transaction conditions. It first initializes the sender's balance and then checks if the amount being transferred exceeds a predefined limit of 1000 tokens. If the condition is met, the transaction reverts with a "limit exceeded" message, ensuring that transfers beyond the allowed threshold are rejected outright. If the amount is within the limit, the function proceeds to update the sender's and receiver's balances accordingly, demonstrating controlled token transfers while enforcing transaction constraints. These error handling mechanisms (require, assert, revert) collectively enhance the reliability and security of smart contracts by enforcing preconditions, validating internal state, and managing exceptional conditions effectively.

## Getting Started
To run and interact with the ErrorHandlingExample contract in Solidity, follow these steps using a development environment such as Remix IDE or a local setup with Truffle and Ganache:
#### Compile the Contract:

  Copy the entire Solidity code of ErrorHandlingExample into your Solidity compiler (e.g., Remix IDE). Ensure the compiler version matches the pragma statement (pragma solidity ^0.8.0;).

### Executing program
```
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
```
#### Deploy the Contract:

  Deploy the compiled contract to your chosen Ethereum network (e.g., local development network provided by Remix, Ganache, or a testnet/mainnet). Specify an account (sender) from which to deploy the contract.
#### Interact with Functions:

  Once deployed, interact with the contract through its functions:
    subtraction(uint a, uint b):
      Call this function with two integers a and b where a is greater than b. This should return the result of a - b. Try calling it with a less than or equal to b to see how the require statement prevents invalid operations.
    divide(uint numerator, uint denominator):
      Provide numerator and denominator values to perform a division operation. Ensure denominator is not zero to avoid triggering the assert statement. Attempt to divide by zero to observe how an assertion error halts execution.
    transfer_limit(address account, uint amount):
      Use this function to simulate token transfers between accounts (msg.sender and account). Before calling, ensure balances[msg.sender] has sufficient tokens (e.g., set initially to 10000 tokens).
      Try transferring amounts both below and above 1000 tokens to witness how the function handles the revert statement for exceeding the transfer limit.
#### View Contract State:

  Check the state variables like balances using the public visibility modifier. This allows you to inspect the updated balances after interacting with the transfer_limit function.
#### Transaction Confirmation:

  After each interaction (function call), confirm transactions on your chosen Ethereum client (e.g., Remix, MetaMask) to execute operations on the blockchain.
#### Error Handling Observations:

  Observe how each error handling mechanism (require, assert, revert) behaves under different conditions (invalid inputs, division by zero, exceeding limits). This provides insight into how Solidity contracts safeguard against unexpected behaviors and maintain robustness.
## Help

While callingg the transfer_limit function, ensure to use a different address than the senders adress with which, the contract is deployed.

## Authors

Harsh  Yadav
@harshyadav2005
harsh20052003@gmail.com

## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details

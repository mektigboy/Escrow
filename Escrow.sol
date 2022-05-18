// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.13;

contract Escrow {
  address agent; // Officiates transaction on the blockchain. Only person allowed to deposit funds into smart contract and withdraw them.

  mapping(address => uint) public deposits;

  modifier onlyAgent() {
    require(msg.sender == agent);
    _;
  }

  constructor () public {
    agent = msg.sender;
  }

  function deposit(address payee) public onlyAgent payable {
    uint amount = msg.value;

    deposits[payee] = deposits[payee] + amount;  // Change to SafeMath.
  }
  function withdraw(address payable payee) public onlyAgent {
    uint payment = deposits[payee];

    deposits[payee] = 0;

    payee.transfer(payment);
  }
}

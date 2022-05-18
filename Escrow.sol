// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.13;

contract Escrow {
  address agent; // Officiates transaction on the blockchain. Only person allowed to deposit funds into smart contract and withdraw them.

  mapping(address => uint) public deposits;

  constructor () public {
    agent = msg.sender;
  }

  function deposit(address payee) payable {
    uint amount = msg.value;

    deposits[payee] = deposits[payee] + amount;
  }
  function withdraw(address payable payee) public {
    uint payment = deposits[payee];

    deposits[payee] = 0;

    payee.transfer(payment);
  }
}

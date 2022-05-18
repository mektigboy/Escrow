// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.13;

contract Escrow {
  address agent; // Officiates transaction on the blockchain. Only person allowed to deposit funds into smart contract and withdraw them.

  constructor () public {
    agent = msg.sender;
  }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ShitCoin2 is ERC20 {
  constructor() ERC20("ShitCoin", "SHT2") {
    _mint(msg.sender, 2222 ether);
  }
}

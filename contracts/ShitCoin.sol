// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ShitCoin is ERC20 {
  constructor() ERC20("ShitCoin", "SHTC") {
    _mint(msg.sender, 1000);
  }
}

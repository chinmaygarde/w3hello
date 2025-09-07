// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WrappedETH is ERC20 {

  constructor()
    ERC20("WrappedETH", "WETH") {
  }

  function deposit() public payable {
    _mint(msg.sender, msg.value);
  }

  function withdraw(uint256 amount) public {
    _burn(msg.sender, amount);
    (bool success, ) = payable(msg.sender).call{value: amount}("");
    require(success, "Transfer must be successful");
  }

  receive() external payable {
    deposit();
  }
}

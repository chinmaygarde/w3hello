// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {ShitCoin} from "./ShitCoin.sol";
import {Test} from "forge-std/Test.sol";

contract ShitCoinTest is Test {
  ShitCoin coin;
  address alice = address(0xa11ce);

  function setUp() public {
    vm.prank(alice);
    coin = new ShitCoin();
    assertEq(coin.balanceOf(alice), 1000 ether);
  }

  function test_TotalSupply() public {
    assertEq(coin.totalSupply(), 1000 ether);
  }
}

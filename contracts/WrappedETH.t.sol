// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {WrappedETH} from "./WrappedETH.sol";
import {Test} from "forge-std/Test.sol";

contract WrappedETHTest is Test {
  WrappedETH weth;

  function setUp() public {
    weth = new WrappedETH();
  }

  function test_canDepositAndWithdraw() public {
    address alice = address(0xA11CE);
    vm.deal(alice, 10 ether);
    assertEq(alice.balance, 10 ether);

    vm.prank(alice);
    payable(weth).call{value: 5 ether}("");
    assertEq(alice.balance, 5 ether);
    assertEq(weth.balanceOf(alice), 5 ether);
    assertEq(address(weth).balance, 5 ether);

    vm.prank(alice);
    weth.withdraw(1 ether);
    assertEq(alice.balance, 6 ether);
    assertEq(weth.balanceOf(alice), 4 ether);
    assertEq(address(weth).balance, 4 ether);
  }
}

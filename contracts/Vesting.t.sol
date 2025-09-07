// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {Vesting} from "./Vesting.sol";
import {Test} from "forge-std/Test.sol";

contract VestingTest is Test {
  function test_CanCreateContract() public {
    address alice = address(0xa11ce);
    Vesting vesting = new Vesting(alice, block.timestamp, 100 seconds);
    assertEq(vesting.owner(), alice);
  }

  function test_CanVestOnSchedule() public {
    address alice = address(0xa11ce);
    Vesting vesting = new Vesting(alice, block.timestamp, 100 seconds);
    vm.deal(address(vesting), 100 ether);
    assertEq(address(vesting).balance, 100 ether);
    assertEq(alice.balance, 0 ether);
    vm.warp(block.timestamp + 50 seconds);
    // The release function needs to be manually called.
    assertEq(address(vesting).balance, 100 ether);
    assertEq(alice.balance, 0 ether);
    assertEq(vesting.releasable(), 50 ether);
    vesting.release();
    assertEq(address(vesting).balance, 50 ether);
    assertEq(alice.balance, 50 ether);
  }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {TaxableEarning} from "./TaxableEarning.sol";
import {Test} from "forge-std/Test.sol";

contract TaxableEarningTest is Test {
  TaxableEarning forwarder;
  address alice = address(0xa11ce);
  address bob = address(0xb0b);

  function setUp() public {
    vm.deal(alice, 10 ether);
    vm.deal(bob, 10 ether);
    vm.prank(alice);
    forwarder = new TaxableEarning();
  }

  function test_OwnerIsContractCreator() public view {
    assertEq(forwarder.recipient(), alice);
  }

  function test_EtherGetsForwardedToContractOnwer() public {
    vm.prank(bob);
    uint256 initial_balance = alice.balance;
    (bool ok, ) = payable(forwarder).call{value: 1 ether}("");
    require(ok, "Must be able to send to the contract address.");
    assertEq(alice.balance, 11 ether);
    assertEq(bob.balance, 9 ether);
  }
}

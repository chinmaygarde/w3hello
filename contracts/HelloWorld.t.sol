// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {HelloWorld} from "./HelloWorld.sol";
import {Test} from "forge-std/Test.sol";

contract HelloWorldTest is Test {
  HelloWorld hello_world;

  function setUp() public {
    hello_world = new HelloWorld();
  }

  function test_InitialValue() public view {
    string memory initial_message = hello_world.message();
    string memory fixture = "Nothing";
    assertEq(
      keccak256(bytes(initial_message)),
      keccak256(bytes(fixture)),
      "Strings should be equal."
    );
  }

  function test_SettingAValue() public {
    hello_world.SetMessage("Iroh!");
    string memory initial_message = hello_world.message();
    string memory fixture = "Iroh!";
    assertEq(
      keccak256(bytes(initial_message)),
      keccak256(bytes(fixture)),
      "Strings should be equal."
    );
  }
}

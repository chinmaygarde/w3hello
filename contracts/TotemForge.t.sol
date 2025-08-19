// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {TotemForge} from "./TotemForge.sol";
import {Test} from "forge-std/Test.sol";

contract TotemForgeTest is Test {
  TotemForge forge;
  address alice = address(0xA11CE);
  address bob = address(0xb0b);

  function setUp() public {
    vm.prank(alice);
    forge = new TotemForge();
  }

  function test_OwnerIsAlice() public view {
    assertEq(forge.owner(), alice);
  }

  function test_BobCannotMintTokens() public {
    vm.expectRevert();
    forge.mint(alice, "http://wikipedia.com");
  }

  function test_AliceCanMint() public {
    vm.prank(alice);
    forge.mint(alice, "http://wikipedia.com");
  }

  function test_TokenIndicesMoveUp() public {
    vm.prank(alice);
    uint256 wiki = forge.mint(alice, "http://wikipedia.com");
    vm.prank(alice);
    uint256 google = forge.mint(alice, "http://google.com");
    assertEq(wiki + 1, google);
  }
}

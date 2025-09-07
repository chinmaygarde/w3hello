// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/finance/VestingWallet.sol";

contract Vesting is VestingWallet {

  constructor(address beneficiary,
              uint256 start_timestamp,
              uint64 duration_seconds)
    VestingWallet(beneficiary, uint64(start_timestamp), duration_seconds) {
  }
}

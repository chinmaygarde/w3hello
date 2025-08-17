// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract TaxableEarning {
  address payable public immutable recipient;

  event TaxableEvent(address from,
                     address to,
                     uint256 amount);

  error ForwardingError();

  constructor() {
    recipient = payable(msg.sender);
  }

  receive() external payable {
    (bool ok, ) = recipient.call{value: msg.value}("");
    if (!ok) {
      revert ForwardingError();
    }
    emit TaxableEvent(msg.sender, recipient, msg.value);
  }
}

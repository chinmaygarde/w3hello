// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract HelloWorld {
  string public message = "Nothing";

  event MessageSet(string message);

  function SetMessage(string memory new_message) public {
    message = new_message;
    emit MessageSet(message);
  }
}

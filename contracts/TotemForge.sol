// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {ERC721, ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract TotemForge is ERC721URIStorage {
  address public owner;
  uint256 private last_token_;

  constructor() ERC721("TotemForge", "TTM") {
    owner = msg.sender;
  }

  function mint(address new_owner, string memory uri) public returns(uint256) {
    require(msg.sender == owner, "Only the owner can mint.");
    uint256 token_id = last_token_++;
    _mint(new_owner, token_id);
    _setTokenURI(token_id, uri);
    return token_id;
  }
}

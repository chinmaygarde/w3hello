// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract Voting {
  struct Proposal {
    string name;
    uint256 votes_for;
    uint256 votes_against;
    bool registered;
  }
  mapping(uint256 /* proposal_number */ => Proposal) public proposals;

  function CreateProposal(uint256 new_proposal_number, string memory name) public {
    require(!proposals[new_proposal_number].registered, "That proposal has already been made.");
    proposals[new_proposal_number].name = name;
    proposals[new_proposal_number].registered = true;
  }

  function CastVote(uint256 proposal_number, bool for_or_against) public {
    require(proposals[proposal_number].registered, "The proposal must exist.");
    if (for_or_against) {
      proposals[proposal_number].votes_for++;
    } else {
      proposals[proposal_number].votes_against++;
    }
  }

  function IsProposalWinning(uint256 proposal_number) public view returns(bool) {
    require(proposals[proposal_number].registered, "The proposal must exist.");
    Proposal memory p = proposals[proposal_number];
    return p.votes_for > p.votes_against;
  }

  function GetVotesFor(uint256 proposal_number) public view returns(uint256) {
    require(proposals[proposal_number].registered, "The proposal must exist.");
    return proposals[proposal_number].votes_for;
  }

  function GetVotesAgainst(uint256 proposal_number) public view returns(uint256) {
    require(proposals[proposal_number].registered, "The proposal must exist.");
    return proposals[proposal_number].votes_against;
  }
}

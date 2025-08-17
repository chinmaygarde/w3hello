// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {Voting} from "./Voting.sol";
import {Test} from "forge-std/Test.sol";

contract VotingTest is Test {
  Voting voting;

  function setUp() public {
    voting = new Voting();
  }

  function test_CanVoteOnProposals() public {
    voting.CreateProposal(1, "A");
    voting.CreateProposal(2, "B");
    voting.CreateProposal(3, "C");
    voting.CreateProposal(4, "D");
    require(voting.IsProposalWinning(1) == false);
    require(voting.IsProposalWinning(2) == false);
    require(voting.IsProposalWinning(3) == false);
    require(voting.IsProposalWinning(4) == false);
    voting.CastVote(1, true);
    require(voting.IsProposalWinning(1) == true);
    voting.CastVote(1, false);
    require(voting.IsProposalWinning(1) == false);
  }

  function test_CanGetVotesFor() public {
    voting.CreateProposal(1, "A");
    require(voting.GetVotesFor(1) == 0);
    require(voting.GetVotesAgainst(1) == 0);
    voting.CastVote(1, true);
    require(voting.GetVotesFor(1) == 1);
    require(voting.GetVotesAgainst(1) == 0);
    voting.CastVote(1, false);
    require(voting.GetVotesFor(1) == 1);
    require(voting.GetVotesAgainst(1) == 1);
  }
}

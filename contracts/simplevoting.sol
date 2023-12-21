//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Election is Ownable(msg.sender) {
    struct Candidate {
        string name;
        uint index;
        uint votecount;
    }

    struct Voter {
        string name;
        uint index;
        bool voted;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => Voter) public voters;

    constructor() {
        // Since we are initializing only
        candidates[1] = Candidate("Rahul", 1, 0);
        candidates[2] = Candidate("Priya", 2, 0);
    }

    function vote(string memory voter_name, uint candidate_index) external {
        // hasn't voted
        require(!voters[msg.sender].voted, "You have voted already");

        // has voted
        voters[msg.sender] = Voter({name: voter_name, index: candidate_index, voted: true});

        candidates[candidate_index].votecount += 1;
    }

    function getwinner() public view onlyOwner returns(uint) {
        uint maxVotes = 0;
        uint winnerIndex;

        for (uint i = 1; i <= 2; i++) {
            if (candidates[i].votecount > maxVotes) {
                maxVotes = candidates[i].votecount;
                winnerIndex = i;
            }  
        }
        return winnerIndex;
    }
}
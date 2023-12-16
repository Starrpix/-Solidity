//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/access/Ownable.sol";

contact Election is Ownable{
struct candidate{
    string name;
    uint index;
    uint votecount;
}
candidate c;
struct voter{
    string name;
    bool voted;
}
voter v;

mapping(uint => candidate) candidates;
mapping(uint => voters) voters;

constructor candidate_info(uint[] memory _index ,string[] memory _name,uint[] _votecount) candidates{
    //Since we are intializing only
   candidates[1] = candidate("Rahul",1,0);
   candidates[2] = candidate("Priya",2,0);

}

function vote(string memory voter_name,uint candidate_index) external{
   
    for(uint i=0;i<candidate_index.length;i++){
     require(!voters[msg.sender],"You have voted already");
     voters[i] = voter([voter_name],[candidate_index],[c.votecount++]);
    }
}

function getwinner() public onlyOwner returns(uint) {

}

}


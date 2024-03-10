//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe {
     uint256 public minimumUsd = 6;
function fund() public payable{
require (msg.value > minimumUsd,"Less than 1 ETH"); //1 eth
}


}
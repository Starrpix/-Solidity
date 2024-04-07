// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SafeMathTester{
    uint256 public bigNumber = 255; // newer versions : checked - older versions : unchecked

    function add() public{
        bigNumber+= 1;
    }
}
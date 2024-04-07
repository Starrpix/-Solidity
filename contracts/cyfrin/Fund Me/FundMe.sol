//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
     using PriceConverter for uint256;
     uint256 public minimumUsd = 5e18;

     address[] public funders;
     mapping(address funder => uint256 amountFunded) public addressToAmountFunded;


function fund() public payable{
require ((msg.value.getConversionRate()) > minimumUsd,"Less than 1 ETH"); //1 eth
funders.push(msg.sender);
addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
}

}
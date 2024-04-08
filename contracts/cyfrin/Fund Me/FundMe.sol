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

function withdraw() public{

     for ( uint256 funderIndex = 0 ; funderIndex < funders.length; funderIndex++) {
          address funder = funders[funderIndex];
          addressToAmountFunded[funder] = 0;

     }

     //reset the array 
     funders = new address[](0);
     //actually withdraw the funds

     //transfer 
     // msg.sender = address
     // payable(msg.sender) = payable address , typecasting 
     payable(msg.sender).transfer(address(this).balance);
     //send
    bool success = payable(msg.sender).send(address(this).balance);
    require (success,"Send Failed");
     //call
    (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
    require (callSuccess,"Call Failed");

}

}
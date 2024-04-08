//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import {PriceConverter} from "./PriceConverter.sol";

error notOwner();

contract FundMe {
     using PriceConverter for uint256;
     uint256 public constant MINIMUM_USD = 50 * 1e18;

     address[] public funders;
     mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

     address public immutable i_owner;



     constructor() {
     i_owner = msg.sender;
     }


function fund() public payable{
require ((msg.value.getConversionRate()) > MINIMUM_USD,"Less than 1 ETH"); //1 eth
funders.push(msg.sender);
addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
}


function withdraw() public onlyOwner{
     
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

modifier onlyOwner{
    // require(msg.sender == i_owner,"Must be owner");
     if(msg.sender != i_owner) {revert notOwner();}
     _;
}

// What happens if someone sends this contract ETH without calling fund function

 receive() external payable {
     fund();
  }

  fallback() external payable { 
     fund();
  }

}
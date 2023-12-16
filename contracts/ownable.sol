//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Test is Ownable{
constructor() Ownable(msg.sender) {}

function isOwner() public view onlyOwner returns(bool){
if(owner() == _msgSender() )   {
return true;
} 
else{
    return false;
}
}

}
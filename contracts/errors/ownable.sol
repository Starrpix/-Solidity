// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Test is Ownable {
    constructor() Ownable(msg.sender) {} //msg.sender required

    function IsOwner() public view onlyOwner returns(bool) {
        return owner() == _msgSender();
    }
}



//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "foundry/SimpleStorage.sol";


//We are inheriting from SimpleStorage contract
contract AddFiveStorage is SimpleStorage{

//We will be overriding the store function using virutal override
function store(uint256 _newNumber) public virtual override  {
myFavoriteNumber =_newNumber + 5 ;
}

}

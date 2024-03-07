// SPDX-License-Identifier: MIT

 
pragma solidity ^0.8.18;
//named imports
import {SimpleStorage} from "foundry/SimpleStorage.sol";

contract StorageFactory{
 //type visibility name
 SimpleStorage[] public listOfSimpleStorageContracts;

function createSimpleStorageContract() public{
    //initiates a variable for SimpleStorage named simplestorage , which stores the value of a new instance named SimpleStorage() , will assign the contract from the imported one
 SimpleStorage simplestorage = new SimpleStorage();
 listOfSimpleStorageContracts.push(simplestorage);
}

//how storage factory can actually call the storage function of SimpleStorage

function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public{
    SimpleStorage simplestorage = listOfSimpleStorageContracts[_simpleStorageIndex];
    simplestorage.store(_simpleStorageNumber);
}

function sfGet(uint _simpleStorageIndex) public view returns(uint256){
  return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
}

}

// Notes:

// We import SimpleStorage contract from SimpleStorage.sol file into StorageFactory.sol
// Inside the StorageFactory contract that we created , we create an array named listOfSimpleStorageContracts to store the lists
// We create a contract inside the StorageFactory contract by using createSimpleStorageContract() function 
// Initiates a variable for SimpleStorage named simplestorage , which stores the value of a new instance named SimpleStorage() , will assign the contract from the imported one
// We push the simplestorage variable inside the listofSimpleStorageContracts to keep track of instances
// A sfStore function is created which stores the StorageNumber and the sfGet retrieves the stored value.

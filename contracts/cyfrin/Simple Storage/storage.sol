// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Test {
    uint256 public myNumber;
   
    struct Person{
     uint256 number;
     string name;
    }

    Person[] public listOfPeople;

    mapping(string => uint256) public toNumber; 

    function getData(uint256 _number) public {
        myNumber = _number;
    }

    function getData() public view returns (uint256) {
        return myNumber;
    }


    function Store(uint256 _number, string memory _name)  public{
        Person memory newPerson = Person(_number,_name) ;
        listOfPeople.push(newPerson);
        toNumber[_name] = _number;
    }


}

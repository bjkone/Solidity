
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SimpleStorage {

   uint favoriteNumber;

   struct Car { 
        string name;
        uint age;
   }

   Car[] public listCar;

   mapping (string => uint) public carsByName;

   function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
   }

    function getFavorityNumbe() public view returns(uint256){
        return favoriteNumber;
    }
    
    function addCar(string memory _name, uint _age) public {
        listCar.push(Car(_name, _age));
        carsByName[_name] = _age;
    }
} 
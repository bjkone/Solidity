
// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SimpleStorage {

   uint favoriteNumber;

   struct Car { 
        string name;
        uint age;
   }

   Car[] listCar;

   mapping (string => uint) carsByName;

   function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
   }

    function getFavoriteNumber() public view virtual returns(uint256){
        return favoriteNumber;
    }
    
    function addCar(string memory _name, uint _age) public {
        listCar.push(Car(_name, _age));
        carsByName[_name] = _age;
    }

    function getCarByName(string memory _name) public view returns(uint256) {
        return carsByName[_name];
    }

    function getListCar(uint _indexCar) public view returns(string memory, uint256 age){
        return (listCar[_indexCar].name, listCar[_indexCar].age);
    }
} 
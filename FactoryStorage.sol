// SPDX-License-Identifier: MIT

import {SimpleStorage} from "./SimpleStorage.sol";
pragma solidity 0.8.24;


contract FactoryStorage{

    SimpleStorage[] public simpleStorageList;

    function createSimpleStorageContract() public {
        simpleStorageList.push(new SimpleStorage());
    }

    function callStore(uint256 _index, uint256 _favoriteNumber) public {
        simpleStorageList[_index].store(_favoriteNumber);
    }

    function callGetFavoriteNumber(uint256 _index) public view returns (uint256) {
        return simpleStorageList[_index].getFavoriteNumber();
    }

    function callAddCar(uint256 _index, string memory _name, uint256 _age) public {
        simpleStorageList[_index].addCar(_name, _age);
    }

    function callCarByName(uint256 _index, string memory _name) public view returns (uint256) {
        return simpleStorageList[_index].getCarByName(_name);
    }

    function callGetListCar(uint256 _index, uint256 _indexCar) public view returns(string memory, uint256){
        return simpleStorageList[_index].getListCar(_indexCar);
    }
}
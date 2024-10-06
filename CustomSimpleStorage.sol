// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {SimpleStorage} from "./SimpleStorage.sol";

contract CustomSimpleStorage is SimpleStorage{


    function store(uint _newValue) public override {
        favoriteNumber = _newValue + 10 ;
    }
}

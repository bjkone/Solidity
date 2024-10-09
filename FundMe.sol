// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Converter} from "./Converter.sol";

contract FundMe {

    uint256 public constant MINIMUM_FUND = 51e8; //51$ is 51000000000000000000 wei
    address[] public ownerList;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable owner;

    constructor(){
        owner = msg.sender;
    }

    error NotOwner();

    //gas :568527
    //566113
    //566113
    function fund() public payable{ 
        require(Converter.converterEthToUsd(msg.value) > MINIMUM_FUND, "Please send more than minimum of ETH");
        ownerList.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner{

        for (uint index; index<ownerList.length; index++) 
        {
            addressToAmountFunded[ownerList[index]] = 0;
        }
        ownerList = new address[](0);
        (bool sent, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(sent, "Failed to send ether");
    }

    modifier onlyOwner{
        //require(msg.sender == owner, "Your are not the owner of his contract");
        if(msg.sender != owner){ revert NotOwner();}
        _;
    }

    function getBalance() public view returns(uint256){
        return address(this).balance;
    }

    receive() external payable { 
        fund();
    }

    fallback() external payable {
        fund();
    }


}

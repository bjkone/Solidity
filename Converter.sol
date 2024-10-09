// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {MockV3Aggregator} from "@chainlink/contracts@1.2.0/src/v0.8/tests/MockV3Aggregator.sol";

library Converter {
   

    //ethAmout must be in wei example : 0,022eth => 22000000000000000 wei  
    function converterEthToUsd(uint256 ethAmount) public  returns (uint256){ // the type of valeur in return is wei
        uint256 ethUsd = (getPrice() * ethAmount) / 1e18; 
        return ethUsd; 
    }

    //priceDollar in wei => 50$ => 50000000000000000000 wei, you must set value in wei
    function converterUsdToEth(uint priceInDollar) public  returns (uint256) {
        uint ethAmount = (priceInDollar * 1e18) / getPrice();
        return ethAmount;
    }

    function getPrice() public returns(uint256){
        (
            /* uint80 roundID */,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = buildMockV3Aggregator().latestRoundData();
        return uint256(price);
    }

    function buildMockV3Aggregator() internal returns(MockV3Aggregator){
        //AggregatorV3Interface internal dataFeed;
        return new MockV3Aggregator(8,242000000000);
    }
}
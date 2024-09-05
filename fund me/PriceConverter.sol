// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
/* import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
/*
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter{

    function getPrice() internal view returns(uint256) {
        //address (zk Sync Era): 0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF  

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer * 1e10);
    }


    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUSD;

    }
    
    
}

// 1.Enums
// 2. Events
// 3. try/catch
// 4. function selectors
// 5. abi.encode / decode
// 6. hashing
// 7. yul / Assembly
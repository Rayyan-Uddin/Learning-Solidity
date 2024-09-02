//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import {PriceConverter} from "./PriceConverter.sol";
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";       


error notOwner();

contract FundMe{
    using PriceConverter for uint256;
    
    uint256 public constant MINIMUM_USD = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public funderAmount;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;

    }

    modifier onlyOwner() {
        // require(msg.sender == i_owner, " Not an Owner!");
        if(msg.sender != i_owner) { revert notOwner();}
        _;
    }

    function fund()public payable {
        require (msg.value.getConversionRate() >= MINIMUM_USD, "Din't send enought ETH");
        funders.push(msg.sender);
        funderAmount[msg.sender] = funderAmount[msg.sender] + msg.value;
    }

    function getVersion()public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF);
        return priceFeed.version();
    }
    
    function withDraw() public onlyOwner {
        
        for(uint256 funderIndex = 0 ; funderIndex < funders.length ; funderIndex++){
            address funder = funders[funderIndex];
            funderAmount[funder] = 0;

            //resetting an array
            funders = new address[](0);

            // // transfer
            // payable (msg.sender).transfer(address(this).balance);

            // // send
            //  bool sendSuccess = payable(msg.sender).send(address(this).balance);
            //  require(sendSuccess,"Send Failed");

            // //  call
            (bool callSuccess,) = payable(msg.sender).call{value:address(this).balance}("");
            require(callSuccess, "Call Failed");
        }

    }

    receive() external payable {
        fund();
    }
    fallback() external payable {
        fund();
    }
    }


    


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFive is SimpleStorage {
    function addFavNo(uint256 _newFavNo)public override {
        favouriteNumber = _newFavNo +5;
        
    }

}
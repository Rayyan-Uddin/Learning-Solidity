//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage[] public simpleStorages;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();
        simpleStorages.push(newSimpleStorage);

    }
    function sfStore(uint256 _sfIndex , uint256 _sfNewNum) public{
        simpleStorages[_sfIndex].addFavNo(_sfNewNum);
        
    }
    function sfGet(uint256 _sfIndex)public view returns(uint256){
        return simpleStorages[_sfIndex].retrieve();


    }

}
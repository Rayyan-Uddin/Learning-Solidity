// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;


// 6 data types
 /*  
 1- Boolean- True/False
 2- String- "some text"
 3- int256(256 defines bites)- +5 or -5
 4- uint256(256 defines bites)- +5 only
 5- bytes32(32 defines bytes)- "some text" works as string
 6- Address- account address. eg:0x1235kjsdkfhkl44w5kj
 */

contract SimpleStorage{  //contract in solidity is like classes in OOP
       uint256 public favouriteNumber;  // declaring variable // auto initialize with value = 0
       
       function store (uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;  //visibility has 4 types- Public, Private, Internal, External, At default it's on Internal
        }
        function retrieve() public view returns(uint256){
            return favouriteNumber;

        }
}
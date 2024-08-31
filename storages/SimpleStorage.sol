// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


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
       uint256  favouriteNumber;  // declaring variable // auto initialize with value = 0

         struct People{
        uint256 favouriteNumber;
        string name;
       }
       People[] public ListOfPerson;

       mapping(string => uint256) public nameSearch;

       function addPerson(uint256 _favouriteNumber, string memory _name)public{
        ListOfPerson.push( People(_favouriteNumber,_name) );
        nameSearch[_name] = _favouriteNumber;
       }
    //    
    function addFavNo(uint256 _favouriteNum)public virtual {
        favouriteNumber = _favouriteNum;
        }


        function retrieve() public view returns(uint256){
            return favouriteNumber;
        }
}
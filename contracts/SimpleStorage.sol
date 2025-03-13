//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// EVM, Eterium Virtual Machine
// Avalanchem fantom,Polygon

contract SimpleStorage{
    // basic types: boolean, uint(unsigned integer), int, address, bytes
    // bool hasFavoriteNumber = true;
     uint256  FavoriteNumber;   // public, private, external, internal
    // string FavoriteNumberinText  = "Five";
    // int256 favoriteINT = 5;
    // address myAddress =0x00656Ad52dBc890f37aE94bE292Bc98bAdA35778;
    // bytes32 favoriteBytes = "cat";
    mapping(string => uint256) public nameToFavoriteNumber; 


    // People public person  = People({FavoriteNumber: 2, name: "Vastav"});   // FOr Singluar structue but for large no. is to have ARRAY.


    struct People{
        uint256 FavoriteNumber;
        string name;
    }

    People[] public people;

    function store(uint256 _favoriteNumber) public{
        FavoriteNumber = _favoriteNumber;
    }

    // view, pure <--  Read Only Not transaction cost or real tansactions takes place just shows the transaction (No GAS is Spend)
    function retrieve() public view returns(uint256){
        return FavoriteNumber;
    }

    // EVM(Etherium Virtual MAchine) can access and store information in six places:-
    // 1. Stack // 2. Memory // 3. Storage // 4. Calldata //5. Code // 6. Logs
    // main data --> Calldata(exits temporary that cannot be modified), memory(exits temporary that can be modified), storage(exits permanent that can be modified)
    function addPerson(string memory  _name, uint256 _favoriteNumber) public{
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}  
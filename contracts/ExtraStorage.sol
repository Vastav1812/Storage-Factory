// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage{
    // +5
    // Override
    //virtual override
    function store(uint256 _favoriteNumber) public virtual override{
        FavoriteNumber = _favoriteNumber + 5;
    }

 
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);

    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public{
        // Important things required
        // Address
        // ABI - Application Binary Interface
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGET(uint _simpleStorageIndex)public view returns(uint256){
        return simpleStorageArray[_simpleStorageIndex].retrieve();

    }

}
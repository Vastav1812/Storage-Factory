// GET funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;
// What is Reverting?
// undo my action before, and send remaing gas value.
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
 
contract FundMe{

    uint256 public minimumUSD = 50;

    function fund() public payable{
        // Want to be able to set a minimum fund amount in USD
        // 1. How do we send ETH to this contract?
        require(msg.value >= minimumUSD, "Didn't send enough!"); // 1e18 == 1 * 10 ** 18 == 1000000000000000000
        // 18 decimal places
        
    }

    function getPrice() public view returns(uint256){
        // ABI 
        // Address 0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // ETH in terms of USD
        /// 3000.00000000
        return uint256(price * 1e10);

    }
    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910);
        return priceFeed.version();
    }

    // function withdraw(){}
}
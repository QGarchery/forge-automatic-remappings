// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.13;

import {Math} from "@utils/libraries/Math.sol";

contract ERC20 {
    uint256 public totalSupply;

    constructor() {
        totalSupply = _calculateAppropriateAmount(block.timestamp);
    }

    function _calculateAppropriateAmount(uint256 timestamp) internal pure returns(uint256) {
        return Math.divDown(timestamp, 2);
    }
}

// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.13;

import {Math} from "@utils/libraries/Math.sol";

contract ERC20 {
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor() {
        totalSupply = _calculateAppropriateAmount(block.timestamp);
    }

    function _calculateAppropriateAmount(uint256 timestamp) internal pure returns(uint256) {
        return Math.divDown(timestamp, 2);
    }

    /* Usual ERC20 stuff */

    function transfer(address _to, uint256 _amount) public returns (bool) {
        return _transfer(msg.sender, _to, _amount);
    }

    function transferFrom(address _from, address _to, uint256 _amount) public returns (bool) {
        allowance[_from][msg.sender] -= _amount;
        return _transfer(_from, _to, _amount);
    }

    function approve(address _spender, uint256 _amount) public {
        allowance[msg.sender][_spender] = _amount;
    }

    function _transfer(address _from, address _to, uint256 _amount) internal returns (bool) {
        balanceOf[_from] -= _amount;
        balanceOf[_to] += _amount;
        return true;
    }

}

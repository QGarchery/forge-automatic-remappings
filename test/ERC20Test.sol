// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ERC20} from "../src/ERC20.sol";

contract CounterTest is Test {
    ERC20 public token;

    function setUp() public {
        vm.warp(1e9);
        token = new ERC20();
    }

    function testTotalSupply() public view {
        assertGt(token.totalSupply(), 0, "No token minted !");
    }
}

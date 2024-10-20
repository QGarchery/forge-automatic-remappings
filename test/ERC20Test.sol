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

    // Notice how this test passes after removing the folder lib/interesting-project.
    // Also notice how interesting-project could be very deep in the sub-projects.
    function testTotalSupply() public view {
        assertGt(token.totalSupply(), 0, "No token minted !");
    }
}

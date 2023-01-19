// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MyErc.sol";

contract MyErcTest is Test {
    MyErc public coolErc;
    address public owner = 0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84;
    address public addr1 = address(1);

    function setUp() public {
        coolErc = new MyErc("VeryCoolToken", "VCT");
        coolErc.mint(owner, 1);
    }

    function testMint() public {
        assertEq(coolErc.getBalance(owner), 1);
    }

    function testTransfer() public {
        coolErc.mint(owner, 1);
        coolErc.transfer(owner, addr1, 1);
        assertEq(coolErc.getBalance(addr1), 1);
    }

        function testBurn() public {
        coolErc.burn(owner, 1);
        assertEq(coolErc.getBalance(owner), 0);
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract MyErc is ERC20, Ownable {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}

    function burn(address to, uint256 amount) public onlyOwner {
        super._burn(to, amount);
    }

    function transfer(address from, address to, uint256 amount) public {
        super._transfer(from, to, amount);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        super._mint(to, amount);
    }

    function getBalance(address account) public view returns (uint256) {
        return super.balanceOf(account);
    }
}

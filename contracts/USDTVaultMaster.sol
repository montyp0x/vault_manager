// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";


contract VaultMaster is ReentrancyGuard {

    IERC20 token;
    uint256 totalSupply;
    mapping (address => uint) balance;
    
    constructor(address _token_address) {
        token = IERC20(_token_address);
    }

    function stake(uint256 amount) external nonReentrant  {
        require(amount > 0, "Cannot stake 0");
        totalSupply += amount;
        balance[msg.sender] += amount;
        token.transferFrom(msg.sender, address(this), amount);
        emit Staked(msg.sender, amount);
    }

    


    event Staked(address, uint256);
}

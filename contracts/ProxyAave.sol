// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "./ProxyAccess.sol";
import "./interfaces/IPool.sol";


contract ProxyAave is ProxyAccess {

    IPool aave_pool;
    
    constructor(address _aave_pool_address) {
        aave_pool = IPool(_aave_pool_address);
        
    }

    function supply(uint256 _amount, address _token, address _account) public onlyVaultManager {
        aave_pool.supply(_token, _amount, _account, 0);
    }
}

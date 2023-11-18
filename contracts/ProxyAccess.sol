// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

abstract contract ProxyAccess {
    address public vaultManager;

    modifier onlyVaultManager() {
        require(msg.sender == vaultManager, "Caller is not VaultManager contract");
        _;
    }
}
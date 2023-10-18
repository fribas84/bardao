// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import './SubDao.sol';

contract DaoCreator {
   
    SubDao[] private _daos;
    mapping(address => uint[]) public _userSubDaos;

    constructor() {}
}

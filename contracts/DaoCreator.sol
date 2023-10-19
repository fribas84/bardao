// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import './SubDao.sol';
import './IERC20.sol';

import '@openzeppelin/contracts/access/Ownable.sol';

contract DaoCreator is Ownable {
   
   IERC20 public BardToken;
    SubDao[] private _daos;
    mapping(address => uint[]) public _userSubDaos;

    uint256 constant public SUBDAO_CREATION_FEE = 1 ether;
    constructor(address _tokenAddress) Ownable(msg.sender) {
        BardToken = IERC20(_tokenAddress);
    }

    
}

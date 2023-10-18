// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import '@openzeppelin/contracts/token/ERC1155/IERC1155.sol';
import '@openzeppelin/contracts/access/AccessControl.sol';

contract SubDao is AccessControl {
    
    bytes32 public subDaoName;

    bytes32 public constant MEMBER_ROLE = keccak256('MEMBER');
    bytes32 public constant PROPOSER_ROLE = keccak256('PROPOSER');

    IERC1155 public governanceToken;
    
    struct proposal {
        uint256 id;
        address proposer;
        uint256 votes;
        uint256 startBlock;
        uint256 endBlock;
        bool executed;
        bool passed;
        bytes32 description;
        bytes32 title;
        bytes32 link;
        mapping(address => bool) voted;
    }

    //mapping(address => ) public memberTokenBalance;

    constructor(bytes32 _subDaoName, address governanceTokenAddress) {
        subDaoName = _subDaoName;
        governanceToken = IERC1155(governanceTokenAddress);
    }
}

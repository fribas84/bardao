// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import './IERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/utils/Address.sol';
import '@openzeppelin/contracts/utils/ReentrancyGuard.sol';

contract BarDex is Ownable, ReentrancyGuard {
    using Address for address payable;

    IERC20 public BardToken;

    constructor(address _BardToken) Ownable(msg.sender) {
        BardToken = IERC20(_BardToken);

    }

    function swap() payable public {
        BardToken.mint(msg.sender, msg.value);
    }

    function widthdraw(uint256 amount) public onlyOwner nonReentrant{
        payable(msg.sender).sendValue(amount);
    }

}

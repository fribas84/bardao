// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract BardToken is ERC20, AccessControl, ERC20Permit {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint public constant MAX_SUPPLY = 50000000 * 10 ** 18;
    constructor()
        ERC20("BardToken", "BRDT")
        ERC20Permit("BardToken")
    {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function grantMinterRole(address _minter) public onlyRole(DEFAULT_ADMIN_ROLE) {
        _grantRole(MINTER_ROLE, _minter);
    }
    function mint(address to, uint256 amount) onlyRole(MINTER_ROLE) public {
        require(totalSupply() + amount <= MAX_SUPPLY, "BardToken: max supply exceeded");
        require(totalSupply()<= MAX_SUPPLY, "BardToken: max supply exceeded");
        _mint(to, amount);
        emit Minted(to, amount);
    }


    event Minted(address indexed to, uint256 amount);
}
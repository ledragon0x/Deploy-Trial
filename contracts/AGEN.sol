// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { IAGEN, IERC20 } from "./interfaces/IAGEN.sol";
import { IERC165 } from  "@openzeppelin/contracts/interfaces/IERC165.sol";
import { IVotes } from "@openzeppelin/contracts/governance/utils/IVotes.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20CappedUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20VotesUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

    contract AGEN is Initializable, IAGEN, ERC20Upgradeable, ERC20VotesUpgradeable, ERC20PermitUpgradeable, ERC20CappedUpgradeable, ERC20BurnableUpgradeable, OwnableUpgradeable, UUPSUpgradeable {

    constructor() {
        _disableInitializers();
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}

    function initialize(address initialOwner) public initializer {
        __ERC20_init("AGEN", "AGEN");
        __ERC20Burnable_init();
        __Ownable_init(initialOwner);
        __ERC20Permit_init("AGEN");
        __ERC20Votes_init();
        __UUPSUpgradeable_init();
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    function cap() public view override(ERC20CappedUpgradeable) returns (uint256) {
        return ERC20CappedUpgradeable.cap();
    }

    function supportsInterface(bytes4 interfaceId) external pure override returns (bool) {

        return
            interfaceId == type(IAGEN).interfaceId ||
            interfaceId == type(IERC20).interfaceId ||
            interfaceId == type(IERC165).interfaceId ||
            interfaceId == type(IVotes).interfaceId;
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function _update(address from, address to, uint256 value) internal override(ERC20Upgradeable, ERC20VotesUpgradeable, ERC20CappedUpgradeable) {
        super._update(from, to, value);
    }

    function nonces(address owner) 
        public 
        view 
        override(ERC20PermitUpgradeable, NoncesUpgradeable) 
        returns (uint256)
    {
        return super.nonces(owner);
    }
}




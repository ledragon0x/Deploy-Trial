// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";

/**
 * This is the AGEN token contract. The token is ERC20 with cap and burnable features.
 */
interface IAGEN is IERC20, IERC165 {
    /**
     * The function to get the cap of the token.
     * @return The cap of the token.
     */
    // function cap() external view returns (uint256);

    /**
     * The function to mint tokens.
     * @param to The address of the account to mint tokens to.
     * @param amount The amount of tokens to mint.
     */
    function mint(address to, uint256 amount) external;
}
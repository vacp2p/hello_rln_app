// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "rln-contract/RlnBase.sol";
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";

contract HelloRln is Ownable, RlnBase {
    bytes2 public constant start = 0xdead;
    uint256 private membershipDeposit = 0;
    uint256 private depth = 20;

    constructor(address _poseidonHasher) Ownable() RlnBase(membershipDeposit, depth, _poseidonHasher, address(0)) {}

    function _validateRegistration(uint256 idCommitment) internal pure override {
        if (bytes2(bytes32(idCommitment)) != start) revert FailedValidation();
    }

    function _validateSlash(uint256 idCommitment, address payable receiver, uint256[8] calldata proof)
        internal
        view
        override
        onlyOwner
    {}
}

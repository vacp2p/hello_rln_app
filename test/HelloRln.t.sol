// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/HelloRln.sol";
import {FailedValidation} from "rln-contract/RlnBase.sol";

contract HelloRlnTest is Test {
    HelloRln public helloRln;

    function setUp() public {
        helloRln = new HelloRln(address(0));
    }

    function test__InvalidRegistration(uint256 idCommitment) public {
        vm.assume(bytes2(bytes32(idCommitment)) != helloRln.start());
        vm.expectRevert(FailedValidation.selector);
        helloRln.register(idCommitment);
    }

    function test__ValidRegistration() public {
        bytes32 idCommitment = 0xdead000000000000000000000000000000000000000000000000000000000000;
        helloRln.register(uint256(idCommitment));
    }
}

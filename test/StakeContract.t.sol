// SPDX-License-Identifier: unlicense
pragma solidity ^0.8.10;

import "forge-std/Test.sol"; 
import "./Mock/MockERC20.sol";
import "../src/StakeContract.sol";

contract StakeContractTest is Test {

    MockERC20 public mockERC20;
    StakeContract public stakeContract;

    function setUp() public {
        // explicitly call the contracts as functions
        mockERC20 = new MockERC20();
        stakeContract = new StakeContract();
    }

    function testStake() public {
        uint256 amount = 10e18;
        mockERC20.approve(address(stakeContract), amount); // approve token for staking (ERC20)
        bool stakePassed = stakeContract.stake(amount, address(mockERC20)); // staking the token from the mockERC20
        assertTrue(stakePassed);
    }

}


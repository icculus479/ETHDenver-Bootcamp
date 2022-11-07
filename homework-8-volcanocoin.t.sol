// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

// Standard test libs
import "forge-std/Test.sol";
import "forge-std/Vm.sol";

// Contract under test

import {VolcanoCoin} from "../src/volcanocoin.sol";

contract VolcanoTest is Test {
    // Variable for contract instance
    VolcanoCoin private vc;

    function setUp() public {
        // Instantiate new contract instance
        vc = new VolcanoCoin();
    }
    
    // Homework #8.2.1 - Test to ensure the total supply is initially 10000
    function test_InitalSupply() public {
       assertTrue(vc.getTotalSupply() == 10000);
       console.log(vc.getTotalSupply());
    }

    // Homework #8.2.2 - Test to ensure that the total supply can be increased in 1000 token steps
    function test_IncreaseTotalSupply() public {
       uint256 originalSupply = (vc.getTotalSupply());
       console.log(originalSupply);

       vc.IncreaseTotalSupply();

       uint256 IncreasedSupply = (vc.getTotalSupply());
       console.log(IncreasedSupply);
       assertTrue(IncreasedSupply == originalSupply +1000);
    }
    // Homework #8.2.3 - Test to ensure that only the owner of the contract can increase the supply.

    function test_OwnerIncreaseOnly() public {

      vm.expectRevert(bytes("Ownable: caller is not the owner"));
      vm.prank(address(0));
      vc.IncreaseTotalSupply();  

    }
}


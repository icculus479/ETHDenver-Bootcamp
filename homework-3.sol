// SPDX-License-Identifier: None
// October 19th, 2022 ETHDenver Bootcamp Homework

pragma solidity 0.8.17;


contract BootcampContract {

    uint256 number;
    address public deployer;
    address deployerAddress;
    
    //Constructor will run during contract deployment and register the address as the deployer
    //This can only be done once and is set in a global variable of deployer
    constructor(){
        deployer = msg.sender;
    }

    function store(uint256 num) public {
        number = num;
    }


    function retrieve() public view returns (uint256){
        return number;
    }
  
    //Function checks if the current sender is the original deployer of the contract
    //If it is, it returns the original deployer address, if not, it returns the dead address
    function analyzeDeployerAddress() public view returns (address){
        if(msg.sender != deployer){
            return 0x000000000000000000000000000000000000dEaD;
        }
        return deployer;
    }
}
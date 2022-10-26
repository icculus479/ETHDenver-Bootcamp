// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";
//Homework 5 converted the contract to look at the Ownable.sol.  This automatically brings in a check for the deployer with onlyOwner
//However due to inheritance, the variable 'owner' could not be used in this contract as it was used in the OpenZepplin one
//To ensure it would compile, I needed to change all the owner variables to contractowner

contract VolcanoCoin is Ownable {

    //Global Variables used for the Smart Contract
    uint256 totalSupply;
    address contractowner;

    // Event created to initiate an 'emit' or variable printed to the log
    event NewSupply(string, uint256);
    event TransferTokenMsg(string, address, string, uint256, string, address);
    
    // Mapping created to store user addresses and their corresponding balances
    mapping (address => uint256) public Balances;
    
    // Struct created to store transfer amount and recipient address
    struct Payment {
        uint256 amountTransferred;
        address recipientAddress;
    }
    
    //Creating an array named Payment which will hold the values of the Struct
    Payment[] pmtTransfers;

    //Creating a new mapping called Transfers.  This will map an address to the array of Transfer information, populated via Struct
    mapping (address => Payment[]) public Transfers; 

     //Total Supply set to 10,000 upon Contract Deployment
    constructor(){
        totalSupply = 10000;
        contractowner = msg.sender;
        Balances[contractowner] = totalSupply;
    }

    //Return the Current Total Supply of VolcanoCoin
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    //Create a modifier to ensure the linked function will only process if the Owner initiates the request
    //Adding a require so an error message is displayed if the address submitting is not the Owner vs having the function not work but 
    // *** Commenting out modifier below as it is now handled by the OpenZepplin Import - Homework #5 ***
    //modifier checkOwner(){
    //    require(msg.sender == owner, "Permission Denied");
    //    if(msg.sender == owner){
    //    _;
    //    }
    //}

    //When called, the Total Supply is raised by 1000
    // *** Commenting out below and creating a new line, as it is now handled by the OpenZepplin Import - Homework #5 ***
    //function IncreaseTotalSupply() public checkOwner {

    function IncreaseTotalSupply() public onlyOwner {
        totalSupply += 1000;
        //By Default - Owner Address should control any new tokens created by the function
        Balances[contractowner] += 1000;
        emit NewSupply("New Total Supply =", totalSupply);
    }

    //Token Transfer. Function checks first that the requested transfer amount is possible.  If it is, balances are adjusted
    function TransferToken(uint256 _TransferAmt, address _RecipientAddress) public {
        require(Balances[msg.sender] >= _TransferAmt, "Not Enough To Transfer");
        Balances[_RecipientAddress] += _TransferAmt;
        Balances[msg.sender] -= _TransferAmt;

        //Push the struct vaules into the array and assign it to the sender's mapping
        Transfers[msg.sender].push(Payment(_TransferAmt,_RecipientAddress));
    
        emit TransferTokenMsg("Account ", msg.sender, " transferred ", _TransferAmt, " tokens to account ", _RecipientAddress);
    }
    
    //Function to return all the Transfers loaded into the Payment array for a specific account
    function getPayments(address user) public view returns (Payment[] memory){
        return Transfers[user];
    }
 

}

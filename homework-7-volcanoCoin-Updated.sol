// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";

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
    // Homework #7 : Adding senderAddress into the Struct so it can be called via recordPayment function
    struct Payment {
        address senderAddress;
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

    // Homework #7.3 - Each time we make a transfer of tokens, we should call the this recordPayment function to record the transfer.
        //Transfers[msg.sender].push(Payment(_TransferAmt,_RecipientAddress));
        recordPayment(msg.sender, _TransferAmt, _RecipientAddress);
        emit TransferTokenMsg("Account ", msg.sender, " transferred ", _TransferAmt, " tokens to account ", _RecipientAddress);
    }
    
    // Homework #7.2 - For the payments record mapping, create a function called recordPayment that takes
    // the senderʼs address, the receiverʼs address and the amount as an input, then creates a new payment 
    // record and adds the new record to the userʼs payment record.
    function recordPayment(address _sender, uint256 _amount, address _receiverAddr) internal {
        Transfers[_sender].push(Payment(_sender,_amount,_receiverAddr));

    }

    // Homework #7.1 - We made a payment mapping, but we havenʼt added all the functionality for it yet. 
    // Write a function to view the payment records, specifying the user as an input.
    // Function to return all the Transfers loaded into the Payment array for a specific account
    function getPayments(address user) public view returns (Payment[] memory){
        return Transfers[user];
    }


}


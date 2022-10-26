// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract VolcanoCoin {

    //Global Variables used for the Smart Contract
    uint256 totalSupply;
    address owner;

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
        owner = msg.sender;
        Balances[owner] = totalSupply;
    }

    //Return the Current Total Supply of VolcanoCoin
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    //Create a modifier to ensure the linked function will only process if the Owner initiates the request
    //Adding a require so an error message is displayed if the address submitting is not the Owner.
    // .. vs having the function not work but 
    modifier checkOwner(){
        require(msg.sender == owner, "Permission Denied");
        if(msg.sender == owner){
        _;
        }
    }

    //When called, the Total Supply is raised by 1000
    function IncreaseTotalSupply() public checkOwner {
        totalSupply += 1000;
        //By Default - Owner Address should control any new tokens created by the function
        Balances[owner] += 1000;
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

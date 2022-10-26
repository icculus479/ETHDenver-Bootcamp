# Homework #5 | October 24th, 2022

Update your Volcano coin contract to inherit from the Open Zeppelin Ownable contract, and use this to replace the owner functionality in your contract.

### A few things were required to implement this change

>> I needed to include the import with in the contract "import "@openzeppelin/contracts/access/Ownable.sol"

> <img width="385" alt="Screen Shot 2022-10-25 at 8 34 12 PM" src="https://user-images.githubusercontent.com/16567309/197920891-8c8835c9-54ca-4123-941a-b0b71c6fb2cb.png">

>> For the OZ contract to be included, it requires the contract line to include the .sol.  So I changed the main contract line to "contract VolcanoCoin is Ownable"

> <img width="251" alt="Screen Shot 2022-10-25 at 8 37 27 PM" src="https://user-images.githubusercontent.com/16567309/197921301-a88b828e-4781-457c-9162-dd420eb9b05d.png">

>> Next, this created a conflict with the attribute 'owner' in my contract as it was being used in the OZ code.  Therefore, I renamed all my owner variables to 'contractowner', which corrected the issues. For instance, the first one :

> <img width="346" alt="Screen Shot 2022-10-25 at 8 34 49 PM" src="https://user-images.githubusercontent.com/16567309/197921017-5260dfce-a593-444d-882c-107c0d4b9c76.png">

>> I then removed the previous modifier code, and used the onlyOwner OZ modifier instead

> <img width="352" alt="Screen Shot 2022-10-25 at 8 38 26 PM" src="https://user-images.githubusercontent.com/16567309/197921439-62c77fed-888e-4568-baa9-286bd1aa3235.png">

#### Testing

Testing was successful as all the functions worked as expected.  I tested the OZ TransferOwner Function as well, and it did successfully transfer the ownership.  However, because the TransferTokens function is based on the contract deployer via the OZ onlyOwner, the new owner was NOT able to transfer tokens.  Succesful test. 

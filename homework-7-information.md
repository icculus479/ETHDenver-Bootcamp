# Homework #7 | October 26th, 2022

Adding more functionality to the Volcano Coin contract

### 1.) We made a payment mapping, but we havenʼt added all the functionality for it yet. Write a function to view the payment records, specifying the user as an input. What is the difference between doing this and making the mapping public?
>><img width="757" alt="Screenshot 2022-11-05 at 8 22 46 PM" src="https://user-images.githubusercontent.com/16567309/200151030-a6c8b240-0328-463f-b644-53ea36376af0.png">
### 2.) For the payments record mapping, create a function called recordPayment that takes the senderʼs address, the receiverʼs address and the amount as an input, then creates a new payment record and adds the new record to the userʼs payment record.
>>First we need to add the sender variable to the struct
>>><img width="751" alt="Screenshot 2022-11-05 at 8 25 38 PM" src="https://user-images.githubusercontent.com/16567309/200151132-896939f2-3c4e-4496-b1c5-041185d8aba2.png">
>>Now we can add the new variable into the mapping
>>><img width="771" alt="Screenshot 2022-11-05 at 8 24 38 PM" src="https://user-images.githubusercontent.com/16567309/200151068-07b99474-ff78-4fc4-8c34-2b50e7e0c355.png">
### 3.) Each time we make a transfer of tokens, we should call the this recordPayment function to record the transfer.
>><img width="965" alt="Screenshot 2022-11-05 at 8 25 25 PM" src="https://user-images.githubusercontent.com/16567309/200151097-66e842d2-d462-48f5-986e-7595743cc29a.png">
### Because we only adjusted the underlying values behind the exising Transfers mapping.  Now when we call the getPayments, we'll receive all 3 variables
>><img width="940" alt="Screenshot 2022-11-05 at 8 29 22 PM" src="https://user-images.githubusercontent.com/16567309/200151221-9fe006ac-a37b-4c83-88b5-217f43e5338a.png">
>><img width="640" alt="Screenshot 2022-11-05 at 8 32 09 PM" src="https://user-images.githubusercontent.com/16567309/200151236-4c4393d6-42e5-4718-99f4-8f6110018761.png">

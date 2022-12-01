--- 


Alchemy - Get URL for Goerli

Start Node in Foundry
anvil --fork-url https://eth-goerli.g.alchemy.com/v2/4dOE-iegmw5zmm9ShLRuBnmgtQy1Jr-U

Test Deploy your Contract in Foundry
forge script script/NFT.s.sol:VolcanoNFTScript --fork-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
<img width="542" alt="Screenshot 2022-11-19 at 7 39 30 PM" src="https://user-images.githubusercontent.com/16567309/204166103-03906834-fb38-4018-930f-27283706d4d7.png">

Once you see the cost and all looks well, add the --broadcast to it

forge script script/NFT.s.sol:VolcanoNFTScript --fork-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
<img width="542" alt="Screenshot 2022-11-19 at 7 40 40 PM" src="https://user-images.githubusercontent.com/16567309/204166156-876d6e03-4093-4b0a-8c8a-f00434563c74.png">

Now you can start running cast calls against the contract

Mint Example

<img width="1092" alt="Screenshot 2022-11-20 at 9 54 24 PM" src="https://user-images.githubusercontent.com/16567309/204166222-20eaf581-1543-41d2-8abc-b7f925448a39.png">

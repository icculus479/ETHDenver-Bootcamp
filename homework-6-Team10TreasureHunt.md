# Homework #6 | October 25th, 2022

In our assigned teams, we were to register our team name here : http://team-registration.javascrypt-.repl.co/  by connecting our team Goerli account and submitting the transaction.  Once that transaction was confirmed, we were to follow the clues in order to get to the Treasure.  This is how we did it!

1.  Here is our Transaction for our Team Registration : https://goerli.etherscan.io/tx/0xe2660c6c6b07748972be033f3932c1ecc5269afcbbd58ba13e16c5d4a2e3edbd
2.  From there selected the registration contract
  > <img width="898" alt="Screen Shot 2022-10-27 at 10 24 03 AM" src="https://user-images.githubusercontent.com/16567309/198345827-b5d510c6-d003-40d2-80f3-73ee0fba81bf.png">
3.  Looking into the contract, we looked at the hex code that was displayed in the info function
  ><img width="614" alt="Screen Shot 2022-10-27 at 10 26 19 AM" src="https://user-images.githubusercontent.com/16567309/198346404-5a8a0e3e-2120-48e8-875c-854d6533ca27.png">
4.  We took that HEX and converted it into ASCII text via the tools on rapidtables.com.  That conversion provided a new URL to follow
  ><img width="635" alt="Screen Shot 2022-10-27 at 10 29 01 AM" src="https://user-images.githubusercontent.com/16567309/198346894-8709985c-ce40-4176-be49-ce3da4507c0a.png">
5.  The URL took us to a Pastebin website which stored a new code
  > <img width="492" alt="Screen Shot 2022-10-27 at 10 29 56 AM" src="https://user-images.githubusercontent.com/16567309/198347104-bb0a66ad-63ab-4ccf-9172-63127783cdd7.png">
6.  Once again we took that HEX and translated it into ASCII which provided a new URL
  > <img width="626" alt="Screen Shot 2022-10-27 at 10 31 20 AM" src="https://user-images.githubusercontent.com/16567309/198347396-eb5967d4-8783-48e1-9b0e-1bd358248f59.png">
7.  The new URL took us over to Twitter, where there was a post with a Binary code
  > <img width="602" alt="Screen Shot 2022-10-27 at 10 32 14 AM" src="https://user-images.githubusercontent.com/16567309/198347652-21649735-b71b-45d6-af55-517a288e9702.png">
8.  We took that Binary code and turned it back into a HEX
  >  <img width="512" alt="Screen Shot 2022-10-27 at 10 34 47 AM" src="https://user-images.githubusercontent.com/16567309/198348123-a6f9e48b-0f42-4f3c-9872-cb3a252fc28e.png">
9.  That HEX led us to a transcation back on Goerli.  Transaction : https://goerli.etherscan.io/tx/0xE750138A5D6D2C3782FD52161BECBF1DC47AFBF09A398A061FD2424330AAAD59
10. When viewing the Input Data as UTF-8, it led us to a new URL
  > <img width="939" alt="Screen Shot 2022-10-27 at 10 37 30 AM" src="https://user-images.githubusercontent.com/16567309/198348902-bb096b00-029c-48d2-820d-02ee8a0ef66e.png">
11. The new URL took us to a website, which told us to inspect the code.  When inspecting the code, a new URL was presented in the comments.
  > <img width="1021" alt="Screen Shot 2022-10-27 at 10 40 46 AM" src="https://user-images.githubusercontent.com/16567309/198349449-9953455b-57a8-462b-83c8-8c3923321e21.png">
12. That URL took us back over to Twitter where we were given the Contract of the Treasure Chest.
  > <img width="609" alt="Screen Shot 2022-10-27 at 10 43 03 AM" src="https://user-images.githubusercontent.com/16567309/198349836-cc221d72-acc3-4b4d-820b-971a80105d15.png">
13. Now that we had the Tresure Chest contract, back at the original GIST code, we entered in the contract into the callTreasureContract and once the transaction was complete, we solved the mystery!
  > <img width="314" alt="Screen Shot 2022-10-27 at 10 46 14 AM" src="https://user-images.githubusercontent.com/16567309/198350443-f4ce48ed-ccab-4de3-9a05-2bb1637162ae.png">

  Transaction ID for Calling the Treasure Contract : https://goerli.etherscan.io/tx/0x8b6f4fbf0161573e32223d8a19817940c10731a32617b395cf02ecf123999416
  > <img width="895" alt="Screen Shot 2022-10-27 at 10 48 09 AM" src="https://user-images.githubusercontent.com/16567309/198350839-dde56023-ea89-4d3e-a34a-55c697251ece.png">

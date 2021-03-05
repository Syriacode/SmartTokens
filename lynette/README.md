![](image4.PNG)

# **Project 3: Smart Tokens - ERC20 for Equity Certificates through Smart Contracts**

### *Team 2: Lynette Cary, Marius Nsamou, Nigil Jeyashekar, Rajiv Shrestha and Rawad Habib*

</br>

## Dependencies
- [Remix IDE](https://remix.ethereum.org) is used to create the `StockTrading` contract</br>
- [Ganache](https://www.trufflesuite.com/ganache) is used to develop a personal blockchain network that is used to deploy the smart contract, develop applications and run tests</br>
- [MetaMask extension for Google Chrome](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=en) uses the Ropsten Test Network to send transactions
- [MyCrypto](https://download.mycrypto.com/) is used to test the transaction</br> 

</br>

## **Concept Creation** </br>
----------------------------
### Regulation of Digital Assets
The Commodity Futures Trading Commission (CFTC) oversees the digital assets market, which include *"anything that can be stored and transmitted electronically and has associated ownership and rights."* "Digital assets offer benefits of increased transaction speed, efficiency, certainty, "democratization" of markets and financial inclusion, automation through smart contracts, greater liquidity for assets, and enhanced security."<sup>1</sup>

### Challenges to Investing in Private Equity Firms
"*Past issues with investing in private equity have included a lack of opportunity as many private firms work directly with individual brokers and with the lack of necessary relationships it is increasingly difficult to take advantage of investment opportunities.  Tokenization and blockchain technology opens more opportunities for issuers to connect directly with investors and the technology processes transactions quickly and efficiently.*" <sup>2</sup>

<br>

## **ERC20 Extension to Tokenize Private Equity Shares in a Privately-Held Company**
------------------------------------------------------------------------------------
For the purposes of this project, we created an Ethereum smart contract called `DigitalToken`, a proposed ERC20-compatible token, that allows for the creation and issuance of digital tokens that represent tokenized equity in a privately-held company in exchange for Ether to be exchanged.  The purpose of tokenizing equity is to raise capital for the company by issuing shares in the form of digital assets (tokens).  Tokenization creates transparency and the use of blockchain technology creates an immutable storage of all data related to the issuance of the shares in the company that include the balance of remaining tokens, history of ownership, and the amount raised.  

**What is a blockchian?**  A blockchain is a peer-to-peer network of nodes or distributed networks that connect individual nodes on the blockchain that all work together to make sure the data is secure and unchangeable.  The individual nodes contain a copy of the code and the data on the blockchain.  The  data is contained in blocks and are chained together, hence a blockchain.  

**What is a smart contract?** All of the code on the blockchain is contained in a smart contract, which is the program that runs on the blockchain and once deployed it is unchangeable.  The smart contract in this project will complete all of the tasks for a stock exchange.  

<br>

### Project Setup
Referenced above are all dependencies installed and setup for this project including creating a new wallet created in MyCrypto to generate a mnemonic.  The mnemonic is used to build a personal blockchain in Ganache.  An account from the Ethereum wallet (in Ganache) is used to connect to the blockchain network.  

The smart contracts created in this project contain the logic to tokenize all of the Compnay shares.  The Ethereum smart contract was created using the solidity programming language and imports the standards from OpenZeppelin contracts for a more secure smart contract development.  The contract was compiled and deployed to a blockchain.  The contract code was tested using MyCrypto and Metamask localhost:8545 testnet to send a test transaction.  The contract was finally deployed to a blockchain using the Ropsten Test Network on Metamask.  The following variables were set in the contracts:

- contract `owner` is confirmed as the `onlyOwner` and set to msg.sender
- `symbol` is set to `DIGITAL`
- `exchange_rate` is set to equal 100 shares to be distributed per `wei`

### Smart Contract Logic
Function `balance` returns the available owner shares
Function `transfer` accepts the recipient address to make the transfer of shares from the owner to the recipient
Function `purchase` calculates the number of shares to distribute and adds a value to the shares and transfers the value to the owner address
Function `mint` allows the Company to create new tokens when needed 

The `DigitalTokenERC20` contract is created and passes the following variables for the ERC20Detailed contract: 
- `name` of the token `DigitalToken`
- `symbol` of the token `DIGITAL`
- `18 decimals` sets the decimal places to accept Ethereum in the contract

The constructor calls the internal `_mint` function to set an `initial_supply` of shares available to the owner.

The `DigitalTokenMinted` contract is created to 

The `DigitalTokenSale` smart contract is created to manage the sale and minting of the DigitalToken (shares).  A constructor is added to the contract to fulfill the crowdsale parameters that include:
- `rate` for the conversion between wei and the token unit
- ` wallet` address is used to receive the Ether from the sale of the digital asset
`token` is set to the actual `DigitalToken` created and is compatible with the ERC20 interface that the crowdsale contract requires

The body of the constructor is empty and will inherit the logic from `Crowdsale` and `MintedCrowdsale` from OpenZeppelin.

A `DigitalTokenSaleDeployer` contract is created to store the addresses from the `DigitalToken` and `DigitalTokenSale` once deployed.  The following parameters are set int he `DigitalTokenSaleDeployer` contract:
- `rate` is hardcoded to `1` to maintain the same units as Ether
- `wallet` is the same from the main constructor that will be paid all of the Ether that is raised by the `DigitalTokenSale`
- `token` is where the `DigitalToken` is stored

The `DigitalTokenSale` contract is set as a minter to then renounce the mintership from the `DigitalTokenSaleDeployer` to the `DigitalTokenSale` as the actual minter.  

will be deployed to the local blockchain and a purchase is tested using XXXXXXX.  The `DigitalTokenSale` contract includes a constructor 


Ganache Accounts</br>
---------------------------</br>
(0) 0x.....</br>)
(1) 0x.....</br>
(2) 0x....</br>

HD Wallet</br>
---------------------------</br>
Mnemonic: 
Base HD Path: m/44'/00'/0'/0/{account_index}
Localhost: 8545

## Testing the Transaction
To be completed
<br>

## Contract Deployed
To be completed
<br>

## Conclusion
To be completed

<br>

## Future Research
If more time was available the group could ....  

<br>

## References
<sup>1</sup> CFTC Digital Assets Primer https://www.cftc.gov/media/5476/DigitalAssetsPrimer/download 

<sup>2</sup> Invest in Private Equity? Here are the Top 4 Reasons to Get Excited for Tokenization https://medium.com/blockstation-blog/invest-in-private-equity-here-are-the-top-4-reasons-to-get-excited-for-tokenization-5da6ea6fc894)
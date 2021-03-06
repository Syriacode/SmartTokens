pragma solidity ^0.5.0;

import "./DigitalTokenMinted.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

contract DigitalTokenSale is Crowdsale, MintedCrowdsale {

    constructor(
        uint rate, // rate in TKNbits
        address payable wallet, // sale beneficiary
        DigitalToken token // the DigitalToken itself that the DigitalTokenSale will work with
    )
        Crowdsale(rate, wallet, token)
        public
    {
        // constructor can stay empty
    }
}

contract DigitalTokenSaleDeployer {

    address public token_sale_address;
    address public token_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet // this address will receive all Ether raised by the sale
    )
        public
    {
        // create the DigitalToken and keep its address handy
        DigitalToken token = new DigitalToken(name, symbol, 0);
        token_address = address(token);

        // create the DigitalTokenSale and tell it about the token
        DigitalTokenSale token_sale = new DigitalTokenSale(1, wallet, token);
        token_sale_address = address(token_sale);


        // make the DigitalTokenSale contract a minter, then have the DigitalTokenSaleDeployer renounce its minter role
        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}
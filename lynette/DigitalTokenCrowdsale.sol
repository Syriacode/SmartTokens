pragma solidity ^0.5.0;

import "./DigitalTokenMinted.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

// @TODO: Inherit the crowdsale contracts
contract DigitalTokenSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale {

    constructor(
        // @TODO: Fill in the constructor parameters!
        uint rate, // rate in TKNbits
        address payable wallet, // sale beneficiary
        DigitalToken token, // the DigitalToken itself that the DigitalTokenSale will work with
        uint goal,
        uint open,
        uint close
    )
        // @TODO: Pass the constructor parameters to the crowdsale contracts.
        Crowdsale(rate, wallet, token)
        MintedCrowdsale()
        CappedCrowdsale(goal)
        TimedCrowdsale(open, close)
        RefundableCrowdsale(goal)
        public
    {
        // constructor can stay empty
    }
}

    
contract DigitalTokenSaleDeployer {

    address public token_sale_address;
    address public token_address;

    constructor(
        // @TODO: Fill in the constructor parameters!
        string memory name,
        string memory symbol,
        address payable wallet, // this address will receive all coins raised
        uint goal
    )
        public
    {
        // @TODO: create the DigitalToken and keep its address handy
        DigitalToken token = new DigitalToken(name, symbol, 0);
        token_address = address(token);

        // create the DigitalTokenSale and tell it about the token
        DigitalTokenSale token_sale = new DigitalTokenSale(1, wallet, token, goal, now, now + 52 weeks);
        token_sale_address = address(token_sale);

        // make the DigitalTokenSale contract a minter, then have the DigitalTokenSaleDeployer renounce its minter role
        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}
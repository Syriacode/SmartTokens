pragma solidity ^0.5.0;

import "./DigitalToken.sol";
import "./DigitalTokenERC20.sol";
import "./DigitalTokenMinted.sol";
import "./DigitalTokenSale.sol";

contract EquityCertificateCreator {
    /// @title EquityCertificateCreator
    EquityCertificate[] public certificates;
    string public private_equity_firm;
    string public investor;
    string public asset_type;
    string public asset_worth;
    string public location;
    string public regulating_authority = "U.S.",
      
    address payable public wallet;

    constructor() public {
        owner = msg.sender;
    }
    
    event LogNewCertificateCreated(EquityCertificate);
    
    /// Owner/Sender creates Equity Certificate for the Beneficiary
    modifier onlyOwner {
        require(msg.sender == owner, "You are not allowed to perform this action");
        _;
    }
    
    /** 
        @dev function is called every time someone wants to register a new equity certificate
    **/
    function createNewCertificate(
        string memory private_equity_firm, string memory investor, string memory asset_type, string memory asset_worth, string memory location
        ) public payable {
        
        // new certificate creation
        EquityCertificate newCertificate = new EquityCertificate(
            private_equity_firm = owner,
            investor = digital_sale_address,
            asset_type = DigitalToken,
            asset_worth = DigitalTokenSale,
            location = regulating_authority)
        
        // we save the address in array
        certificates.push(newCertificate);
        }
        
}
        
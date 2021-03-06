pragma solidity ^0.8.0;

import "./DigitalToken.sol";
/// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


contract EquityCertificateCreator {
    /// EquityCertificate public certificates;
    string public private_equity_firm;
    string public investor;
    string public asset_type;
    string public asset_worth;
    string public regulating_authority;
      
    address payable public wallet;

    constructor() public {
        owner = msg.sender;
    }
    
     /// event LogNewCertificateCreated(EquityCertificate);
    
    /// Owner/Sender creates Equity Certificate for the Beneficiary
    modifier onlyOwner {
        require(msg.sender == owner, "You are not allowed to perform this action");
        _;
    }
    
    /** 
        @dev function is called every time someone wants to register a new equity certificate
    **/
    function createNewCertificate(string memory private_equity_firm,  string memory investor, string memory asset_type, string memory asset_worth, string memory regulating_authority) 
        
        public payable {
        
        // new certificate creation
        EquityCertificate newCertificate = new EquityCertificate(
            private_equity_firm = owner,
            investor = digital_sale_address,
            asset_type = DigitalToken,
            asset_worth = DigitalTokenSale,
            regulating_authority = "US"
            );
        
        /// we save the address in array
         certificates.push(createNewCertificate);
        }

}
        
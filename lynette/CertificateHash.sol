pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

/**

    ERC721 Token URI JSON Schema

    {
        "private_equity_firm": "Firm Metadata",
        "type": "object",
        "properties": {
            "private_equity_firm": {
                "type": "string",
                "description": "Smart Tokens"
            },
            "asset_type": {
                "type": "string",
                "description": "Private Equity"
            },
            "regulating_authority": {
                "type": "string",
                "description": "US"
            }
        }
    }

**/

contract CertificateHash is ERC721Full {

    constructor() ERC721Full("CertificateHash", "DIGITAL") public { }

    using Counters for Counters.Counter;
    Counters.Counter token_ids;

    struct Certificate {
        string certificateID;
        uint certificates;
    }

    // Stores token_id => Certificate
    // Only permanent data that you would need to use within the smart contract later should be stored on-chain
    mapping(uint => Certificate) public equityCertificates;
    
    event Issuance(uint token_id, string issuance_uri);

    function createNewCertificate(address owner, string memory certificateID, string memory token_uri) public returns(uint) {
        token_ids.increment();
        uint token_id = token_ids.current();

        _mint(owner, token_id);
        _setTokenURI(token_id, token_uri);

        equityCertificates[token_id] = Certificate(certificateID, 0);

        return token_id;
    }

    function issuanceCertificate(uint token_id, string memory issuance_uri) public returns(uint) {
        equityCertificates[token_id].certificates += 1;

        // Permanently associates the issuance_uri with the token_id on-chain via Events for a lower gas-cost than storing directly in the contract's storage.
        emit Issuance(token_id, issuance_uri);

        return equityCertificates[token_id].certificates;
    }
}
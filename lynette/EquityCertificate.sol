pragma solidity 0.5.12;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/ownership/Ownable.sol";


contract EquityCertificateCreator is ERC20, ERC20Detailed, Ownable {
  string[] public equityCertificate;
  mapping(string => uint256) public equityCertificateValue;

  event CreateNewCertificate(
    address indexed approvedBy,
    uint indexed value,
    string tokenCertificate);

  constructor(address _owner, string memory _name, string memory _symbol)
  ERC20Detailed(_name, _symbol, 18)
  public {
    transferOwnership(_owner);
  }

  function createNewCertificate(uint _value, string memory _tokenCertificate) public onlyOwner {
    require(_value > 0, "Certificate must have a value greater than 0");
    require(equityCertificateValue[_tokenCertificate] == 0, "Certificate already issued");
    equityCertificate.push(_tokenCertificate);
    equityCertificateValue[_tokenCertificate] = _value;
    _mint(owner(), _value);
    emit CreateNewCertificate(owner(), _value, _tokenCertificate);
  }

  function retire(uint256 _value) public {
    _burn(msg.sender, _value);
  }

  function equityCertificateLength() public view returns (uint length) {
    return equityCertificate.length;
  }
}
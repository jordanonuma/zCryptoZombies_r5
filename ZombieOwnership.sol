pragma solidity ^0.4.25;
import "./zombieattack.sol";
import "./ERC721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {
  function balanceOf(address _owner) external view returns (uint256) {
    
  } //end function balanceOf()

  function ownerOf(uint256 _tokenId) external view returns (address) {
    
  } //end function ownerOf()

  function transferFrom(address _from, address _to, uint256 _tokenId) external payable {

  } //end function transferFrom()
} //end contract ZombieOwnership {}
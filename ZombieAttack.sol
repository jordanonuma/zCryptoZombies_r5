pragma solidity >=0.5.0 <0.6.0; //not sure on the deviation from ^0.4.25
import "./zombiehelper.sol";

contract ZombieAttack is ZombieHelper {
  uint randNonce = 0;
  uint attackVictoryProbability = 70;

  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  } //end function randMod()
} //end contract ZombieAttack{}
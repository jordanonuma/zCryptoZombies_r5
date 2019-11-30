pragma solidity ^0.4.25;
import "./ZombieFeeding.sol"

contract ZombieHelper is ZombieFeeding {
  modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
  } //end modifier aboveLevel()

  function changeName(uint _zombieId, string _newName) external aboveLevel(2, _zombieId) {
    require(msg.sender = zombieToOwner[_zombieId]); //how is different than using onlyOwner?
    zombies[_zombieId].name = _newName;
  } //end function changeName()

  function changeDna(uint _zombieId, string _newName) external aboveLevel(20, _zombieId) {
      
  } //end function changeDna()
} //end contract ZombieHelper{}
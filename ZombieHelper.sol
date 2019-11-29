pragma solidity ^0.4.25;
import "./ZombieFeeding.sol"

contract ZombieHelper is ZombieFeeding {
  modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
  } //end modifier aboveLevel()
} //end contract ZombieHelper{}
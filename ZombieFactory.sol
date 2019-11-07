pragma solidity ^0.4.25;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    } // end struct Zombie {}

    Zombie[] public zombies; //This is the array 'zombies' made of the Zombie[] struct above

    function _createZombie(string _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    } //end function createZombie()

    function _generateRandomDna(string _str) private view returns(uint) {
        uint rand = keccak256(abi.encodePacked(_str));
        return rand % dnaModulus;
    } //end function _generateRandomDna()
} //end contract ZombieFactory {}
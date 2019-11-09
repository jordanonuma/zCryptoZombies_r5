pragma solidity ^0.4.25;

contract ZombieFactory {
    event NewZombie(uint zombieId, string name, uint dna); //tels front end when a new zombie has been created

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    } // end struct Zombie {}

    Zombie[] public zombies; //This is the array 'zombies' made of the Zombie[] struct above

    function _createZombie(string _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
        uint id = zombies.push() - 1;
    } //end function createZombie()

    function _generateRandomDna(string _str) private view returns(uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    } //end function _generateRandomDna()

    function createRandomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    } //end function createRandomZombie()
} //end contract ZombieFactory {}
pragma solidity ^0.4.25;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    } // end struct Zombie {}

    Zombie[] public zombies; //This is the array 'zombies' made of the Zombie[] struct above

    function createZombie(string _name, uint _dna) {
        
    } //end function createZombie()
} //end contract ZombieFactory {}
pragma solidity 0.4.25;

import "./ZB/ZBGameMode.sol";

//ZombiePile will put both players' decks into a single bucket where both players will draw from.

contract ZombiePile is ZBGameMode  {
    mapping (string => bool) internal bannedCards; //will map "True" or "False" wrt card is banned or not

    constructor() public {
        bannedCards["Leash"] = true;
        bannedCards["Bulldozer"] = true;
        bannedCards["Lawnmower"] = true;
        bannedCards["Shopping Cart"] = true;
        bannedCards["Stapler"] = true;
        bannedCards["Nail Bomb"] = true;
        bannedCards["Goo Bottles"] = true;
        bannedCards["Molotov"] = true;
        bannedCards["Super Goo Serum"] = true;
        bannedCards["Junk Spear"] = true;
        bannedCards["Fire Extinguisher"] = true;
        bannedCards["Fresh Meat"] = true;
        bannedCards["Chainsaw"] = true;
        bannedCards["Bat"] = true;
        bannedCards["Whistle"] = true;
        bannedCards["Supply Drop"] = true;
        bannedCards["Goo Beaker"] = true;
        bannedCards["Zed Kit"] = true;
        bannedCards["Torch"] = true;
        bannedCards["Shovel"] = true;
        bannedCards["Boomstick"] = true;
        bannedCards["Tainted Goo"] = true;
        bannedCards["Corrupted Goo"] = true;
    } //end constructor()

    function beforeMatchStart(bytes serializedGameState) external {
        GameState memory gameState;
        gameState.init(serializedGameState);

        ZBSerializer.SerializedGameStateChanges memory changes;
        changes.init();
    
        CardInstance[] memory player1Cards = new CardInstance[](gameState.playerStates[0].cardsInDeck.length);
        CardInstance[] memory player2Cards = new CardInstance[](gameState.playerStates[1].cardsInDeck.length);
        uint player1CardCount = 0;
        uint player2CardCount = 0;

        for (uint i=0; i < gameState.playerStates.length; i++) {
            for (uint j = 0; j < gameState.playerStates[i].cardsInDeck.length; j++) {
                uint rand = uint(keccak256(abi.encodePacked(now, player1CardCount + player2CardCount))) % 2;
                if (player1CardCount > (gameState.playerStates[0].cardsInDeck.length + gameState.playerStates[1].cardsInDeck.length)/2) {
                    rand = 1;
                } else {
                    rand = 0;
                } //end else ()
                if (rand == 0) {
                    player1Cards[player1CardCount] = gameState.playerStates[i].cardsInDeck[j];
                    player1CardCount++;
                } else {
                    player2Cards[player2CardCount] = gameState.playerStates[i].cardsInDeck[j];
                    player2CardCount++;
                } //end if()
            } //end for (uint j)
        } //end for (uint i)
        changes.changePlayerCardsInDeck(Player.Player1, player1Cards, player1CardCount);
    } //end function beforeMatchStart()

    changes.emit();

} //end contract ZombiePile {}
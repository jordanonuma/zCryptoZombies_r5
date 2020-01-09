pragma solidity 0.4.25;

import "./ZB/ZBGameMode.sol";

contract ExampleGame is ZBGameMode  {

    function beforeMatchStart(bytes serializedGameState) external {
        GameState memory gameState;
        gameState.init(serializedGameState);

        ZBSerializer.SerializedGameStateChanges memory changes;
        changes.init();

        //Sets pre-match game states of players
        changes.changePlayerDefense(Player.Player2, 15);

        changes.changePlayerCurretGoo(Player.Player1, 3);
        changes.changePlayerCurretGoo(Player.Player2, 3);

        changes.changePlayerCurretGooVials(Player.Player1, 3);
        changes.changePlayerCurretGooVials(Player.Player2, 3);
        
        changes.changePlayerMaxGooVials(Player.Player1, 8);
        changes.changePlayerMaxGooVials(Player.Player2, 8);
    } //end function beforeMatchStart()

} //end contract ExampleGame {}
private ["_mypos","_myDir","_bombOwnerUID","_mags","_tool","_isAlive","_onLadder","_canDo"];

_mags = magazines player;
_tool = items player; 
_isAlive = alive cursorTarget;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);
if ((speed player <= 1) && !_isAlive && _canDo) then { //another if statement because fn_self actions is not a while loop.
	if ("TrapBear" in _mags) then {

		player playActionNow "Medic";
		 
		_mypos = getPosATL player;
		_bombOwnerUID =  getPlayerUID player;
		_myDir = getDir player;
		[player,"repair",0,false,20] call dayz_zombieSpeak;
		[player,20,true,(getPosATL player)] call player_alertZombies;
		sleep 5;
		[nil,player,rSAY,["trap_bear_0",60]] call RE; 
		player removeMagazine "TrapBear";
		DZ_boobyTrap = [_bombOwnerUID,_myPos,_myDir,player];
		publicVariableServer "DZ_boobyTrap"; //Send needed values to server.
		DZ_boobyTrap = []; //Clean up global variable.
		//cutText [format["You have placed an explosive trap."], "PLAIN DOWN"];
		
	} else {
		cutText [format["You do not have the required material."], "PLAIN DOWN"];
	};
};
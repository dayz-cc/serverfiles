private ["_mypos","_myDir","_bombOwnerUID","_mags","_tool","_isAlive","_onLadder","_canDo"];
_theBomb = _this select 3;
_mags = magazines player;
_tool = items player; 
_isAlive = alive _theBomb; //cursorTarget;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);
diag_log ("removeBomb called:");diag_log (_theBomb);diag_log (";isalive:");diag_log(_isAlive);
if ((speed player <= 1) && _canDo) then { // add isAlive check? //another if statement because fn_self actions is not a while loop.
		diag_log ("removeBomb2 called:");
		player playActionNow "Medic";
		 
		_mypos = getPosATL player;
		_bombOwnerUID =  getPlayerUID player;
		_myDir = getDir player;
		[player,"repair",0,false,20] call dayz_zombieSpeak;
		[player,20,true,(getPosATL player)] call player_alertZombies;
		sleep 5;
		[nil,player,rSAY,["trap_bear_0",60]] call RE; 
		DZ_boobyTrap2 = [_theBomb, player];
		publicVariableServer "DZ_boobyTrap2"; //Send needed values to server.
		DZ_boobyTrap2 = []; //Clean up global variable.

		
	
};
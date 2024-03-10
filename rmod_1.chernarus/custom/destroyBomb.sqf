private ["_bombOwnerUID","_bombPos","_bombDir","_spawnStash","_bombTrigger","_objectUID","_activationstatment"];
private ["_theBomb","_theBombTrigger","_pcid"];
diag_log ("destroyBomb called, player pcid:");
if (!isServer) exitWith {}; //Make sure this script runs only on server.
 
_theBomb = (_this select 0) select 0;      //diag_log format ["Bomb owner's UID is %1",_bombOwnerUID];
_pcid = owner ((_this select 0) select 1);
diag_log(_pcid);
_theBombTrigger = _theBomb getVariable["traptrigger",_theBomb];

if (!isNull _theBombTrigger && _theBombTrigger isKindOf "EmptyDetector") then {
	deleteVehicle _theBombTrigger;
	diag_log "GHK removed trap trigger";
};
//deleteVehicle _theBombTrigger;

deleteVehicle _theBomb;
diag_log "GHK removed trap object";
dz_trap_message = "You have removed an explosive trap.";
_pcid publicVariableClient "dz_trap_message"; //tell player client's machine that it is removed

//[nil,nil,rHINT,"SERVER: Removed trap"] call RE;
DZ_boobyTrap2 = nil;
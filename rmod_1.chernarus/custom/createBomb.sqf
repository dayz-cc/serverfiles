private ["_bombOwnerUID","_bombPos","_bombDir","_spawnStash","_bombTrigger","_objectUID","_activationstatment"];
if (!isServer) exitWith {}; //Make sure this script runs only on server.
 
_bombOwnerUID = (_this select 0) select 0;      //diag_log format ["Bomb owner's UID is %1",_bombOwnerUID];
_bombPos = (_this select 0) select 1;          //diag_log format ["Bomb's position is %1",_bombPos];
_bombDir = (_this select 0) select 2; 
_pcid = owner ((_this select 0) select 3);
 
//Create the stash object
_spawnStash = createVehicle ["Grave", [0,0,0], [], 0, "CAN_COLLIDE"];
//Prevent server from deleting the object by assigning it a blank UID.
_spawnStash setVariable ["ObjectUID",""];
_spawnStash setDir _bombDir;
_spawnStash allowDamage true;


diag_log format ["bomb1 entity found: %1", (_spawnStash)];
 
//Create the trigger object
_bombTrigger = createTrigger["EmptyDetector",[0,0,0]];
_bombTrigger setTriggerArea [5,5,0,false];
_bombTrigger setTriggerActivation ["ANY","PRESENT",true];
//_bombTrigger setTriggerStatements ["{(isPlayer _x) && (_x isKindOf 'Man')} count thisList > 0;","0 = [thisTrigger,_spawnStash,thislist] execVM 'custom\detonateBomb.sqf'",""]; //You don't want a vehicle like a helicopter to set off the trigger.
_bombTrigger setVariable ["triggerobject", _spawnStash, true];_spawnStash setVariable ["traptrigger", _bombTrigger, true]; //ghk lets relate them for future checks
_activationstatment = format ["0 = [thisTrigger,%1,thislist] execVM 'custom\detonateBomb.sqf'", _spawnStash];
_bombTrigger setTriggerStatements ["this","0 = [thisTrigger,'',thislist] execVM 'custom\detonateBomb.sqf'",""]; //You don't want a vehicle like a helicopter to set
_bombTrigger setVariable ["ownerUID",_bombOwnerUID];
 
//Set position of stash and trigger
_spawnStash setPosATL _bombPos;
_bombTrigger setPosATL _bombPos;
dz_trap_message = "You have placed an explosive trap.";
_pcid publicVariableClient "dz_trap_message"; //tell player client's machine that it is removed
DZ_boobyTrap = nil;


private["_position","_doLoiter","_unitTypes","_isNoone","_loot","_array","_agent","_type","_radius","_method","_nearByPlayer","_attempt","_myDest","_newDest","_lootType","_i"];
_player = _this select 0;
_unitTypes = 	[]+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
_doLoiter = 	true;

_loot = 	"";
_array = 	[];
_agent = 	objNull;

_type = _unitTypes call BIS_fnc_selectRandom;

//Create the Group and populate it
//diag_log ("Spawned: " + _type);
_radius = 40;
_method = "NONE";

_position = [_player,120,200,10,0,0,0] call BIS_fnc_findSafePos;

_i=1;
[_position,true,_unitTypes] call zombie_generate_noloot;
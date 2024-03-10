/*
[_obj] spawn player_packTent;
*/
private["_objectID","_objectUID","_obj","_ownerID","_dir","_pos","_bag","_holder","_weapons","_magazines","_backpacks","_objWpnTypes","_objWpnQty","_countr"];
_obj = _this select 3;

_ownerID 	= _obj getVariable["CharacterID","0"];
_objectID 	= _obj getVariable["ObjectID","0"];
_objectUID	= _obj getVariable["ObjectUID","0"];

player playActionNow "Medic";

player removeAction s_player_firestashout;
s_player_firestashout = -1;
_hasEtool = 		"ItemEtool" in items player;
if (!_hasEtool) exitWith {cutText ["You need to have an Entrenching Tool to create a stash point" , "PLAIN DOWN"]};
if(_ownerID != "0") then { //can there be legit char ids of "0"?
	_alreadyPacking = _obj getVariable["packing",0];

	if (_alreadyPacking == 1) exitWith {cutText ["The stash is already being removed" , "PLAIN DOWN"]};

	_obj setVariable["packing",1];

	_dir = direction _obj;
	_pos = getposATL _obj;
	
	_dis=20;
	_sfx = "tentpack";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
	
	sleep 3;

	//place holder for displaced items from the stash
	_holder = "WeaponHolder" createVehicle _pos; 
	
	_weapons = 	getWeaponCargo _obj;
	_magazines = 	getMagazineCargo _obj;
	_backpacks = 	getBackpackCargo _obj;
	
	//["dayzDeleteObj",[_objectID,_objectUID]] call callRpcProcedure;	
	dayzDeleteObj = [_objectID,_objectUID];
	publicVariable "dayzDeleteObj";
	if (isServer) then {
		dayzDeleteObj call server_deleteObj;
	};
	deleteVehicle _obj;
	
	//Add weapons
	_objWpnTypes = 	_weapons select 0;
	_objWpnQty = 	_weapons select 1;
	_countr = 0;
	{
		_holder addweaponcargoGlobal [_x,(_objWpnQty select _countr)];
		_countr = _countr + 1;
	} forEach _objWpnTypes;
	
	//Add Magazines
	_objWpnTypes = _magazines select 0;
	_objWpnQty = _magazines select 1;
	_countr = 0;
	{
		_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];
		_countr = _countr + 1;
	} forEach _objWpnTypes;

	//Add Backpacks
	_objWpnTypes = _backpacks select 0;
	_objWpnQty = _backpacks select 1;
	_countr = 0;
	{
		_holder addbackpackcargoGlobal [_x,(_objWpnQty select _countr)];
		_countr = _countr + 1;
	} forEach _objWpnTypes;
	
	cutText ["The stash has been removed", "PLAIN DOWN"];
} else {
	cutText ["This is not a Stash Point", "PLAIN DOWN"];
};
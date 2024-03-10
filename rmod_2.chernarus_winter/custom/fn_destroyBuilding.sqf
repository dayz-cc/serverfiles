scriptName "fn_destroyCity.sqf";
/*
	Author: Karel Moricky

	Description:
	Destroys building in given area based on input seed.

	Parameter(s):
	_this select 0: OBJECT - Destruction center //ghk made it a position
	_this select 1 (Optional): NUMBER - Destruction area diameter
	_this select 2 (Optional): NUMBER - Random seed
	_this select 3 (Optional): ARRAY - Array of blacklisted objects

	Returns:
	ARRAY - Particle sources
*/
//if (!isserver) exitwith {debuglog "Log: [Functions] ERROR: 'BIS_fnc_destroyCity' cannot run on client.";};

private ["_center","_areaSize","_seed","_blacklist","_fire","_debug","_buildings","_pos","_posX","_posY","_posTotal","_seedLocal","_marker","_centre","_size"];
//_debug = debug_mso;
_center = _this select 0;
_areaSize = if (count _this > 1) then {_this select 1} else {1000};
_seed = if (count _this > 2) then {_this select 2} else {1138};
_blacklist = if (count _this > 3) then {_this select 3} else {[]};
_fire = if (count _this > 4) then {_this select 4} else {true;};
_debug = if (isnil "_debug") then {false} else {_debug};

//if (typename _center == typename "") then {_center = markerpos _center};
//if (typename _center == typename objnull) then {_center = position _center};

if (_areaSize < 0) then {_areaSize = 1000;};
if (_seed < 0) then {_seed = 1138;};

_seed =  round(_seed % 42);
if (_seed == 0) then {_seed = 42;};

_buildings = _center nearobjects ["house",_areaSize];
_buildings = _buildings - _blacklist;
{
	_type = typeOf _x;
	_config = 		configFile >> "CfgBuildingLoot" >> _type;
	_canLoot = 		isClass (_config);
	_LootPos =  getArray (configFile >> "CfgBuildingLoot" >> _type >> "lootPos");

	//diag_log ("ghk house is: " + str(_x) + " typeof: " + str(_type) + " canLoot: " + str(_canLoot) + " is supermarket: " + str(_x isKindOf "Land_A_GeneralStore_01") + " LootPos: " + str(_LootPos));
	//seems only buildings within cfgbuildingloot.hpp can be damaged (canLoot == true). 
	//Only destroy buildings with no loot positions, since players *shouldnt* be able to enter them
	if ((_canLoot)&&(count _LootPos == 0)&&!(_x isKindOf "UH1Wreck_DZ"||_x isKindOf "UH60Wreck_DZ"||_x isKindOf "HeliCrash_No50s"||_x isKindOf "HeliCrash")) then {
	//diag_log ("ghk house is: " + str(_x) + " typeof: " + str(_type) + " canLoot: " + str(_canLoot) + " is supermarket: " + str(_x isKindOf "Land_A_GeneralStore_01") + " LootPos: " + str(_LootPos));
		_pos = position _x;
		_posX = _pos select 0;
		_posY = _pos select 1;
		_posTotal = _posX + _posY;
		_seedLocal = (_posTotal % _seed) / _seed;
			//_bc = boundingCenter _x;

	//	_pos = [(_pos select 0) + (_bc select 0), (_pos select 1) + (_bc select 2), (_pos select 2) + (_bc select 1)];
		_size = (boundingBox _x) select 1;

		if (_seedLocal < 0.5) then {
			//_x setdamage 0.8;
			for "_i" from 1 to 7 do {
				_x sethit [format ["dam%1",_i],1];
				_x sethit [format ["dam %1",_i],1];
			};
			if (_debug) then {_marker = createMarker ["X" + str _posTotal, position _x]; _marker setmarkertype "Dot"; _marker setmarkercolor "colorred";};
		} else {
			if (_seedLocal > 0.9) then {
				//_x hideobject true;
				_x setdamage 1;
				if (_debug) then {_marker = createMarker ["X" + str _posTotal, position _x]; _marker setmarkertype "Dot"; _marker setmarkercolor "colorblue";};
							if(_fire && !isDedicated) then {
									_centre = "HeliHEmpty" createVehicleLocal _pos;
				_centre setPos _pos;
				0 = [_centre, exp((_size select 0) * (_size select 1) * (_size select 2) / 500) min 10, time, false, false] spawn BIS_Effects_Burn;
							};
			} else {
				_x setdamage 0.5;
				if (_debug) then {_marker = createMarker ["X" + str _posTotal, position _x]; _marker setmarkertype "Dot"; _marker setmarkercolor "colorgreen";};
			};
		};
	
	};
	
} foreach _buildings;

true
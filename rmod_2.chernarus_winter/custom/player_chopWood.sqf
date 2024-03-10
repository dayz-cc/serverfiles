private["_location","_isOk","_dir","_classname","_trees","_nearObjects2","_inBuilding"];
private["_item"];
_item = _this;
call gear_ui_init;

 //GHK surfacetype check does not work on chernarus_winter, so check for trees within 15m instead.
 //Tried 5m , but it did not seem to return anything?
 	_trees = []; 
	_nearObjects2 = nearestObjects [player, [], 15];
	{
		
		if([": t_", str(_x)] call fnc_inString) then {
				_trees set [ count _trees,_x];
		};
		
	}forEach _nearObjects2;
	
	_inBuilding = [player] call fnc_isInsideBuilding; //this function is hoaky
	

//if (["forest",dayz_surfaceType] call fnc_inString) then {
if (((count _trees) > 0) && !_inBuilding) then {
		_result = [player,"PartWoodPile"] call BIS_fnc_invAdd;
		[player,"chopwood",0,false] call dayz_zombieSpeak;
		if (_result) then {
			cutText [localize "str_player_25", "PLAIN DOWN"];
		} else {
			cutText [localize "str_player_24", "PLAIN DOWN"];
		};
		[player,20,false,(getPosATL player)] spawn player_alertZombies;
		player playActionNow "Medic";
		sleep 3;
} else {
	cutText [localize "str_player_23", "PLAIN DOWN"];
};
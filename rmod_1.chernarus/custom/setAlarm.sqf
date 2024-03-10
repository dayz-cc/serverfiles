private ["_mypos","_myDir","_bombOwnerUID","_mags","_tool","_isAlive","_onLadder","_canDo"];
private["_i","_bait","_setBait","_targets","_group","_mypos","_zBomb"];

_mags = magazines player;
_tool = items player; 
_isAlive = alive cursorTarget;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);
if ((speed player <= 1) && !_isAlive && _canDo) then { //another if statement because fn_self actions is not a while loop.
	if ("ItemSandbag" in _mags) then {

	player playActionNow "Medic";
	[player,"repair",0,false,20] call dayz_zombieSpeak;
	[player,20,true,(getPosATL player)] call player_alertZombies;
	sleep 1;
	titleText ["You have placed a zombie bait bomb.","PLAIN DOWN"]; titleFadeOut 5;
	 
	_mypos = getposATL player;
	_dir = getdir player;
	_mypos = [(_mypos select 0)+(0.5)*sin(_dir),(_mypos select 1)+(0.5)*cos(_dir), (_mypos select 2)];
	_createBait = createVehicle ["Land_Bucket_EP1", _mypos, [], 0, "CAN_COLLIDE"];
	_createBait2 = createVehicle ["SatPhone", _mypos, [], 0, "CAN_COLLIDE"];
	_mypos2 = [(_mypos select 0)+(1)*sin(_dir),(_mypos select 1)+(1)*cos(_dir), (_mypos select 2)];
	_createBait setDir _dir;
	_createBait setposATL _mypos;
	_createBait2 setDir _dir;
	_createBait2 setposATL _mypos2;
	sleep 1;
	 
	player removeMagazine "ItemSandbag";
	sleep 20;
	_alarm = createSoundSource ["Sound_Alarm", _mypos2, [], 0]; //starts alarm 
	
	//spawn sound on all clients.
	//[nil, nil, rSPAWN, [_mpos2], {_alarmSound = ["Sound_Alarm","Sound_Alarm2"] call BIS_fnc_selectRandom;_alarm = createSoundSource [_alarmSound, (_this select 0), [], 0];sleep 30;deleteVehicle _alarm; }] call RE;
	
	
	_i = 0;
	_bait = nearestObject [player, "SatPhone"];
	_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
	//diag_log(_bait);diag_log("setbait:");diag_log(_setBait);
	{
		//diag_log("bait loop");
		_group = group _x;
		if (isNull group _x) then {
			_group = _x;
		};
		_x reveal [_bait,4];
		_targets = _group getVariable ["targets",[]];
		if (!(_bait in _targets)) then {
			//diag_log("bait target");
			_targets set [count _targets,_bait];
			_group setVariable ["targets",_targets,true];
		};
		_i = _i + 1;
	} forEach _setBait;
	 
	//sleep 90;
	
	sleep 15;
	
	
	_i = 0;
	_bait = nearestObject [player, "SatPhone"];
	_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
	//diag_log(_bait);diag_log("setbait:");diag_log(_setBait);
	{
		//diag_log("bait loop");
		_group = group _x;
		if (isNull group _x) then {
			_group = _x;
		};
		_x reveal [_bait,4];
		_targets = _group getVariable ["targets",[]];
		if (!(_bait in _targets)) then {
			//diag_log("bait target");
			_targets set [count _targets,_bait];
			_group setVariable ["targets",_targets,true];
		};
		_i = _i + 1;
	} forEach _setBait;
	
	
	sleep 15;
	
	
	_i = 0;
	_bait = nearestObject [player, "SatPhone"];
	_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
	//diag_log(_bait);diag_log("setbait:");diag_log(_setBait);
	{
		//diag_log("bait loop");
		_group = group _x;
		if (isNull group _x) then {
			_group = _x;
		};
		_x reveal [_bait,4];
		_targets = _group getVariable ["targets",[]];
		if (!(_bait in _targets)) then {
			//diag_log("bait target");
			_targets set [count _targets,_bait];
			_group setVariable ["targets",_targets,true];
		};
		_i = _i + 1;
	} forEach _setBait;
	
	
	sleep 15;
	
	
	_i = 0;
	_bait = nearestObject [player, "SatPhone"];
	_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
	//diag_log(_bait);diag_log("setbait:");diag_log(_setBait);
	{
		//diag_log("bait loop");
		_group = group _x;
		if (isNull group _x) then {
			_group = _x;
		};
		_x reveal [_bait,4];
		_targets = _group getVariable ["targets",[]];
		if (!(_bait in _targets)) then {
			//diag_log("bait target");
			_targets set [count _targets,_bait];
			_group setVariable ["targets",_targets,true];
		};
		_i = _i + 1;
	} forEach _setBait;	
	
	sleep 15;
	
	_i = 0;
	_bait = nearestObject [player, "SatPhone"];
	_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
	//diag_log(_bait);diag_log("setbait:");diag_log(_setBait);
	{
		//diag_log("bait loop");
		_group = group _x;
		if (isNull group _x) then {
			_group = _x;
		};
		_x reveal [_bait,4];
		_targets = _group getVariable ["targets",[]];
		if (!(_bait in _targets)) then {
			//diag_log("bait target");
			_targets set [count _targets,_bait];
			_group setVariable ["targets",_targets,true];
		};
		_i = _i + 1;
	} forEach _setBait;
	
	sleep 15; 
	
	_i = 0;
	_bait = nearestObject [player, "SatPhone"];
	_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
	//diag_log(_bait);diag_log("setbait:");diag_log(_setBait);
	{
		//diag_log("bait loop");
		_group = group _x;
		if (isNull group _x) then {
			_group = _x;
		};
		_x reveal [_bait,4];
		_targets = _group getVariable ["targets",[]];
		if (!(_bait in _targets)) then {
			//diag_log("bait target");
			_targets set [count _targets,_bait];
			_group setVariable ["targets",_targets,true];
		};
		_i = _i + 1;
	} forEach _setBait;	

	
	deleteVehicle _alarm;
	sleep 4;
	_zBomb = createVehicle ["grenade",position _bait, [], 0, "NONE"];
	sleep 1;
	cutText ["Your zombie bait bomb has exploded.","PLAIN DOWN"]; titleFadeOut 5;
	systemChat "Your zombie bait bomb has exploded.";
	deleteVehicle _createBait;deleteVehicle _createBait2;
 
//player removeAction zombieBait;

	} else {
		cutText [format["You do not have the required material."], "PLAIN DOWN"];
	};
};
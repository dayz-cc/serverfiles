private["_array","_source","_kills","_killsV","_humanity","_wait","_myKills","_method"];
if (deathHandled) exitWith {};

deathHandled = true;
//Death

_body =		player;
_playerID =	getPlayerUID player;

//Send Death Notice
//["dayzDeath",[dayz_characterID,0,_body,_playerID,dayz_playerName]] call callRpcProcedure;
		dayzDeath = [dayz_characterID,0,_body,_playerID,dayz_playerName];
		publicVariable "dayzDeath";

_id = [player,20,true,getPosATL player] spawn player_alertZombies;

//GHK, to workaround problems with unlootable corpses, for now, create a small ammobox to grab all of player's inventory, backpack & backpack inventory for looting.
//taken from player_switchModel.sqf
	private ["_lootammobox","_playerdir","_playerpos","_weapons","_magazines","_primweapon","_secweapon","_newBackpackType","_backpackWpn","_backpackMag"];
	_playerdir = getDir player;
	_playerpos = getPosATL player;
	_lootammobox = createVehicle ["AmmoBoxSmall_556",[(_playerpos select 0), (_playerpos select 1), 0], [], 0,  "NONE"]; //use getPosATL player intead of position player
	_lootammobox setDir _playerdir;
	clearWeaponCargoGlobal _lootammobox;
	clearMagazineCargoGlobal _lootammobox;
	clearBackpackCargoGlobal _lootammobox;
	_weapons 	= weapons player;
	_magazines	= call player_countmagazines; //magazines player;
	_primweapon	= primaryWeapon player;
	_secweapon	= secondaryWeapon player;

	//Checks
	if(!(_primweapon in _weapons) && _primweapon != "") then {
		_weapons = _weapons + [_primweapon];
	};

	if(!(_secweapon in _weapons) && _secweapon != "") then {
		_weapons = _weapons + [_secweapon];
	};
	
	dayz_myBackpack = unitBackpack player;
	_newBackpackType = (typeOf dayz_myBackpack);
	if(_newBackpackType != "") then {
		_backpackWpn = getWeaponCargo unitBackpack player;
		_backpackMag = getMagazineCargo unitBackpack player;
	};
	
	//Equip ammobox with player's direct inventory
	{
		//if (typeName _x == "ARRAY") then {_lootammobox addMagazineCargoGlobal [_x select 0,_x select 1] } else { _lootammobox addMagazineCargoGlobal [_x,1] };
		//Cant define ammocount when adding magazines to cargo, so either max out all magazines, option1:
		if (typeName _x == "ARRAY") then {_lootammobox addMagazineCargoGlobal [_x select 0,1] } else { _lootammobox addMagazineCargoGlobal [_x,1] };
		//Or, option2, simply not give used magazines?
		//if (typeName _x == "ARRAY") then { } else { _lootammobox addMagazineCargoGlobal [_x,1] };
	} forEach _magazines;
	
	{
		_lootammobox addWeaponCargoGlobal [_x,1];
		//sleep 0.05;
	} forEach _weapons;
	//now addbackpack if it existed and any of its cargo directly to the ammobox
	if (!isNil "_newBackpackType") then {
		if (_newBackpackType != "") then {
		
			_lootammobox addBackpackCargoGlobal [_newBackpackType,1];

			//Fill ammobox with old backpack contents
			//Weapons
			_backpackWpnTypes = [];
			_backpackWpnQtys = [];
			if (count _backpackWpn > 0) then {
				_backpackWpnTypes = _backpackWpn select 0;
				_backpackWpnQtys = 	_backpackWpn select 1;
			};
			_countr = 0;
			{
				_lootammobox addWeaponCargoGlobal [_x,(_backpackWpnQtys select _countr)];
				_countr = _countr + 1;
			} forEach _backpackWpnTypes;
			//magazines
			_backpackmagTypes = [];
			_backpackmagQtys = [];
			if (count _backpackmag > 0) then {
				_backpackmagTypes = _backpackMag select 0;
				_backpackmagQtys = 	_backpackMag select 1;
			};
			_countr = 0;
			{
				_lootammobox addmagazineCargoGlobal [_x,(_backpackmagQtys select _countr)];
				_countr = _countr + 1;
			} forEach _backpackmagTypes;
		};
	};
	//Now clear everything from the player
	clearMagazineCargoGlobal player;
	clearWeaponCargoGlobal player;
	{player removeMagazine _x;} forEach  magazines player;
	
	{player removeWeapon _x;} forEach  weapons player;
	clearMagazineCargoGlobal (unitBackpack player);
	clearWeaponCargoGlobal (unitBackpack player);
	removeBackpack player;
	clearBackpackCargoGlobal player;
	//To be safe set dayz_myBackpack to null
	dayz_myBackpack = objNull;
	
//GHK End lootable fix


sleep 0.5;

player setDamage 1;
0.1 fadeSound 0;

player setVariable ["NORRN_unconscious", false, true];
player setVariable ["unconsciousTime", 0, true];
player setVariable ["USEC_isCardiac",false,true];
player setVariable ["medForceUpdate",true,true];
//remove combat timer on death
player setVariable ["startcombattimer", 0, true];
r_player_unconscious = false;
r_player_cardiac = false;

_id = player spawn spawn_flies;

_humanity =		0;
_wait = 		0;

_array = _this;
if (count _array > 0) then {
	_source = _array select 0;
	_method = _array select 1;
	if (!isNull _source) then {
		if (_source != player) then {
			_canHitFree = 	player getVariable ["freeTarget",false];
			_isBandit = (["Bandit",typeOf player,false] call fnc_inString);
			_myKills = 		((player getVariable ["humanKills",0]) / 30) * 1000;
			if (!_canHitFree and !_isBandit) then {
				//Process Morality Hit
				_humanity = -(2000 - _myKills);
				_kills = 		_source getVariable ["humanKills",0];
				_source setVariable ["humanKills",(_kills + 1),true];
				_wait = 300;
			} else {
				//Process Morality Hit
				//_humanity = _myKills * 100;
				_killsV = 		_source getVariable ["banditKills",0];
				_source setVariable ["banditKills",(_killsV + 1),true];
				_wait = 0;
			};
			if (_humanity < 0) then {
				_wait = 0;
			};
			if (!_canHitFree and !_isBandit) then {
				//["dayzHumanity",[_source,_humanity,_wait]] call broadcastRpcCallAll;
				dayzHumanity = [_source,_humanity,_wait];
				publicVariable "dayzHumanity";
			};
		};
	};
	_body setVariable ["deathType",_method,true];
};

terminate dayz_musicH;
//terminate dayz_lootCheck; //GHK bug fix
terminate dayz_slowCheck;
terminate dayz_animalCheck;
terminate dayz_monitor1;
terminate dayz_medicalH;
terminate dayz_gui;
//terminate dayz_zedCheck; //GHK bug fix
terminate dayz_locationCheck;
//terminate dayz_combatCheck; //GHK bug fix
terminate dayz_spawnCheck;

//Reset (just in case)
//deleteVehicle dayz_playerTrigger;
disableUserInput false;
r_player_dead = true;

"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [4]; "dynamicBlur" ppEffectCommit 0.2;

"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.01],  [1, 1, 1, 0.0]];
"colorCorrections" ppEffectCommit 1;

//Player is Dead!
3 fadeSound 0;
0 cutText ["", "BLACK",10];
dayz_DeathActioned = true;
sleep 1;

TitleText[localize "str_player_12","PLAIN DOWN",5];

dayz_originalPlayer enableSimulation true;

addSwitchableUnit dayz_originalPlayer;
setPlayable dayz_originalPlayer;
selectPlayer dayz_originalPlayer;

_myGroup = group _body;
[_body] joinSilent dayz_firstGroup;
deleteGroup _myGroup;

3 cutRsc ["default", "PLAIN",3];
4 cutRsc ["default", "PLAIN",3];

if (count _array > 0) then {
	_body setVariable ["deathType",_method,true];
};

_body setVariable["combattimeout", 0, true];

//["dayzFlies",player] call broadcastRpcCallAll;
sleep 2;

1 cutRsc ["DeathScreen","BLACK OUT",3];


playMusic "dayz_track_death_1";

"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;
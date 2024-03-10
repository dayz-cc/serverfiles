private["_position","_doLoiter","_unitTypes","_isNoone","_loot","_array","_agent","_type","_radius","_method","_nearByPlayer","_attempt","_myDest","_newDest","_lootType","_rndx","_rndy","_markerName"];
_position = 	_this select 0;

//GHK Add Hordes spawning in from anomalies
//called every 8 seconds when in the wilderness and in fog zone.

if (dz_horde && ((random 400) < dz_horde_chance)) then {

private ["_zomblesposition","_loopnum","_soundname"];
_zomblesposition = [_position ,10,60,5,0,0,0] call BIS_fnc_findSafePos;
//GHK, if BIS_fnc_findSafePos cant find a position, it eventually picks the center of the map which also lags the game for some reason, real bad when zombies are spawn there, and there are no players there. 
if(_zomblesposition distance [7100,7750,300] == 0||player distance _zomblesposition > 80) exitWith {};
_noNearByPlayer = {isPlayer _x} count (_zomblesposition nearEntities [["AllVehicles","CAManBase"],30]) == 0;
//(count ((_zomblesposition) nearEntities ["CAManBase",30])) == 0; //({isPlayer _x} count (_zomblesposition nearEntities [["AllVehicles","CAManBase"],30]) > 0);
_radius = 40; //10;

if (_noNearByPlayer) then {

	/*
		_markerName = "zp_" + str(time);
		_markerstr = createMarker [_markerName,_zomblesposition];
		_markerstr setMarkerColor "ColorGreen";
		_markerstr setMarkerShape "ELLIPSE";
		_markerstr setMarkerBrush "Border";
		_markerstr setMarkerSizeLocal [30, 30];
	*/


[_zomblesposition] spawn {

private ["_zomblesposition","_soundname","_sound","_sound2","_loopnum","_i","_zombletypes"];

_zomblesposition = _this select 0;

//spawn anomaly effect at spawn position to be MP friendly.
switch (floor random 3) do {
    case 0: { [nil, nil, rEXECVM, "addin\anomalyFireRE.sqf",_zomblesposition] call RE; //call createsoundsource here outside of RE with a similar sleep;
		_soundname ="Sound_Factory09";
	};
	case 1: { [nil, nil, rEXECVM, "addin\anomalySparkRE.sqf",_zomblesposition] call RE; 
		_soundname ="Sound_Factory09";
	};
    case 2: { [nil, nil, rEXECVM, "addin\anomalyStoneRE.sqf",_zomblesposition] call RE;
		_soundname ="Sound_Factory09";
	};
};

	_sound = createSoundSource [_soundname, _zomblesposition, [], 0];
	//at spawn pos, as well as near player to warn them:
	//_sound2 = createSoundSource [_soundname, position player, [], 0];

sleep 5;


	_zombletypes = [
"zZombie_Base",
"z_worker1",
"z_worker2",
"z_worker3",
"z_villager1",
"z_villager2",
"z_villager3",
"z_suit1",
"z_suit2",
"zZombie_Base",
"z_worker1",
"z_worker2",
"z_worker3",
"z_villager1",
"z_villager2",
"z_villager3",
"z_suit1",
"z_suit2",
"z_soldier",
"z_soldier_heavy",
"z_soldier_pilot",
"z_policeman",
"z_teacher",
"z_teacher",
"z_doctor",
"z_hunter",
"z_hunter",
"z_priest"
];
_i = 1;
	
	_loopnum = round(random 30) max 10;
		sleep 1;
		for "_i" from 1 to _loopnum  do
		{
			if (dayz_maxCurrentZeds > dayz_maxZeds) exitwith {};
			if (dayz_CurrentZombies > dayz_maxGlobalZombies) exitwith {}; 
			if (dayz_spawnZombies > dayz_maxLocalZombies) exitwith {}; 
			//if(_i mod 5 == 0) then {sleep 1; }; //max of 6 seconds to sleep if 30 zombies
				
				[_zomblesposition,true,_zombletypes] call zombie_generate;
				
				sleep 0.2;
				//diag_log("GHK spawned a horde member");
				//diag_log(dayz_spawnZombies);
		};
		deleteVehicle _sound;//deleteVehicle _sound2;
	};
};


 };

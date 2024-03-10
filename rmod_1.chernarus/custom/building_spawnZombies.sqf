private["_obj","_type","_config","_canLoot","_unitTypes","_min","_max","_num","_zombieChance","_rnd","_noPlayerNear","_position","_clean","_positions","_iPos","_nearBy","_nearByPlayer"];
private "_zombletypes";private "_i";private "_loopnum";private "_zomblesposition";private "_radius";private "_noNearByPlayer";private "_genzombles";private "_agent";private "_zombleselectedpos";
private "_isAlive";private "_myDest";private "_newDest";private "_lootType";private "_loot";private "_rnd";private "_blood_skin";private "_mutant_skin";private "_meters";
_obj = _this select 0;
_type = 		typeOf _obj;
_config = 		missionConfigFile >> "CfgBuildingLoot" >> _type;
_canLoot = 		isClass (_config);

if (dayz_maxCurrentZeds > dayz_maxZeds) exitwith {};
if (dayz_CurrentZombies > dayz_maxGlobalZombies) exitwith {}; 
if (dayz_spawnZombies > dayz_maxLocalZombies) exitwith {}; 
if((getDammage _obj) == 1) exitwith {}; //GHK for nuke blasts stop spawning zombies for decimated buildings?

if (_canLoot) then {
//Get zombie class
	_unitTypes = 	getArray (_config >> "zombieClass");
	_min = 			getNumber (_config >> "minRoaming");
	_max = 			getNumber (_config >> "maxRoaming");
	
//Walking Zombies
	//_num = round(random _max) min _min;
	_num = round(random _max) max _min;
	//GHK
	//_num =_num + 1;
	_config = 		missionConfigFile >> "CfgBuildingLoot" >> _type;
//Get zombie class
	_zombieChance =	getNumber (_config >> "zombieChance");
	_rnd = random 1;

	//if (_rnd < _zombieChance) then {
		
		_noPlayerNear = (count ((getPosATL _obj) nearEntities ["CAManBase",30])) == 0;
		
		if (_noPlayerNear) then {
		
			//_position = _obj buildingExit 0;
			//if ((_position select 0) == 0) then {
				_position = getPosATL _obj;
			//};
		
		//diag_log ("Class: " + _type + " / Zombies: " + str(_unitTypes) + " / Walking: " + str(_num));
			for "_i" from 1 to _num do
			{
				[_position,true,_unitTypes] call zombie_generate;
			};
			
		};
	//};

	
	//Add Internal Zombies
	_clean = {alive _x} count ((getPosATL _obj) nearEntities ["zZombie_Base",(sizeOf _type)]) == 0;
	if (_clean) then {
		_positions =	getArray (_config >> "lootPos");
		_zombieChance =	getNumber (_config >> "zombieChance");
		//diag_log format["Building: %1 / Positions: %2 / Chance: %3",_type,_positions,_zombieChance];
		{
			_rnd = random 1;
			if (_rnd < _zombieChance) then {
				_iPos = _obj modelToWorld _x;
				_nearBy = {alive _x} count nearestObjects [_iPos, ["zZombie_Base"],1] > 0;
				_nearByPlayer = ({isPlayer _x} count (_iPos nearEntities ["CAManBase",30])) > 0;
				//diag_log ("BUILDING: " + _type + " / " + str(_nearBy) + " / " + str(_nearByPlayer));
				if (!_nearByPlayer and !_nearBy) then {
					[_iPos,true,_unitTypes] call zombie_generate;
				};
			};
		} forEach _positions;
	};
	
	 private["_meters"];
if ((_type == "Land_bspawn" || _type == "Land_a_Stationhouse" || _type == "Land_Church_02a" || _type == "Land_Church_02" || _type == "Land_Church_03" || _type == "Land_Church_01" || _type == "Land_Hlidac_budka" || _type == "Land_kulna" || _type == "Land_Mil_Barracks_i") && dzn_ns_bloodsucker && (!dayz_won_the_game) && (dz_bloodsucker_count <= dz_max_globalbloodsuckers) &&(((random 400) < dzn_ns_bloodsucker_den)||(_obj getVariable["spawn_ns_bloodsucker",0]>0))) then {
  private["_content", "_originalPos"];
  
  _rnd = random 1;
  if (_rnd < 0.15) then { //ghk 15% chance of dropping a mut heart
   _content = "this addWeapon 'mut_heart'";
  } else {
   _content = "";
  };
  
  _originalPos = getPos _obj;
 // diag_log ("ghk spawn bloodsucker called");
  	_blood_skin = round(random 3);
	switch (_blood_skin) do {
		case 0: { _mutant_skin = "\nst\ns_mutants\blood\act_krovosos_new1.paa";};
		case 1: { _mutant_skin = "\nst\ns_mutants\blood\act_krovosos_3.paa"; };
		case 2: { _mutant_skin = "\nst\ns_mutants\blood\act_krovosos_2.paa"; };
		case 3: { _mutant_skin = "\nst\ns_mutants\blood\act_krovosos_2.paa"; };
	};
	
	
	_content ='this addeventhandler ["Killed",{[_this,"zombieKills"] call local_eventKillMutant}];' + _content;
	
	
	if(_obj getVariable["spawn_ns_bloodsucker",0]>0) then { 
		
		//lets max out the local bloodsuckers in area to 8
		if(({alive _x} count (_originalPos nearEntities ["ns_bloodsucker", 510])) < 4) then {
			switch (_obj getVariable["spawn_ns_bloodsucker",0]) do
			{
				//green  mountain
				case 1:
				{ 
				"uac_bloodsucker" createUnit [[(_originalPos select 0) - 5, (_originalPos select 1) + 5, 0], group sefik, _content, 1, "CORPORAL"];
				dz_bloodsucker_count = dz_bloodsucker_count + 1; // 3;
				publicVariable "dz_bloodsucker_count";
				};
				//science lab
				case 2:
				{
				"ns_bloodsucker" createUnit [[(_originalPos select 0) - 5, (_originalPos select 1) + 5, 0], group sefik, _content, 1, "CORPORAL"];
				"ns_bloodsucker" createUnit [[(_originalPos select 0), (_originalPos select 1), 0], group sefik, _content, 1, "CORPORAL"];
				dz_bloodsucker_count = dz_bloodsucker_count + 2; // 3;
				publicVariable "dz_bloodsucker_count";
				};
			};	
			if(dayz_bloodsucker_warn) then {
				private ["_ghkhint"];
				_ghkhint = ["You hear growls nearby","You hear a loud roar nearby","You hear screeching and howling nearby"] call BIS_fnc_selectRandom;
				{
					if (isPlayer _x AND (_x distance _originalPos) <= 510) then {
						 [nil, _x,"loc" + "per",rEXECVM, "custom\dzaihint.sqf",_ghkhint] call RE;
					};
				} foreach playableUnits;
			};
		};
		
	} else {
		//check if we are in bloodsucker zone which is approx sqroot(2)*2000 meters. 
		//_meters = player distance GetMarkerPos "ghkbszone";
		if(dayz_BSZonePos <= 2800 ) then { //check if the player is within the  bloodsucker zone 
			//lets max out the local bloodsuckers in area to 2
			if(({alive _x} count (_originalPos nearEntities ["ns_bloodsucker", 560])) < 2) then {
				"uac_bloodsucker" createUnit [[(_originalPos select 0) + (random 60), (_originalPos select 1) - (random 60), 0], group sefik, _content, 1, "CORPORAL"];
				dz_bloodsucker_count = dz_bloodsucker_count + 1;
				publicVariable "dz_bloodsucker_count";
				
				
				private ["_ghkhint"];
				_ghkhint = ["You hear growls nearby","You hear a loud roar nearby","You hear screeching and howling nearby"] call BIS_fnc_selectRandom;
				{
					if (isPlayer _x AND (_x distance _originalPos) <= 560) then {
						 [nil, _x,"loc" + "per",rEXECVM, "custom\dzaihint.sqf",_ghkhint] call RE;
					};
				} foreach playableUnits;
			
			};
		};
		
	};

 };
	dayz_buildingMonitor set [count dayz_buildingMonitor,_obj];
};
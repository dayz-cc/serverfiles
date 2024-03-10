

//GHK to support custom scoretable playerstats numpad 2 key
dayz_spaceInterrupt = {
		private ["_dikCode", "_handled"];
		_dikCode = 	_this select 1;
		_handled = false;
		if (_dikCode in (actionKeys "GetOver")) then {
			if (!r_fracture_legs and (time - dayz_lastCheckBit > 4)) then {
				_inBuilding = [player] call fnc_isInsideBuilding;
				_nearbyObjects = nearestObjects[getPosATL player, ["TentStorage", "Hedgehog_DZ", "Sandbag1_DZ","TrapBear","Wire_cat1"], 8];
				if (!_inBuilding and (count _nearbyObjects == 0)) then {
					dayz_lastCheckBit = time;
					call player_CombatRoll;
				};
			};
		};
		//if (_dikCode == 57) then {_handled = true}; // space
		//if (_dikCode in actionKeys 'MoveForward' or _dikCode in actionKeys 'MoveBack') then {r_interrupt = true};
		if (_dikCode == 0xD2) then //Insert on keypad:  F12?
		{

			switch (dz_scoreboard_time mod 4) do {
				case 0: { _nill = execvm "custom\playerstats.sqf";dz_scoreboard_on=true;dz_scoreboard_type=1;dz_custom_monitor_on=false; }; //regular scoreboard on
				case 1: {_nill = execvm "custom\playerstats.sqf";dz_scoreboard_on=true;dz_scoreboard_type=0;dz_custom_monitor_on=false; }; //secondary scoreboard on
				case 2: { dz_scoreboard_on=false;dz_scoreboard_type=1;dz_custom_monitor_on=true;  }; //custom monitor on
				case 3: { dz_scoreboard_on=false;dz_scoreboard_type=1;dz_custom_monitor_on=false; }; //no scoreboard or custom monitor			
			};
			
			dz_scoreboard_time = dz_scoreboard_time +1;
		};
		if (_dikCode in actionKeys "MoveLeft") then {r_interrupt = true};
		if (_dikCode in actionKeys "MoveRight") then {r_interrupt = true};
		if (_dikCode in actionKeys "MoveForward") then {r_interrupt = true};
		if (_dikCode in actionKeys "MoveBack") then {r_interrupt = true};
		if (_dikCode in actionKeys "ForceCommandingMode") then {_handled = true};
		if (_dikCode in actionKeys "PushToTalk" and (time - dayz_lastCheckBit > 10)) then {
			dayz_lastCheckBit = time;
			[player,50,true,(getPosATL player)] spawn player_alertZombies;
		};
		if (_dikCode in actionKeys "VoiceOverNet" and (time - dayz_lastCheckBit > 10)) then {
			dayz_lastCheckBit = time;
			[player,50,true,(getPosATL player)] spawn player_alertZombies;
		};
		if (_dikCode in actionKeys "PushToTalkDirect" and (time - dayz_lastCheckBit > 10)) then {
			dayz_lastCheckBit = time;
			[player,15,false,(getPosATL player)] spawn player_alertZombies;
		};
		if (_dikCode in actionKeys "Chat" and (time - dayz_lastCheckBit > 10)) then {
			dayz_lastCheckBit = time;
			[player,15,false,(getPosATL player)] spawn player_alertZombies;
		};
		if (_dikCode in actionKeys "User20" and (time - dayz_lastCheckBit > 5)) then {
			dayz_lastCheckBit = time;
			_nill = execvm "\z\addons\dayz_code\actions\playerstats.sqf";
		};
		if ((_dikCode == 0x3E or _dikCode == 0x0F or _dikCode == 0xD3) and (time - dayz_lastCheckBit > 10)) then {
			dayz_lastCheckBit = time;
			call dayz_forceSave;
		};
		_handled
	};

player_makeStash =			compile preprocessFileLineNumbers "custom\player_makestash.sqf";
player_removeStash =		compile preprocessFileLineNumbers "custom\player_removeStash.sqf";
player_gearSync	=			compile preprocessFileLineNumbers "custom\player_gearSync.sqf";	
fn_ShellSort = compile preprocessFileLineNumbers "custom\fn_shellSort.sqf";
player_build =				compile preprocessFileLineNumbers "custom\player_build.sqf";
fnc_usec_selfActions = compile preprocessFileLineNumbers "custom\fn_selfActions.sqf"; 
fnc_usec_unconscious =		compile preprocessFileLineNumbers "custom\fn_unconscious.sqf";
building_spawnZombies = compile preprocessFileLineNumbers "custom\building_spawnZombies.sqf";
zombie_generate = compile preprocessFileLineNumbers "custom\zombie_generate.sqf";	
zombie_generate_noloot = compile preprocessFileLineNumbers "custom\zombie_generate_noloot.sqf";
zombie_generate_horde = compile preprocessFileLineNumbers "custom\zombie_generate_horde.sqf";	
wild_spawnZombies = compile preprocessFileLineNumbers "custom\wild_spawnZombies.sqf";
player_spawnCheck = compile preprocessFileLineNumbers "custom\player_spawnCheck.sqf";
call compile preprocessFileLineNumbers "custom\my_functions.sqf";
radiomessage = compile preprocessFileLineNumbers "custom\radiomessage.sqf";
dzaihint = compile preprocessFileLineNumbers "custom\dzaihint.sqf";
player_death =				compile preprocessFileLineNumbers "custom\player_death.sqf";
player_zombieCheck = 		compile preprocessFileLineNumbers "custom\player_zombieCheck.sqf";	//Run on a players computer, checks if the player is near a zombie
player_spawn_2 =			compile preprocessFileLineNumbers "custom\player_spawn_2.sqf";
fnc_usec_damageActions =	compile preprocessFileLineNumbers "custom\fn_damageActions.sqf";		//Checks which actions for nearby casualty

zombie_findTargetAgent = 	compile preprocessFileLineNumbers "custom\zombie_findTargetAgent.sqf";
player_fired =				compile preprocessFileLineNumbers "custom\player_fired.sqf";			//Runs when player fires. Alerts nearby Zeds depending on calibre and audial rating
//fnc_usec_damageHandler =	compile preprocessFileLineNumbers "custom\fn_damageHandler.sqf";		//Event handler run on damage
building_spawnLoot =		compile preprocessFileLineNumbers "custom\building_spawnLoot.sqf"; //use missionConfig
player_monitor =			compile preprocessFileLineNumbers "custom\player_monitor.sqf"; //used to allow teleport around science base
bloodsucker_zone = compile preprocessFileLineNumbers "custom\bloodsucker_zone.sqf";
//bloodsucker_count = compile preprocessFileLineNumbers "custom\bloodsucker_count.sqf";
player_switchModel =		compile preprocessFileLineNumbers "custom\player_switchModel.sqf"; //used to keep dog owner
player_wearClothes =		compile preprocessFileLineNumbers "custom\player_wearClothes.sqf";
player_humanityMorph =		compile preprocessFileLineNumbers "custom\player_humanityMorph.sqf";
player_removeDog =		compile preprocessFileLineNumbers "custom\player_removeDog.sqf";

player_setTrap =		compile preprocessFileLineNumbers "custom\player_setTrap.sqf"; //compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_setTrap.sqf"; //compile preprocessFileLineNumbers "custom\player_build_trap2.sqf"; 
//GHK Trap functions
object_pickup = compile preprocessFileLineNumbers "custom\object_pickup.sqf";

BIS_Effects_Burn=compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
burn_zones = compile preprocessFileLineNumbers "custom\burn_zones.sqf";
fnc_destroyBuildings = compile preprocessFileLineNumbers "custom\fn_destroyBuilding.sqf";


local_eventKillMutant = compile preprocessFileLineNumbers "custom\local_eventKillMutant.sqf";
infectedcamps = compile preprocessFileLineNumbers "dayz_code\compile\object_infectedcamps.sqf";
camp_spawnZombies = compile preprocessFileLineNumbers "dayz_code\compile\camp_spawnZombies.sqf";
spawn_loot_return = compile preprocessFileLineNumbers "custom\spawn_loot_return.sqf";
spawn_loot = compile preprocessFileLineNumbers "custom\spawn_loot.sqf"; //ghk for debugging medbox0 and foodbox0 having no items
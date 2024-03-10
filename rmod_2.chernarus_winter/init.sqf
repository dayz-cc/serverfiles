// Mission Initialization
startLoadingScreen ["", "RscDisplayLoadCustom"];
cutText ["", "BLACK OUT"];
enableSaving [false, false];

// Variable Initialization
dayZ_instance = 2;
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//THIS IS USED IN DZMS AND WAI to only spawn 1 unit per spawn position for low player count, set to 0 for multiplayer
dz_singleplayer_missions=1;
//Used in DZMS, DZMSHOTSPOTS AND WAI to not spawn vehicles or backup, and to force all AI spawned to be at lowest skill level, great for single player
dz_easy_missions=true;
//Used in DZAI to spawn all AI at lowest skill level, regardless of weapongrade
dz_easy_bandits=true;

//USED TO DISABLE ALL BANDIT AI, DZAI, DZMS, DZMHOTSPOTS AND WAI, *NOTE*, THIS DISABLES THE END GAME.
dz_disable_bandit_ai = false;

dz_survivor_friendly_traps=0; //set to 1 so traps will not go off for human players with humanity greater than 0. Set this to 0 to not go off only for bomb creator. will go off for player dogs regardless.

dayz_world_saved_timeout = 1800; //time that the world is saved by survivors when they complete the finale, before resuming spawning zombies & bloodsuckers again. Default 1800 = 1/2 hour

// only in fog areas these are used. 'dz_horde_chance' should be low (20 or less), dayz_spawnZombies not sure if it is caluclating properly, so high values may overspawn and cause performance problems.
dzn_ns_bloodsucker = true;        // Make this false for disabling bloodsucker spawn
dzn_ns_bloodsucker_den = 1; //5;    // Spawn chance of bloodsuckers, max 400, ignore if dzn_ns_bloodsucker set to false
dz_horde = true; 				//Spawn chance for a horde to spawn(if dayz zombie limit allows) //only in fog areas in the wild (200m away from any building)
dz_horde_chance = 3; 		//Spawn chance for a horde to spawn in the wild in fog areas, checked every 8 seconds, max 400, (if dayz zombie limit allows)
//dependent on WAI timer 

//What custom message you want players to see on their player monitor, needs to be an empty string "" if nothing	
//Note that changing this will cause all clients to re-download the mission file next time they join, like any changes to init.sqf
dayz_motd ="";

dz_max_bloodsuckers = 1; //maximum amount of bloodsuckers allowed within 510m of a player (new bloodsuckers spawning in will check this value), increase to allow more bloodsuckers to spawn, set to 0 to disable bloodsuckers

ns_blowout = true; // true / false
ns_blowout_dayz = true;// true / false
ns_blow_delaymod = 1.8; //(1.5 hours) //2.5; //(at least 2.08+ hours) //0.74; //blowout delay //0.74
ns_blow_itemapsi = "APSI"; //"NVGoggles"; //ItemAPSI replacement
ns_blow_playerdamage = 4000; // damage players without ns_blow_itemapsi can get per blowout
ns_blow_emp = false; //Namalsk Only
//dz_ai_blowout_bloodloss_fraction used for bandit AI to determine on the server, what fraction of blood AI is retained after a blowout, if they do not possess APSI
//i.e. 1 = no bloodloss, 0=instant death, 0.7 will mean that if a unit has 12000 health, they will have 0.7*12000 = 8400 left.
dz_ai_blowout_bloodloss_fraction = 0.7;
dz_extraroam_min=1; //hardcoded this to 1 in building_spawnZombies.sqf
dz_extraroam_max=1;  //hardcoded this to 1 in building_spawnZombies.sqf
dayz_spawnInfectedSite_clutterCutter = 2; // Infected Camp Settings / 0 =  loot hidden in grass // 1 = loot lifted // 2 = cluttercutter // 3 = debug
dayz_MapArea = 14000; // Default = 10000 //Infected Camps
DZE_MissionLootTable = true;
dz_max_globalbloodsuckers = 50; //see variables.sqf
dz_bloodsucker_count = 0; //see variables.sqf
dayz_won_the_game=false; //used for End Game if Monolith mission is completed
dayz_restart_period= 480; //8 hours
dz_scoreboard_type=1; //set to 1 for top stats of top 5 current players (based on total score), 0 shows scores of all players. Press 'Insert' key to show scoreboard.
dz_scoreboard_on=false;
dz_custom_monitor_on=true;
dz_scoreboard="";dz_scoreboard_time=0;
dz_use_crafting=true; //set whether crafting menu shows up or not.
dz_play_intro_radio=false; //set to true to play the radio soundclips during the intro when the player spawns
dz_play_radio_static=true; //play radio chatter/static when messages are sent to player
dayz_cannot_have_dog = false; //allow dogs?
dayz_one_dog_per_restart = true; //only allow players one dog per character per server session. if one dies, have to wait until a new character id or server restart

//dz_generate_destruction: generate random building damage to certain non-lootable buildings for more apocalyptic  feel
//Note: in very rare instances, its possible that a player may spawn in right near where the building is collapsing. But experienced players would know not to save at these locations.
dz_generate_destruction=true; 

dayz_use_custom_bandit_skill = false;
//0=normal, 1=harder (DZAI), 2= hard, 3 = extreme (WAI) Difference between 0 and 1 is not much,  2 is a bit more, 3 is much much harder
dayz_custom_bandit_skill=0; 
dayz_DZAI_maxRandomSpawns=10; //number of DZAI random spawns that move around Chernarus. Default is 10. 
dayz_DZAI_maxHeliPatrols=1; //number of DZAI heli patrols. Default is 1.
dayz_DZAI_maxLandPatrols = 3;  //number of DZAI vehicle patrols. Default is 3.

//let players know that there are bandits nearby every 30seconds (within 500m)
dayz_bandit_warn=false;
//let players know that a bloodsucker spawned nearby (within 500m)
dayz_bloodsucker_warn=true;

crafting_menu_open = false; manatee_craft_menu = []; manatee_craft_menu_ind = []; manatee_craft_menu_sur = []; manatee_craft_menu_wea = [];

//

// Settings
player setVariable ["BIS_noCoreConversations", true]; 	// Disable greeting menu
//enableRadio false; 									// Disable global chat radio messages

// Compile and call important functions
call compile preprocessFileLineNumbers "nuke\init.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";
call compile preprocessFileLineNumbers "custom\variables.sqf"; //use missionConfig
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";
call compile preprocessFileLineNumbers "custom\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf"; //GHK Copy main compiles.sqf from dayz_code.pbo to change dynamic weather for winter
call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";
call compile preprocessFileLineNumbers "custom\compiles.sqf"; //Compile custom compiles
progressLoadingScreen 1.0;


// Set Tonemapping
"Filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4];
setToneMapping "Filmic";


myDog=objNull;
// Run the server monitor
if (isServer) then {
	dayz_disco = []; //GHK bug fix
	dogOwner = [];dogOwnerCID = [];
	_serverMonitor = [] execVM "\z\addons\dayz_server\system\server_monitor.sqf";
};

if (!isServer && isNull player) then {
	waitUntil { !isNull player };
	waitUntil { time > 3 };
};

if (!isServer && player != player) then {
	waitUntil { player == player };
	waitUntil { time > 3 };
};

// Run the player monitor
if (!isDedicated) then {
	0 fadeSound 0;
	waitUntil { !isNil "dayz_loadScreenMsg" };
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");

	//_id = player addEventHandler ["Respawn", { _id = [] spawn player_death; }];
	//_playerMonitor = [] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death; _nul = [] execVM "addin\plrInit.sqf";}];
	//dayZ original _id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	//_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf"; 
	_playerMonitor = 	[] execVM "custom\player_monitor.sqf"; //fix for secret science base
	
	 "heliCrash" addPublicVariableEventHandler {
        _list = nearestObjects [_this select 1, ["CraterLong"], 100];
        {deleteVehicle _x;} foreach _list;
    };
	_nul = [] execVM "addin\plrInit.sqf";
	
	
	#include "gcam\gcam_config.hpp"
	#include "gcam\gcam_functions.sqf"

	#ifdef GCAM
		waitUntil { alive Player };
		waituntil { !(IsNull (findDisplay 46)) };

		if (serverCommandAvailable "#kick") then { (findDisplay 46) displayAddEventHandler ["keyDown", "_this call fnc_keyDown"]; };
	#endif
	
	//DZAI
	_nul = [] execVM "DZAI_Client\dzai_initclient.sqf";
	
	
};
//call compile preprocessFileLineNumbers "addons\UPSMON\scripts\Init_UPSMON.sqf";
 
//call compile preprocessFileLineNumbers "addons\SHK_pos\shk_pos_init.sqf";
 
//[] execVM "addons\SARGE\SAR_AI_init.sqf";

//dayzFireZone = [10347.274, 2217.9885,0];

if (isServer) then {
dayz_burn_areas = [];

	if(dz_generate_destruction) then {
		[] execVM "custom\generatedestruction.sqf";
	};

};

//NC Blowouts seems to crash server
if (isServer) then { _bul = [ns_blow_emp] execVM "addons\blowout\module\blowout_server.sqf"; };
if (!isDedicated) then { _bul = [] execVM "addons\blowout\module\blowout_client.sqf"; };

//custom monitor & auto refuel script
if (!isDedicated) then
 {
 [] execVM "Scripts\kh_actions.sqf";
[] execVM "Scripts\custom_monitor.sqf";

[] execVM "custom\check_for_camps.sqf";

[] execVM "custom\fog.sqf";

[player,1] execVM "dayz_code\init\SimpleBreathFog.sqf"; //GHK breath fog 2

//TowerLights
[] execVM "lights\tower_lights.sqf";

};  
nul=[] execVM "custom\KRON_Strings.sqf"; 


player setVariable["ghkcanteleport",true];
p2_newspawn = compile preprocessFileLineNumbers "newspawn\newspawn_execute.sqf";
//waitUntil {!isNil ("dayz_Totalzedscheck")};
//if (dayzPlayerLogin2 select 2) then {player spawn p2_newspawn;};

//GHK Booby Trap


if (isServer) then {
dz_characterid_has_dead_dog = []; //used to store character ids during the server session that have dogs that have died (except from model switches due to clothes or humanity morph). Used to force only one dog per server restart

"DZ_getif_has_dead_dog" addPublicVariableEventHandler { // usage: DZ_getif_has_dead_dog =[dayz_characterID,player,time];
	_pcid = owner ((_this select 1) select 1);
	//diag_log("GHK DZ_getif_has_dead_dog: " + str(DZ_getif_has_dead_dog));

	if(((_this select 1) select 0) in dz_characterid_has_dead_dog) then {
		DZ_get_has_dead_dog = true;
	}else {
		DZ_get_has_dead_dog = false;
	};
	//diag_log("GHK DZ_get_has_dead_dog: " + str(DZ_get_has_dead_dog));
	
	_pcid publicVariableClient "DZ_get_has_dead_dog";

};

"DZ_set_has_dead_dog" addPublicVariableEventHandler { // usage: DZ_set_has_dead_dog =[dayz_characterID,time];
_charID = (_this select 1) select 0;
dz_characterid_has_dead_dog  set [count dz_characterid_has_dead_dog, _charID];
//diag_log("GHK dz_characterid_has_dead_dog : " + str(dz_characterid_has_dead_dog));

};


	"DZ_get_nuke_areas" addPublicVariableEventHandler {[_this select 1] execVM 'custom\getnukageserver.sqf'};
      "DZ_boobyTrap" addPublicVariableEventHandler {[_this select 1] execVM 'custom\createBomb.sqf'};
	  "DZ_boobyTrap2" addPublicVariableEventHandler {[_this select 1] execVM 'custom\destroyBomb.sqf'};
	  "DZ_boobyAlarm" addPublicVariableEventHandler {[_this select 1] execVM 'custom\createAlarm.sqf'};

};

if (!isServer) then { 

	"DZ_get_has_dead_dog" addPublicVariableEventHandler {
		dayz_cannot_have_dog = (_this select 1);
		diag_log("GHK dayz_cannot_have_dog: " + str(dayz_cannot_have_dog));

	};

	
	"dz_get_nuke_destruction" addPublicVariableEventHandler {[_this select 1] execVM 'custom\getnukageclient.sqf'};

    "dz_trap_message" addPublicVariableEventHandler {
		
		cutText [format[(_this select 1)], "PLAIN DOWN"]; };
		
	"dz_alarm_message" addPublicVariableEventHandler {
		//bait is created now server side, and should be seen by client
		cutText [format[(_this select 1)], "PLAIN DOWN"]; 
		
		private["_i","_bait","_setBait","_targets","_group"];
		//lets see if the server created object can be seen...
	_i = 0;
		_bait = nearestObject [player, "SkeetMachine"];
		diag_log("bait found:");diag_log(_bait);
		_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
		diag_log("setbait found:");diag_log(_setBait);
		{
			_group = group _x;
			if (isNull group _x) then {
				_group = _x;
			};
			_x reveal [_bait,4];
			_targets = _group getVariable ["targets",[]];
			if (!(_bait in _targets)) then {
				_targets set [count _targets,_bait];
				_group setVariable ["targets",_targets,true];
			};
			_i = _i + 1;
		} forEach _setBait;
		
		sleep 15;
		
			_i = 0;
		_bait = nearestObject [player, "SkeetMachine"];
		diag_log("bait found:");diag_log(_bait);
		_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
		diag_log("setbait found:");diag_log(_setBait);
		{
			_group = group _x;
			if (isNull group _x) then {
				_group = _x;
			};
			_x reveal [_bait,4];
			_targets = _group getVariable ["targets",[]];
			if (!(_bait in _targets)) then {
				_targets set [count _targets,_bait];
				_group setVariable ["targets",_targets,true];
			};
			_i = _i + 1;
		} forEach _setBait;
		
		sleep 15;
		
			_i = 0;
		_bait = nearestObject [player, "SkeetMachine"];
		diag_log("bait found:");diag_log(_bait);
		_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
		diag_log("setbait found:");diag_log(_setBait);
		{
			_group = group _x;
			if (isNull group _x) then {
				_group = _x;
			};
			_x reveal [_bait,4];
			_targets = _group getVariable ["targets",[]];
			if (!(_bait in _targets)) then {
				_targets set [count _targets,_bait];
				_group setVariable ["targets",_targets,true];
			};
			_i = _i + 1;
		} forEach _setBait;
		
		sleep 15;


			_i = 0;
		_bait = nearestObject [player, "SkeetMachine"];
		diag_log("bait found:");diag_log(_bait);
		_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
		diag_log("setbait found:");diag_log(_setBait);
		{
			_group = group _x;
			if (isNull group _x) then {
				_group = _x;
			};
			_x reveal [_bait,4];
			_targets = _group getVariable ["targets",[]];
			if (!(_bait in _targets)) then {
				_targets set [count _targets,_bait];
				_group setVariable ["targets",_targets,true];
			};
			_i = _i + 1;
		} forEach _setBait;
		
		sleep 15;

			_i = 0;
		_bait = nearestObject [player, "SkeetMachine"];
		diag_log("bait found:");diag_log(_bait);
		_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
		diag_log("setbait found:");diag_log(_setBait);
		{
			_group = group _x;
			if (isNull group _x) then {
				_group = _x;
			};
			_x reveal [_bait,4];
			_targets = _group getVariable ["targets",[]];
			if (!(_bait in _targets)) then {
				_targets set [count _targets,_bait];
				_group setVariable ["targets",_targets,true];
			};
			_i = _i + 1;
		} forEach _setBait;
		
		sleep 15;


			_i = 0;
		_bait = nearestObject [player, "SkeetMachine"];
		diag_log("bait found:");diag_log(_bait);
		_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
		diag_log("setbait found:");diag_log(_setBait);
		{
			_group = group _x;
			if (isNull group _x) then {
				_group = _x;
			};
			_x reveal [_bait,4];
			_targets = _group getVariable ["targets",[]];
			if (!(_bait in _targets)) then {
				_targets set [count _targets,_bait];
				_group setVariable ["targets",_targets,true];
			};
			_i = _i + 1;
		} forEach _setBait;
		
		sleep 15;

			_i = 0;
		_bait = nearestObject [player, "SkeetMachine"];
		diag_log("bait found:");diag_log(_bait);
		_setBait = (getPosATL _bait) nearEntities ["zZombie_Base",100];
		diag_log("setbait found:");diag_log(_setBait);
		{
			_group = group _x;
			if (isNull group _x) then {
				_group = _x;
			};
			_x reveal [_bait,4];
			_targets = _group getVariable ["targets",[]];
			if (!(_bait in _targets)) then {
				_targets set [count _targets,_bait];
				_group setVariable ["targets",_targets,true];
			};
			_i = _i + 1;
		} forEach _setBait;
		
		
	};

	"dz_alarm_message2" addPublicVariableEventHandler {
		//tell player that the alarm object has gone (deleted on server)
		cutText [format[(_this select 1)], "PLAIN DOWN"]; };	
    
};
//Finished Booby Traps

dz_nuke_alarm=true; //Gives all players, including ones without radios, a siren noise every 30 seconds during the 3 minutes between a nuke launch and explosion if they are within 1000m of ground zero
//Hide the 'nukepos' vehicles on server and clients. and move to terrain level
nukepos1 setPosATL [getPosATL nukepos1 select 0, (getPosATL nukepos1 select 1) - 10, getPosATL nukepos1 select 2];
nukepos2 setPosATL [getPosATL nukepos2 select 0, (getPosATL nukepos2 select 1) - 10, getPosATL nukepos2 select 2];
nukepos3 setPosATL [getPosATL nukepos3 select 0, (getPosATL nukepos3 select 1) - 10, getPosATL nukepos3 select 2];
nukepos4 setPosATL [getPosATL nukepos4 select 0, (getPosATL nukepos4 select 1) - 10, getPosATL nukepos4 select 2];
nukepos5 setPosATL [getPosATL nukepos5 select 0, (getPosATL nukepos5 select 1) - 10, getPosATL nukepos5 select 2];
nukepos6 setPosATL [getPosATL nukepos6 select 0, (getPosATL nukepos6 select 1) - 10, getPosATL nukepos6 select 2];
nukepos7 setPosATL [getPosATL nukepos7 select 0, (getPosATL nukepos7 select 1) - 10, getPosATL nukepos7 select 2];
nukepos8 setPosATL [getPosATL nukepos8 select 0, (getPosATL nukepos8 select 1) - 10, getPosATL nukepos8 select 2];
nukepos9 setPosATL [getPosATL nukepos9 select 0, (getPosATL nukepos9 select 1) - 10, getPosATL nukepos9 select 2];
hideObject nukepos1; hideObject nukepos2;hideObject nukepos3;hideObject nukepos4;
hideObject nukepos5; hideObject nukepos6;hideObject nukepos7;hideObject nukepos8;hideObject nukepos9;

//client asks server for any areas of nukage destruction
DZ_get_nuke_areas = [player,time];
publicVariableServer "DZ_get_nuke_areas";

//HALO SPAWN SCRIPT

 player setVariable["ghkcanteleport",true];
bis_fnc_halo = compile preprocessFileLineNumbers "fixes\fn_HALO.sqf";
ns_col_cold_CW= compile preprocessFileLineNumbers "dayz_code\init\cold.sqf";
if (!isDedicated) then {

    [] spawn {
        waitUntil { !isNil ("dayz_Totalzedscheck") and  !(player getVariable ["humanity",0] > 5000 and typeOf player == "Survivor2_DZ") and !(player getVariable ["humanity",0] < -2000 and (typeOf player == "Survivor2_DZ" or typeOf player == "SurvivorW2_DZ") ) and !(player getVariable ["humanity",0] > 0 and (typeOf player == "Bandit1_DZ" or typeOf player == "BanditW1_DZ") ) };
 
        if (dayzPlayerLogin2 select 2) then
        {
           // _pos = position player;
           // "respawn_west" setMarkerPos [_pos select 0, _pos select 1];
            [player, 2500] spawn bis_fnc_halo;
        };
		
		//GHK Get the dog data for the server session for the character id
		if(dayz_one_dog_per_restart) then {
		  waitUntil { !isNil ("dayz_characterID") };
		  DZ_getif_has_dead_dog =[dayz_characterID,player,time];
		  publicVariableServer "DZ_getif_has_dead_dog"; 
		};  
		
    };
};

private["_refObj","_size","_vel","_speed","_hunger","_thirst","_array","_unsaved","_timeOut","_result","_lastSave","_ghkhint","_ghkhintbs","_ghkdogcheck","_survival_time"];
disableSerialization;
_timeOut = 	0;
_messTimer = 0;
_lastSave = 0;
_lastTemp = dayz_temperatur;
_debug = getMarkerpos "respawn_west";
_isBandit = false;
_isHero = false;
_ghkdogcheck = false;

_mylastPos = getPosATL player; //GHK ADDED to remove script errors. gets initialized then checked against _tempPos, before it is set

//GHK ####REMOVE THIS DEBUG CODE#######

 //if(!("TrapBear" in Magazines player)) then {
	//player AddMagazine "TrapBear"; //used for summoning dog if still alive
	//player AddMagazine "PartWoodPile";
	//player AddMagazine "FoodSteakRaw";
	//player AddWeapon "ItemEtool";
	//player AddWeapon "ItemMap_Debug";
	//player AddMagazine "ItemBloodbag";
	//player AddWeapon "ItemMatchbox";
	//player AddWeapon "ItemEtool";
	//player AddWeapon "ItemToolbox";
	//player AddMagazine "ItemSandbag";
	//player AddMagazine "ItemGenerator";
	//player AddMagazine "Skin_Sniper1W_DZN";
	//player AddMagazine "ItemSandbag";
	//player addWeapon "CDF_Dogtags";
 // };
 // player AddMagazine "ItemBloodbag";
//player AddMagazine "ItemAntibiotic";
//player AddMagazine "ItemSodaMdew";
//player AddMagazine "FoodCanBakedBeans";
//player AddMagazine "Skin_CamoWinterW_DZN";
//player AddMagazine "HandGrenade_West";
//player addWeapon "ItemHatchet";
//player addWeapon "ItemMatchbox";


 //*************#################

player setVariable ["temperature",dayz_temperatur,true];

//GHK set survival_time (in minutes)
player setVariable ["survival_time",dayz_survival_time,true];

dayz_myLoad = (((count dayz_myBackpackMags) * 0.2) + (count dayz_myBackpackWpns)) +  (((count dayz_myMagazines) * 0.1) + (count dayz_myWeapons * 0.5));

	//player addMagazine "Hatchet_swing";
	//player addWeapon "MeleeHatchet";

	private["_FutureWarnTime","_currTime","_FutureSTimeUpdate"]; //GHK
	//ghk add dzai bandit check
   //check every 10 secs
    _FutureWarnTime = floor(time) + 10;
	_FutureSTimeUpdate = floor(time);
	
while {true} do {
	//Initialize
	_refObj = 	vehicle player;
	_size = 	(sizeOf typeOf _refObj) * 0.6;
	_vel = 		velocity player;
	_speed = 	round((_vel distance [0,0,0]) * 3.5);
	_saveTime = (playersNumber west * 2) + 10;
	
		
	//reset position
	_randomSpot = true;
	_tempPos = getPosATL player;
	_distance = _debug distance _tempPos;
	if (_distance < 2000) then {
		_randomSpot = false;
	};	
	_distance = [0,0,0] distance _tempPos;
	if (_distance < 500) then {
		_randomSpot = false;
	};
	_distance = _mylastPos distance _tempPos;
	if (_distance > 400) then {
		_randomSpot = false;
	};
	
	if (_randomSpot) then {
		_mylastPos = _tempPos;
	};
	
	dayz_mylastPos = _mylastPos;
	dayz_areaAffect = _size;
	
	//CheckVehicle
	/*
	if (_refObj != player) then {
		_isSync =_refObj getVariable ["ObjectID",0] > 0;
		if (!_isSync) then {
			_veh allowDamage true;
			_veh setDamage 1;
			player setDamage 1;			
		};
	};
	*/
	
	if (_speed > 0.1) then {
		_timeOut = _timeOut + 1;
	};
	
	_humanity = player getVariable ["humanity",0];
	if (_timeOut > 150) then {
		_timeOut = 0;
		if (_humanity < 2500) then {
			_humanity = _humanity + 150;
			_humanity = _humanity min 2500;
			player setVariable ["humanity",_humanity,true];
		};
	};
	
	if (_humanity < -2000 and !_isBandit) then {
		_isBandit = true;
		_model = typeOf player;
		_ghkdogcheck = call player_removeDog;
		if (_model == "Survivor2_DZ"&&_ghkdogcheck) then {
			[dayz_playerUID,dayz_characterID,"Bandit1_DZ"] spawn player_humanityMorph;
		};
		if (_model == "SurvivorW2_DZ"&&_ghkdogcheck) then {
			[dayz_playerUID,dayz_characterID,"BanditW1_DZ"] spawn player_humanityMorph;
		};
		
		cutText ["You have lost your humanity.", "PLAIN DOWN"];

		systemChat "You have lost your humanity.";
		
	};
	
	if (_humanity > 0 and _isBandit) then {
		_isBandit = false;
		_model = typeOf player;
		_ghkdogcheck = call player_removeDog;
		if (_model == "Bandit1_DZ"&&_ghkdogcheck) then {
			[dayz_playerUID,dayz_characterID,"Survivor2_DZ"] spawn player_humanityMorph;
		};
		if (_model == "BanditW1_DZ"&&_ghkdogcheck) then {
			[dayz_playerUID,dayz_characterID,"SurvivorW2_DZ"] spawn player_humanityMorph;
		};
		
		cutText ["You have regained your humanity.", "PLAIN DOWN"];

		systemChat "You have regained your humanity.";
	};
	
	if (_humanity > 5000 and !_isHero) then {
		_isBandit = false;
		_isHero = true; //GHK
		_model = typeOf player;
		_ghkdogcheck = call player_removeDog;
		if (_model == "Survivor2_DZ"&&_ghkdogcheck) then {
			[dayz_playerUID,dayz_characterID,"Survivor3_DZ"] spawn player_humanityMorph;
		};
		cutText ["You are a hero.", "PLAIN DOWN"];

		systemChat "You are a hero.";
	};
	
//GHK, give hero skin for greater than 99 score from combat
	private["_ghkzombieKills","_ghkheadShots","_ghkhumanKills","_ghkbanditKills","_total_score"];
	_ghkzombieKills 	= player getVariable ["zombieKills",0];
	_ghkheadShots 		= player getVariable ["headShots",0];
	_ghkhumanKills 	= player getVariable ["humanKills",0];
	_ghkbanditKills 	= player getVariable ["banditKills",0];

	_total_score = (_ghkzombieKills + 5*_ghkbanditKills + floor(_ghkheadShots/2));
	if(!_isBandit&&!_isHero&&_total_score>99) then {
		_isHero = true;
		_model = typeOf player;
		_ghkdogcheck = call player_removeDog;
		if (_model == "Survivor2_DZ"&&_ghkdogcheck) then {
			[dayz_playerUID,dayz_characterID,"Survivor3_DZ"] spawn player_humanityMorph;
		};
		cutText ["You are a hero.", "PLAIN DOWN"];

		systemChat "You are a hero.";
	};
//
	
	//Has infection?
	//if (r_player_infected) then {
	//	[player,"cough",8,false] call dayz_zombieSpeak;
	//};

	//Record Check
	_lastUpdate = 	time - dayZ_lastPlayerUpdate;
	if (_lastUpdate > 8) then {
		//POSITION?
		_distance = dayz_myPosition distance player;
		if (_distance > 10) then {
			//Player has moved
			dayz_myPosition = getPosATL player;
			player setVariable["posForceUpdate",true,true];
			dayz_unsaved = true;
			dayZ_lastPlayerUpdate = time;
		};
	};

	//Hunger
	_hunger = +((((r_player_bloodTotal - r_player_blood) / r_player_bloodTotal) * 5) + _speed + dayz_myLoad) * 3;
	if (time - dayz_panicCooldown < 120) then {
		_hunger = _hunger * 2;
	};
	dayz_hunger = dayz_hunger + (_hunger / 60);

	//Thirst
	_thirst = 2;
	if (_refObj == player) then {
		_thirst = (_speed + 4) * 3;
	};
	dayz_thirst = dayz_thirst + (_thirst / 60) * (dayz_temperatur / dayz_temperaturnormal);	//TeeChange Temperatur effects added Max Effects: -25% and + 16.6% waterloss

	//Temperatur
	2 call player_temp_calculation; //2 = sleep time of this loop		//TeeChange
	if ((_lastTemp - dayz_temperatur) > 0.75 or (_lastTemp - dayz_temperatur) < -0.75 ) then {
		player setVariable ["temperature",dayz_temperatur,true];
		_lastTemp = dayz_temperatur;
	};
	
	//can get nearby infection
	if (!r_player_infected) then {
		//	Infectionriskstart
		if (dayz_temperatur < ((80 / 100) * (dayz_temperaturnormal - dayz_temperaturmin) + dayz_temperaturmin)) then {	//TeeChange
			_listTalk = _mylastPos nearEntities ["CAManBase",8];
			{
				if (_x getVariable["USEC_infected",false]) then {
					_rnd = (random 1) * (((dayz_temperaturnormal - dayz_temperatur) * (100 /(dayz_temperaturnormal - dayz_temperaturmin)))/ 50);	//TeeChange
					if (_rnd < 0.1) then {
						_rnd = random 1;
						if (_rnd > 0.7) then {
							r_player_infected = true;
							//player setVariable["USEC_infected",true];
						};
					};
				};
			} forEach _listTalk;
			if (dayz_temperatur < ((50 / 100) * (dayz_temperaturnormal - dayz_temperaturmin) + dayz_temperaturmin)) then {	//TeeChange
				_rnd = (random 1) * (((dayz_temperaturnormal - dayz_temperatur) * (100 /(dayz_temperaturnormal - dayz_temperaturmin)))/ 25);	//TeeChange
				if (_rnd < 0.05) then {
					_rnd = random 1;
					if (_rnd > 0.95) then {
						r_player_infected = true;
						//player setVariable["USEC_infected",true];
					};
				};
			};
		};
	};
	
	//If has infection reduce blood cough and add shake
	if (r_player_infected) then {
		if !(player getVariable["USEC_infected",false]) then { 
			player setVariable["USEC_infected",true,true];  
		};
		
		_rnd = ceil (random 8);
		[player,"cough",_rnd,false,9] call dayz_zombieSpeak;
		
		if (_rnd < 3) then {
			addCamShake [2, 1, 25];
		};
		if (r_player_blood > 3000) then {
			r_player_blood = r_player_blood - 3;
			player setVariable["USEC_BloodQty",r_player_blood];
		};
	};
	
	//Pain Shake Effects
	if (r_player_inpain and !r_player_unconscious) then {
		playSound "breath_1";
		addCamShake [2, 1, 25];
	};
	
	//Hunger Effect
	_foodVal = 		dayz_statusArray select 0;
	_thirstVal = 	dayz_statusArray select 1;
	if (_thirstVal <= 0) then {
		_result = r_player_blood - 10;
		if (_result < 0) then {
			_id = [player,"dehyd"] spawn player_death;
		} else {
			r_player_blood = _result;
		};
	};
	if (_foodVal <= 0) then {
		_result = r_player_blood - 10;
		if (_result < 0) then {
			_id = [player,"starve"] spawn player_death;
		} else {
			r_player_blood = _result;
		};
	};
	
	//Record low bloow
	_lowBlood = player getVariable ["USEC_lowBlood", false];
	if ((r_player_blood < r_player_bloodTotal) and !_lowBlood) then {
		player setVariable["USEC_lowBlood",true,true];
	};
	
	//Broadcast Hunger/Thirst
	_messTimer = _messTimer + 1;
	if (_messTimer > 15) then {
		_messTimer = 0;
		player setVariable ["messing",[dayz_hunger,dayz_thirst],true];
	};
	
	//check if can disconnect
	if (!dayz_canDisconnect) then {
		if ((time - dayz_damageCounter) > 180) then {
			if (!r_player_unconscious) then {
				dayz_canDisconnect = true;
				//["dayzDiscoRem",getPlayerUID player] call callRpcProcedure;
				dayzDiscoRem = getPlayerUID player;
				publicVariable "dayzDiscoRem";
				
				//Ensure Control is hidden
				_display = uiNamespace getVariable 'DAYZ_GUI_display';
				_control = 	_display displayCtrl 1204;
				_control ctrlShow false;
			};
		};
	};

	//Save Checker
	if (dayz_unsaved) then {
		if ((time - dayz_lastSave) > _saveTime) then {
			//["dayzPlayerSave",[player,dayz_Magazines,false]] call callRpcProcedure;
			
			dayzPlayerSave = [player,dayz_Magazines,false];
			publicVariableServer "dayzPlayerSave";
			
			if (isServer) then {
				dayzPlayerSave call server_playerSync;
			};
						
			dayz_lastSave = time;
			dayz_Magazines = [];
		};
		_lastSave = _lastSave + 2;
	} else {
		dayz_lastSave = time;
		_lastSave = 0;
	};

	if (!dayz_unsaved) then {
		dayz_lastSave = time;
	};

	//Attach Trigger Current Object
	//dayz_playerTrigger attachTo [_refObj,[0,0,0]];
	//dayz_playerTrigger setTriggerArea [_size,_size,0,false];

	// If in combat, display counter and restrict logout
	_startcombattimer      = player getVariable["startcombattimer",0];
	if (_startcombattimer == 1) then {
		player setVariable["combattimeout", time + 30, true];
		player setVariable["startcombattimer", 0, true];
		dayz_combat = 1;
	};

	_combattimeout = player getVariable["combattimeout",0];
	if (_combattimeout > 0) then {
		_timeleft = _combattimeout - time;
		if (_timeleft > 0) then {
			//hintSilent format["In Combat: %1",round(_timeleft)];
		} else {
			//hintSilent "Not in Combat";
			player setVariable["combattimeout", 0, true];
			dayz_combat = 0;
			_combatdisplay = uiNamespace getVariable 'DAYZ_GUI_display';
			_combatcontrol = 	_combatdisplay displayCtrl 1307;
			_combatcontrol ctrlShow true;
		};
	} else {
		//hintSilent "Not in Combat";
		dayz_combat = 0;
		_combatdisplay = uiNamespace getVariable 'DAYZ_GUI_display';
		_combatcontrol = 	_combatdisplay displayCtrl 1307;
		_combatcontrol ctrlShow true;
	};
	
	/*
	setGroupIconsVisible [false,false];
	clearGroupIcons group player;
	*/
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, (r_player_blood/r_player_bloodTotal)],  [1, 1, 1, 0.0]];
	"colorCorrections" ppEffectCommit 0;
	sleep 2;
	
	_myPos = player getVariable["lastPos",[]];
	if (count _myPos > 0) then {
		player setVariable["lastPos",_mylastPos, true];
		player setVariable["lastPos",[]];
	};
	
	_lastPos = getPosATL player;	
	if (player == vehicle player) then {
		if (_mylastPos distance _lastPos > 200) then {
			if ((alive player)&&!(player getVariable["ghkcanteleport",false])) then {
				//player setPosATL _mylastPos;
			};
		};
	} else {
		if (_mylastPos distance _lastPos > 800) then {
			if ((alive player)&&!(player getVariable["ghkcanteleport",false])) then {
				//player setPosATL _mylastPos;
			};
		};
	};
	
	//GHK added dzai bandit warning 
	_currTime = floor(time);
	
	//GHK every minute update the survival_time publicly
	if((_currTime - _FutureSTimeUpdate) >60) then {
		//GHK 1 minute has passed, increment the survival_time by 1 minute
		//increment dayz_survival_time too?
		_FutureSTimeUpdate = _currTime;
		_survival_time = player getVariable ["survival_time",0];
		player setVariable ["survival_time",(_survival_time + 1),true];
		
	};
	//GHK bloodsucker code is not the greatest for player damage set, so check difference in player blood from public value
	//and if different, check if a bloodsucker nearby player, if so, set public variable and force update. 
	if(r_player_blood < (player getVariable["USEC_BloodQty",12000])) then {
	
		_nearestbloodsuckers = (position player) nearEntities [["ns_bloodsucker"],25];
		_cnt = {alive _x} count _nearestbloodsuckers;
		if(_cnt > 0) then {
			player setVariable["USEC_BloodQty",r_player_blood,true];
			player setVariable["medForceUpdate",true];
		};
	};
	
	if((_currTime > _FutureWarnTime)&&dayz_bandit_warn) then {
	
		//_nearestunits = nearestObjects [player,["Man"],500];
		 _nearestunits = (position player) nearEntities [["Man","ns_bloodsucker"],500];
		 
		 _FutureWarnTime = floor(time) + 10;
		_ghkhint = ["You hear gunfire nearby","You hear shouting nearby","You hear something nearby","You hear shooting nearby","You hear screaming nearby"] call BIS_fnc_selectRandom;
		_ghkhintbs = ["You hear growls nearby","You hear a loud roar nearby","You hear screeching and howling nearby"] call BIS_fnc_selectRandom;
			{
			 if((side _x == EAST || side _x == RESISTANCE)) exitWith {_FutureWarnTime = floor(time) + 30;systemChat _ghkhint};	
			if(isPlayer _x && (_x != player ) && (_x getVariable ["humanity", 0] < 2000)) exitWith {_FutureWarnTime = floor(time) + 30;systemChat _ghkhint};
			
			 if((_x isKindOf "ns_bloodsucker")) exitWith {_FutureWarnTime = floor(time) + 30;systemChat _ghkhintbs};	
		   } foreach _nearestunits;
	
	/*
		_nearestunits = nearestObjects [player,["Man"],500];
		 _FutureWarnTime = floor(time) + 10;

		if( east countSide _nearestunits > 0 ||  resistance countSide _nearestunits > 0) then { //check for AI: could condense this into 1 call with countEnemy
			_FutureWarnTime = floor(time) + 30; //systemchat takes about 40 seconds to fade away
			systemChat "You hear bandits nearby";
		   } else { //check for player bandits
		   {
			  if(isPlayer _x && (_x getVariable ["humanity", 0] < 2000)) exitWith {_FutureWarnTime = floor(time) + 30;systemChat "You hear bandits nearby"};
		   } foreach _nearestunits;
		};
	*/
	
	};
	
	//Hatchet ammo fix	
	//"MeleeHatchet" call dayz_meleeMagazineCheck;
	
	//Crowbar ammo fix	
	//"MeleeCrowbar" call dayz_meleeMagazineCheck;
};
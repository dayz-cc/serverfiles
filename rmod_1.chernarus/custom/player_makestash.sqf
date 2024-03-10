private["_location","_isOk","_dir","_classname","_removedEtool"];

_campfireobj = _this select 3;
_isOk = true; //count (_location isFlatEmpty [0.3,0,0,4,0,false,player]) > 0;

/*
//Land_Fire_DZ is a descendent of HouseBase, remove them from the check
//50m should be enough, there are some big buildings now.
_buildingarray = ((nearestObjects [(vehicle player), ["HouseBase"], 50]) - (nearestObjects [(vehicle player), ["Land_Fire_DZ"],  50]));
if(count _buildingarray == 0) then {
	_isOk = true;
} else {
	_building = _buildingarray select 0;
	_isOk = [(vehicle player),_building] call fnc_isInsideBuilding;
};
*/
_removedEtool = false;

_hasEtool = 		"ItemEtool" in items player;

player removeAction s_player_firestash;
s_player_firestash = -1;

if (!_hasEtool) exitWith {cutText ["You need to have an Entrenching Tool to create a stash point" , "PLAIN DOWN"]};

if (_hasEtool) then {
	if (_isOk) then {
			_dir = getDir player;
			_classname = "Land_Fire_DZ";
			_dis=20;
			_sfx = "tentunpack";
			[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
			[player,_dis,true,(getPosATL player)] spawn player_alertZombies;			
			player playActionNow "Medic";
			sleep 6;
			
			//create stashpoint with targeted fireplace(local)
			//check that the _campfireobj is still there!
			if(!isNull _campfireobj) then {
				//25% chance of etool breaking
				if((floor(random 4)) == 0) then {
					player removeWeapon "ItemEtool";
					dayzPlayerSave = [player,dayz_Magazines,false];
					publicVariableServer "dayzPlayerSave";	
					_removedEtool = true;
					cutText ["Your Entrenching Tool has broken", "PLAIN"];
					systemChat "Your Entrenching Tool has broken";
				};			
				player reveal _campfireobj;
				//On chernarus, lower the campfire by -0.11 under the terrain level to create the more hidden stash point
				//leave z at 0.0 for now... at -0.11 this seems to be to low
				_campfireobj setPosATL [getPosATL _campfireobj select 0, getPosATL _campfireobj select 1,-0.06];
				_location = getPosATL _campfireobj;
				_dir = getDir _campfireobj;

				_campfireobj setVariable ["characterID",dayz_characterID,true];
				//Prevent server from deleting the object by assigning it a blank UID.
				_campfireobj setVariable ["ObjectUID","",true];
				clearMagazineCargoGlobal _campfireobj; //clear out any woodpile!
				dayzPublishObj = [dayz_characterID,_campfireobj,[_dir,_location],"Land_Fire_DZ"];
				publicVariable "dayzPublishObj";
				cutText ["You have created a secret stash point", "PLAIN DOWN"];
				
			}else {
				cutText ["Stash Point not created", "PLAIN DOWN"];
			};
			
	} else {
		cutText ["You cannot make a stash point here", "PLAIN DOWN"];
	};
} else {
	cutText ["You need to have an Entrenching Tool to create a stash point" , "PLAIN DOWN"]
};
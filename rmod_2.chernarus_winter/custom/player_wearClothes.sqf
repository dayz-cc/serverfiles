/*
_item spawn player_wearClothes;
TODO: female
*/
private["_item","_isFemale","_itemNew","_item","_onLadder","_model","_hasclothesitem","_config","_text","_isDogOwner"];
_item = _this;
call gear_ui_init;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};

_hasclothesitem = _this in magazines player;
_config = configFile >> "CfgMagazines";
_text = getText (_config >> _item >> "displayName");

if (!_hasclothesitem) exitWith {cutText [format[(localize "str_player_31"),_text,"wear"] , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["You may not change clothes while in a vehicle", "PLAIN DOWN"]};

_isFemale = ((typeOf player == "SurvivorW2_DZ")||(typeOf player == "BanditW1_DZ"));
if (_isFemale) exitWith {cutText ["Currently Female Characters cannot change to this skin. This will change in a future update.", "PLAIN DOWN"]};

private["_itemNew","_myModel","_humanity","_isBandit","_isHero"];
_myModel = (typeOf player);
_humanity = player getVariable ["humanity",0];
_isBandit = _humanity < -2000;
_isHero = _humanity > 5000;
_itemNew = "Skin_" + _myModel;

//GHK, give hero skin for greater than 99 score from combat
private["_zombieKills","_headShots","_humanKills","_banditKills","_total_score"];
_zombieKills 	= player getVariable ["zombieKills",0];
_headShots 		= player getVariable ["headShots",0];
_humanKills 	= player getVariable ["humanKills",0];
_banditKills 	= player getVariable ["banditKills",0];

_total_score = (_zombieKills + 5*_banditKills + floor(_headShots/2));
if(!_isBandit&&!_isHero) then {
	_isHero	= (_total_score > 99);
};
//

if ( !(isClass(_config >> _itemNew)) ) then {
	_itemNew = if (!_isFemale) then {"Skin_Survivor2_DZ"} else {"Skin_SurvivorW2_DZ"}; 
};

switch (_item) do {
	case "Skin_Sniper1_DZ": {
		_model = "Sniper1_DZ";
	};
	case "Skin_Camo1_DZ": {
		_model = "Camo1_DZ";
	};
	case "Skin_Soldier1_DZ": {
		_model = "Soldier1_DZ";
	};
	// GHK Namalsk Skins
	case "Skin_CamoWinter_DZN": {
		_model = "CamoWinter_DZN";
	};
	case "Skin_CamoWinterW_DZN": {
		_model = "CamoWinterW_DZN";
	};
	case "Skin_Sniper1W_DZN": {
		_model = "Sniper1W_DZN";
	};
	//
	case "Skin_Survivor2_DZ": {
		_model = "Survivor2_DZ";
		if (_isBandit) then {
			_model = "Bandit1_DZ";
		};
		if (_isHero) then {
			_model = "Survivor3_DZ";
		};
	};
};

//_model="civ_contractor2_baf";

_isDogOwner=player getVariable ["dogID", 0];
_wasDogOwner = player getVariable ["hadDog", 0];
private["_nearestunits","_dogPos","_wasDogOwner"];

//diag_log ("ghk looking for dog1..." + str(_isDogOwner) + ", " + str(_wasDogOwner));
if (_isDogOwner>0||_wasDogOwner>0) exitWith {
//diag_log ("ghk looking for dog2...");

cutText ["Please log out and log back in first before changing your clothing. After changing your clothing, use the scroll wheel to whistle for your dog back.", "PLAIN DOWN"];

systemChat "Please log out and log back in first before changing your clothing. After changing your clothing, use the scroll wheel to whistle for your dog back.";

player setVariable ["dogSwitch",1]; //ghk tell the game (tame_dog.sqf & tame_dog_switch.sqf) that the dog died due to play switching costume and dont remove dogtags.
/*
_nearestunits = nearestObjects [ player getVariable "dogPos",["Fin","Pastor"],40];

 
	{
	diag_log ("ghk dog char id: " + str(_x getVariable["CharacterID","0"]));
      _unit = _x;
	 // if (_unit getVariable["CharacterID","0"]==dayz_characterID) then {
		_unit setDamage 1;
		deleteVehicle _unit;
		
	 // };
	  
    //  if(side _unit == <your side>) then{_nearestfriendlies = _nearestfriendlies + [_unit]};
   } foreach _nearestunits;
   
 */  
 
 //GHK remove player dogs

	{
		if((_x isKindOf "Pastor")||(_x isKindOf "Fin")) then {
	
			if(_x getVariable ["CharacterID","0"] == player getVariable ["characterID", "0"]) then {
				_x setdamage 1;
				deleteVehicle _x;
			
			};
			
		};
			
	

	} forEach allUnits;


};


if (_model != _myModel) then {
	player removeMagazine _item;
	player addMagazine _itemNew;
	[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
};
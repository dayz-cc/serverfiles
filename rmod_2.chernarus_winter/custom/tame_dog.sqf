private ["_hasdog","_type","_pos","_dog","_animalID","_fsmid","_hasRMeat","_theMeat","_rawmeat","_result","_mypos","_dir"];


closedialog 0;
 
//check if player has a dog that died during the current server session
if(dayz_cannot_have_dog) exitWith {
	systemChat "This dog is not interested right now";
	cutText ["This dog is not interested right now", "PLAIN DOWN"];
};
 
// Check if player currently has a dog
_hasdog = player getVariable ["dogID", 0];


	_rawmeat = meatraw;
	_hasRMeat = false;
		{
			if (_x in magazines player) then {
				_hasRMeat = true;
				
				if (true) exitWith { _theMeat = _x };
			};
		} forEach _rawmeat; 

if (!_hasRMeat) exitWith {cutText [format["You have no raw meat"], "PLAIN DOWN"]};


if (_hasdog == 0) then {

	_result = [player,"CDF_dogtags"] call BIS_fnc_invAdd;
	if (!_result) exitWith {cutText [format["You need to clear a space in your weapon slots to store the dog's tags."], "PLAIN DOWN"]};
	
   player removeMagazine _theMeat;
   	_magazinesplayer	= call player_countmagazines; //magazines player;
   	dayzPlayerSave = [player,dayz_Magazines,false];
	publicVariableServer "dayzPlayerSave";
   
   		cutText [format["You gave the dog some raw meat. You have received a dog tag."], "PLAIN DOWN"];
		systemChat "You gave the dog some raw meat. You have received a dog tag.";
   
    _dog setVariable ["CharacterID", dayz_characterID, true];
	player setVariable ["dogID", 1]; //player setVariable ["dogID", 1]; //player setVariable ["dogID", _fsmid];
	//player setVariable ["mydog", _dog]; //player setVariable ["dogID", _fsmid];
	player setVariable ["hadDog", 1]; //ghk used for when player's dog died, but then went to change costume
	myDog = _dog; //local global variable.
   _type = round(random 1);
_breed = "Pastor";
switch (_type) do 
	{
	case 0:
	{
	_breed = "Pastor";
	};
	case 1:
	{
	_breed = "Fin";
	};
	};	
_grp = creategroup (side player);   
_dogname = "K9";
call compile format ['"%2" createUnit [getposATL player, _grp,"%1=this; this setSpeedMode ""full""; this disableAI ""autotarget""; this setbehaviour ""aware"";",1]',_dogname,_breed];
_dog = call compile format ["%1",_dogname];
_dog setIdentity "dogs";
_nul = [objNull, _dog, rSAY, "bark"] call RE; 

  _dog setVariable ["CharacterID", player getVariable ["characterID", "0"], true];
   
   //start tame dog script
   private ["_type","_breed","_grp","_dogname","_clientID","_humans","_distance","_foo","_commd","_animals","_targetAnimal","_stopWait","_veh","_currTime","_FutureTime","_FutureFeedTime","_didPreFeed"];
   
  player setVariable ["dogAction","follow",true]; 
  
  if(!("CDF_dogtags" in Weapons player)) then {
	player AddWeapon "CDF_dogtags"; //used for summoning dog if still alive
	//GHK Force the server to know:-If a lot of players have the cobalt_file, this may have a performance impact? they shouldnt!
	dayzPlayerSave = [player,dayz_Magazines,false];
	publicVariableServer "dayzPlayerSave";
  };
  //diag_log ("ghk: about to enter tame dog loop");
  

  _FutureTime = floor(time);
   //Need to feed dog every 1- 3 hours, get 1/2 hour notice to feed dog
   //Also make the dog hungrier every time it does work for the player, like kill a zombie or enemy, or catch an animal, then decrease the _FutureFeedTime by 300
    _FutureFeedTime = floor(time) + 3600 + floor(random 7200); //3600 = 1 hour
	_didPreFeed = false;
while {(alive _dog) && (alive player)} do
{
	if(!('CDF_dogtags' in Weapons player)) then {
		_dog  setDamage 1;
		cutText [format["Your dog has left you."], "PLAIN DOWN"];
		systemChat "Your dog has left you.";
		_nul = [objNull, _dog, rSAY, "growl"] call RE;
	};
	 _currTime 	= floor(time);
	 if(_currTime > _FutureTime) then { //every 5 seconds get the dog's position for deletion
	  player setVariable ["dogPos",(getPosATL _dog)]; 

	 // diag_log ("ghk: dog loop xpos: "+str(player getVariable "dogPos" select 0) + " ypos: " + str(player getVariable "dogPos" select 1) );
	 _FutureTime = floor(time) + 5;
	 
	 };
	 
	  if(_currTime > (_FutureFeedTime -1800 )&&!(_didPreFeed)) then {
		cutText [format["Your dog is hungry. Have some raw meat ready."], "PLAIN DOWN"];
		systemChat "Your dog is hungry. Have some raw meat ready.";
		_didPreFeed = true;
	  };
	 
	  if(_currTime > _FutureFeedTime) then {
	  
	  	_rawmeat = meatraw;
		_hasRMeat = false;
		{
			if (_x in magazines player) then {
				_hasRMeat = true;
				
				if (true) exitWith { _theMeat = _x };
			};
		} forEach _rawmeat; 

		if (!_hasRMeat) exitWith {
		_dog  setDamage 1;
		cutText [format["Your dog has left you."], "PLAIN DOWN"];
		systemChat "Your dog has left you.";
		_nul = [objNull, _dog, rSAY, "growl"] call RE;
		};
		
		 player removeMagazine _theMeat;
		cutText [format["Your dog ate some raw meat."], "PLAIN DOWN"];
		systemChat "Your dog ate some raw meat.";
		_FutureFeedTime = floor(time) + 3600 + floor(random 7200); //3600 = 1 hour
		_didPreFeed = false;
		_nul = [objNull, _dog, rSAY, "bark"] call RE; 
	  };
	 
	_humans = [];
	_distance = 1000;
	_humans = nearestObjects [player , ["CAManBase"], 40] - [player,_dog];
		if(count _humans == 0 ) then {
		_foo = objNull;
	}else {
		_foo = _humans select 0;
	};
	_commd = player getVariable "dogAction";
	
	//debug menu
	//_txt = parseText format["debugDog: %1 %2",player,_commd];
	//[nil, player, "loc", rHINT, _txt, "PLAIN DOWN"] call RE;
	
		if (_commd == "feed") then
		{
			_rawmeat = meatraw;
			_hasRMeat = false;
			{
				if (_x in magazines player) then {
					_hasRMeat = true;
					
					if (true) exitWith { _theMeat = _x };
				};
			} forEach _rawmeat; 

			if (!_hasRMeat) then {
				cutText [format["You have no raw meat to feed your dog."], "PLAIN DOWN"];
				systemChat "You have no meat to feed your dog.";
				_nul = [objNull, _dog, rSAY, "growl"] call RE; 
			} else {
				player removeMagazine _theMeat;
				cutText [format["Your dog ate some raw meat."], "PLAIN DOWN"];
				systemChat "Your dog ate some raw meat.";
				_FutureFeedTime = floor(time) + 3600 + floor(random 7200); //3600 = 1 hour
				_didPreFeed = false;
				_nul = [objNull, _dog, rSAY, "bark"] call RE; 
			
			};
			player setVariable ["dogAction","follow",true]; 
		};
	
	if (_commd == "stay") then
		{
		_dog switchmove "Dog_Sit1";
		_dog disableAI "move";
		if ((player distance _dog) > 1200) then
		{
			_dog  setDamage 1; //if player teleports away from dog
		};
		sleep 4;
		};
	if (_commd == "find") then
		{
		_dog enableAI "move";
		_dog switchmove "";	
		_animals = nearestObjects [_dog, ["Hen","Cock","Cow04","Cow03","Cow02","Cow01","Goat","Sheep","WildBoar"],400];
		if (count _animals != 0) then
			{
			_targetAnimal = _animals select 0;
			_stopWait = (time + 60);
			_dog domove (position _targetAnimal);
			_dog setspeedmode "FULL";
			waituntil {_dog domove (position _targetAnimal); sleep 2;  (_dog distance _targetAnimal < 20) || (time > _stopWait) || (player getVariable "dogAction" != "find")};
			_dog switchmove "Dog_Walk";
			_nul = [objNull, _dog, rSAY, "bark"] call RE;
			//Make dog hungrier for doing work for the player, 5x zombie kills
				_FutureFeedTime = _FutureFeedTime - 1500;
			 if((_FutureFeedTime - _currTime)  < 120) then { //give 2 minutes to feed dog
				_FutureFeedTime = _FutureFeedTime + 120;
			 };
			};
		_dog switchmove "Dog_Walk";
		sleep 4;
		};	
	if (_commd == "follow") then
	{
	_dog enableAI "move";
	_dog switchmove "";
	//foo
	if ((!(isNull _foo))&&(count _humans > 0) && (alive _foo)) then
		{
		_distance = player distance _foo;
		// warning
		If ((_distance > 10) && (_distance < 30)) then
			{
			_nul = [objNull, _dog, rSAY, "bark"] call RE; 
			_dog domove (position _foo);
			_dog setspeedmode "FULL";
			_nul = [objNull, _dog, rSAY, "bark"] call RE; 
			};
		//initiate attack	
		If ((_distance < 11) && (side _foo != side player)) then
			{
			_nul = [objNull, _dog, rSAY, "growl"] call RE; 
			_dog domove (position _foo);
			_dog setspeedmode "FULL";
			};
		//attack
		If ((_distance < 10) && (side _foo != side player)) then
			{
			_dog domove (position _foo);
			_dog setspeedmode "FULL";
			_stopWait = (time + 4);
			waitUntil {sleep 0.5; (_dog distance _foo) < 5 || time > _stopWait};
			_dog domove (position _foo);
			_dog setspeedmode "FULL";
			if ((alive _dog) && (_foo isKindOf "zZombie_Base")) then 
				{
				_dog attachTo [_foo,[0,0.8,0],"hrudnik"];
				_dog setDir 180;
				_foo setdamage 0.3;
				sleep 1;
				};
			if ((alive _dog) && (_foo isKindOf "zZombie_Base")) then 
				{
				_foo setdamage 0.3;
				sleep 1;
				};
			if ((alive _dog) && (_foo isKindOf "zZombie_Base")) then 
				{
				_dog setDir 160;
				_foo setdamage 0.6;
				sleep 1;
				};
			if ((alive _dog) && (_foo isKindOf "zZombie_Base")) then  
				{		
				_dog setDir 180;
				_foo setdamage 0.8;
				sleep 1;
				};
			if ((alive _dog) && (_foo isKindOf "zZombie_Base")) then 
				{
				_dog setDir 200;
				_foo setdamage 1;
				};
			detach _dog;
			_dog domove (position player);
			_dog setspeedmode "FULL";
			//Make dog hungrier for doing work for the player
			 if((_FutureFeedTime - _currTime)  > 500) then {
				_FutureFeedTime = _FutureFeedTime - 300;
			 };
			};
		};
	//getin, no bikes
	if ((vehicle player != player) && ((vehicle player isKindOf "car") || (vehicle player isKindOf "air") || (vehicle player isKindOf "ship"))) then
		{
		_veh = vehicle player;
		_dog domove position _veh;
		_dog setspeedmode "FULL";
		_stopWait = (time + 10);
		waituntil {_dog domove position _veh; sleep 1; (_dog distance _veh < 5) || time > _stopWait};
		_dog attachto [_veh,[0,-0.5,-1],"podlaha"];
	//getout
		waitUntil{sleep 2;((vehicle player == player) || (!alive _dog) || (!alive player))};
		sleep 1;
		detach _dog;
		_dog setPos (getposATL player);
		_veh = objNull;
		};
	//tofar
	if ((player distance _dog) > 1200) then
		{
		//_dog  setDamage 1; //GHK What about teleporting with anomalies? 
		};
	//toClose
	if ((player distance _dog) < 5) then 
		{
		_dog switchmove "Dog_Siting";
		}
		else
		{
			if((player distance _dog) > 40) then {
				//case where player is on a bike, or vehicle that dog cannot attach to
				if ((vehicle player != player) && ((vehicle player isKindOf "car") || (vehicle player isKindOf "air")|| (vehicle player isKindOf "motorcycle") || (vehicle player isKindOf "ship"))) then
				{ 
					//put dog 3 meter behind player vehicle
					_veh = vehicle player;
					_mypos = getposATL _veh;
					_dir = getdir _veh;
					_mypos = [(_mypos select 0)-(3)*sin(_dir),(_mypos select 1)-(3)*cos(_dir), (_mypos select 2)];
				
					//_dog setPos (getposATL player);
					_dog setPos (_mypos);			
				
				} else {
					//put dog 1 meter behind player
					_mypos = getposATL player;
					_dir = getdir player;
					_mypos = [(_mypos select 0)-(1)*sin(_dir),(_mypos select 1)-(1)*cos(_dir), (_mypos select 2)];
				
					//_dog setPos (getposATL player);
					_dog setPos (_mypos);
				};
				
			}else{
				//diag_log ("ghk: dog sprinting");
				_dog switchmove ""; //Dog_Sprint
				_dog domove position player;
				_dog setspeedmode "FULL";			
			};
		};
	_foo = objNull;
	sleep 3;
	};
};
if(player getVariable["dogSwitch",0]==0) then {
	//dog died of natural causes, not due to player costume switch, so remove dogtags
	if(('CDF_dogtags' in Weapons player)) then {
		player RemoveWeapon "CDF_dogtags";
		//GHK Force the server to know:-
		//_magazinesplayer	= call player_countmagazines; //magazines player;
			dayzPlayerSave = [player,dayz_Magazines,false];
			publicVariableServer "dayzPlayerSave";	
	};
	player setVariable ["dogID", 0];
	DZ_set_has_dead_dog =[dayz_characterID,time];
	publicVariableServer "DZ_set_has_dead_dog";
	dayz_has_dead_dog =true;
};
//player setVariable ["dogID", 0];
//dog or player dead, kill the dog.
//diag_log ("ghk: dog loop over");
   _dog  setDamage 1;
sleep 15;
hideBody _dog;
sleep 5;	
deleteVehicle _dog;
_grp = grpNull;

} else {

   systemChat "You already have a dog";
   cutText ["You already have a dog", "PLAIN DOWN"];
};
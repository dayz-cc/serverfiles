private ["_trigger","_stashObject","_nearbyUnits","_bombOwnerUID","_nearbyPlayers","_theBomb","_bombList","_bombposs"];
 
if (!isServer) exitWith {};

fnc_deleteTestObj = {
	_this addMPEventHandler ["MPKilled", {
		diag_log "**GHK TRAP mpkilled called**";
		_this = _this select 0;
		{
			deleteVehicle _x;
		} forEach (_this getVariable ["effects", []]);
		if (isServer) then {
				//condition = "this animationPhase 'LeftShutter' == 0";
			
			_this setPos [(getMarkerpos "respawn_west" select 0), (getMarkerpos "respawn_west" select 1),1000];
			diag_log "**GHK MOVE BEAR TRAP**";
			_this disableAI "FSM";
			_this disableAI "ANIM";
			diag_log "**GHK DELETE BEAR TRAP**";
			deleteVehicle _this;
			
		};
	}];
	diag_log "**GHK TRAP DAMMAGE 1**";
	_this setDamage 1; 
};
 
_trigger = _this select 0;              //The trigger object
_stashObject = _this select 1;  //The stash object
_nearbyUnits = _this select 2;  //All units in trigger area (may not be players).

_stashObject = _trigger getVariable "triggerobject";
diag_log format ["bomb entity found: %1", (_stashObject)];

_bombposs = position _stashObject;
 
diag_log "Bomb is triggered.";
 
_bombOwnerUID = _trigger getVariable "ownerUID"; //Retrieve owner's UID.
 
//Borrowing some DZAI code here. This filters out non-player units from _nearbyUnits
_nearbyPlayers = [];
{
    if (isPlayer _x) then {
                _nearbyPlayers set [(count _nearbyPlayers),_x];
        };
} forEach _nearbyUnits;
 
//diag_log format ["nearbyUnits: %1, _nearbyPlayers: %2.",_nearbyUnits,_nearbyPlayers];
 
//Check if there is at least one player in trigger area that isn't the bomb owner.
if (({(getPlayerUID _x) == _bombOwnerUID} count _nearbyPlayers) > 0 || (dz_survivor_friendly_traps==1 && ({_x getVariable["humanity",0] > 0} count _nearbyPlayers) > 0 )) then {
  diag_log "Bomb creator present.";
} else {
		//Create bomb on trigger object
    _theBomb = createVehicle ["grenade",getPosATL _trigger,[],0,"NONE"];
        //Remove trigger and stash after bomb is created and detonated.
	//GHK, Do this after searching for other bombs below, since the objects are still there when the loops below run
    //deleteVehicle _trigger;
    //deleteVehicle _stashObject;
        diag_log "Exploded bomb. Players in trigger area are not bomb creator.";
	
	//GHK also explode other bombs with 10m? 5m?
	
	_bombList = _bombposs nearObjects 10;
	if (count _bombList > 0) then {
		{
			if(typeOf _x == "EmptyDetector" && typeOf (_x getVariable["triggerobject",_x]) == "Grave" && (!(_x == _stashObject))) then { //just return _x object if no triggerobject, and check for thisTrigger in the list
					//diag_log "found explosive trigger";
					deleteVehicle _x;
			};	
			if(typeOf _x == "Grave" && (!(_x == _stashObject))) then { //check for thistrigger explosive in the list
				diag_log "found explosive";
				deleteVehicle _x;
				//diag_log "creating explosion";
				_theBomb = createVehicle ["grenade",getPosATL _x,[],0,"NONE"];
			};
		} forEach _bombList;
	};
		
		
		
	deleteVehicle _trigger;
   deleteVehicle _stashObject;
 // _stashObject setDamage 1;
	
		
};
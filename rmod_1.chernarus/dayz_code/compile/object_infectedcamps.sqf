/*
	Created exclusively for ArmA2:OA - DayZMod.
	Please request permission to use/alter from R4Z0R49.
*/



private ["_markerstr","_counter","_camp","_campName","_campPos","_campAmount","_campRadius","_trigger","_trgcode","_array"];
_array = _this;
_counter = 0;

{
	_counter = _counter + 1;
	_camp = _x;
	_campName = format["BaseCamp_%1",_counter];
//diag_log ("CampGHK: " +str(_x));
	_campPos = _camp select 0;
//diag_log ("CampPosGHK: " +str(_campPos));
	_campAmount = _camp select 1;
	_campAmount = _campAmount; // + 5; //GHK Add another 5
//diag_log ("CampAmontGHK: " +str(_campAmount));
	_campRadius = _camp select 2;
//diag_log ("CampRadius: " +str(_campRadius));

	_trigger = createTrigger["EmptyDetector",_campPos];
_trigger setTriggerArea[_campRadius,_campRadius+100,false];
//_trigger setTriggerArea[20,20,false];
	_trigger setTriggerActivation["ANY","PRESENT",true];
	//_trgcode = 'titleText ["ghkcamp trigger code", "PLAIN DOWN"]';
	_trgcode = format["[%1,%2] spawn camp_spawnZombies;",_campPos,_campAmount];
	//_trgcode = [_campPos,_campAmount] spawn camp_spawnZombies;
	_trigger setTriggerStatements["vehicle player in thislist", _trgcode, ""];
	//_trigger setTriggerTimeout [0, 5, 3, false];

	
	if ("ItemMap_Debug" in items player) then {
		_markerstr = createMarker [_campName,_campPos];
		_markerstr setMarkerColor "ColorRed";
		_markerstr setMarkerShape "ELLIPSE";
		_markerstr setMarkerBrush "Border";
		_markerstr setMarkerSizeLocal [_campRadius, _campRadius];
	};
	
} foreach _array;

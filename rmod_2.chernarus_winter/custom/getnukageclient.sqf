
diag_log ("getnukageclient called");diag_log (mdh_nuke_destruction_zone);
//replicates as closely as possible all environmental damage of the original nuke for clients that joined in after.
diag_log((_this select 0));
nuke1detonated = (_this select 0) select 0; //cherno
nuke2detonated = (_this select 0) select 1; //elektro
nuke3detonated = (_this select 0) select 2; //berezino a
nuke4detonated = (_this select 0) select 3; //berezino b
nuke5detonated = (_this select 0) select 4; //NWAF
nuke6detonated = (_this select 0) select 5; //NEAF
nuke7detonated = (_this select 0) select 6; //CARRIER
nuke8detonated = (_this select 0) select 7; //STARY SOBOR
nuke9detonated = (_this select 0) select 8; //WEST KAMENKA

createdevastation = {
	private ["_nukepos","_array"];
	_nukepos = _this select 0;
	
			diag_log("nuke pos:");diag_log(_nukepos);diag_log((getpos _nukepos));
			
		
		/*
		{_x setdamage 1;} forEach (nearestObjects [(getpos _nukepos), [], mdh_nuke_destruction_zone]);
		*/
		
		_array = (getPos _nukepos) nearObjects ["Thing", mdh_nuke_destruction_zone];
		{_x setdamage 1;} forEach _array;
		
		//ensure that we do not wipe out player death inventory
		_array = ((getPos _nukepos) nearObjects ["Static", mdh_nuke_destruction_zone]) - ((getPos _nukepos) nearObjects ["AmmoBoxSmall", mdh_nuke_destruction_zone]);
		{_x setdamage 1;} forEach _array;
	
		_array = ((getPos _nukepos) nearObjects ["Strategic",mdh_nuke_destruction_zone]) - ((getPos _nukepos) nearObjects ["AmmoBoxSmall", mdh_nuke_destruction_zone]);
		{_x setdamage 1;} forEach _array;

		_array = (getPos _nukepos) nearObjects ["NonStrategic", mdh_nuke_destruction_zone];
		{_x setdamage 1;} forEach _array;
	
		//get trees
		_array =  (nearestObjects [_nukepos, [],  mdh_nuke_destruction_zone]) - (nearestObjects [_nukepos, ["All"],  mdh_nuke_destruction_zone]);
		{_x setdamage 1;} forEach _array;
		

		/*
		_nearObjects2 = nearestObjects [_nukepos, [],  mdh_nuke_destruction_zone];
		{
			
			if([": t_", str(_x)] call fnc_inString) then {
					_x setdamage 1;
			} else {
				if([": b_", str(_x)] call fnc_inString) then {
						_x setdamage 1;
				};
			};
			
		}forEach _nearObjects2;		
		*/
	

};

if (mdh_nuke_destruction_zone > 0) then
{
	if(nuke1detonated) then {
		areaee1 = createMarkerLocal ["areaee1", position nukepos1];
		"areaee1" setMarkerShapeLocal "ELLIPSE";
		"areaee1" setMarkerSizeLocal [1000, 1000];
		"areaee1" setMarkerColorLocal "ColorRed";

		_markerobjareaee1 = createMarkerLocal ["natext1", position nukepos1];
		_markerobjareaee1 setMarkerShapeLocal "ICON";
		_markerobjareaee1 setMarkerTypeLocal "Vehicle";
		_markerobjareaee1 setMarkerColorLocal "ColorRed";
		_markerobjareaee1 setMarkerTextLocal "Nuclear Blast Zone";
	
		[nukepos1] call createdevastation; 
		
	
		
	};
	if(nuke2detonated) then {
		areaee2 = createMarkerLocal ["areaee2", position nukepos2];
		"areaee2" setMarkerShapeLocal "ELLIPSE";
		"areaee2" setMarkerSizeLocal [1000, 1000];
		"areaee2" setMarkerColorLocal "ColorRed";

		_markerobjareaee2 = createMarkerLocal ["natext2", position nukepos2];
		_markerobjareaee2 setMarkerShapeLocal "ICON";
		_markerobjareaee2 setMarkerTypeLocal "Vehicle";
		_markerobjareaee2 setMarkerColorLocal "ColorRed";
		_markerobjareaee2 setMarkerTextLocal "Nuclear Blast Zone";
		[nukepos2] call createdevastation; 
	
		
	};

	if(nuke3detonated) then {
		areaee3 = createMarkerLocal ["areaee3", position nukepos3];
		"areaee3" setMarkerShapeLocal "ELLIPSE";
		"areaee3" setMarkerSizeLocal [1000, 1000];
		"areaee3" setMarkerColorLocal "ColorRed";

		_markerobjareaee3 = createMarkerLocal ["natext3", position nukepos3];
		_markerobjareaee3 setMarkerShapeLocal "ICON";
		_markerobjareaee3 setMarkerTypeLocal "Vehicle";
		_markerobjareaee3 setMarkerColorLocal "ColorRed";
		_markerobjareaee3 setMarkerTextLocal "Nuclear Blast Zone";	
		[nukepos3] call createdevastation; 
	
		
	};
	if(nuke4detonated) then {
		areaee4 = createMarkerLocal ["areaee4", position nukepos4];
		"areaee4" setMarkerShapeLocal "ELLIPSE";
		"areaee4" setMarkerSizeLocal [1000, 1000];
		"areaee4" setMarkerColorLocal "ColorRed";

		_markerobjareaee4 = createMarkerLocal ["natext4", position nukepos4];
		_markerobjareaee4 setMarkerShapeLocal "ICON";
		_markerobjareaee4 setMarkerTypeLocal "Vehicle";
		_markerobjareaee4 setMarkerColorLocal "ColorRed";
		_markerobjareaee4 setMarkerTextLocal "Nuclear Blast Zone";	
		[nukepos4] call createdevastation; 
	
		
	};
	
	if(nuke5detonated) then {
		areaee5 = createMarkerLocal ["areaee5", position nukepos5];
		"areaee5" setMarkerShapeLocal "ELLIPSE";
		"areaee5" setMarkerSizeLocal [1000, 1000];
		"areaee5" setMarkerColorLocal "ColorRed";

		_markerobjareaee5 = createMarkerLocal ["natext5", position nukepos5];
		_markerobjareaee5 setMarkerShapeLocal "ICON";
		_markerobjareaee5 setMarkerTypeLocal "Vehicle";
		_markerobjareaee5 setMarkerColorLocal "ColorRed";
		_markerobjareaee5 setMarkerTextLocal "Nuclear Blast Zone";		
		[nukepos5] call createdevastation; 
	
		
	};
	if(nuke6detonated) then {
		areaee6 = createMarkerLocal ["areaee6", position nukepos6];
		"areaee6" setMarkerShapeLocal "ELLIPSE";
		"areaee6" setMarkerSizeLocal [1000, 1000];
		"areaee6" setMarkerColorLocal "ColorRed";

		_markerobjareaee6 = createMarkerLocal ["natext6", position nukepos6];
		_markerobjareaee6 setMarkerShapeLocal "ICON";
		_markerobjareaee6 setMarkerTypeLocal "Vehicle";
		_markerobjareaee6 setMarkerColorLocal "ColorRed";
		_markerobjareaee6 setMarkerTextLocal "Nuclear Blast Zone";
		[nukepos6] call createdevastation; 
	
		
	};
	
	if(nuke7detonated) then {
		areaee7 = createMarkerLocal ["areaee7", position nukepos7];
		"areaee7" setMarkerShapeLocal "ELLIPSE";
		"areaee7" setMarkerSizeLocal [1000, 1000];
		"areaee7" setMarkerColorLocal "ColorRed";

		_markerobjareaee7 = createMarkerLocal ["natext7", position nukepos7];
		_markerobjareaee7 setMarkerShapeLocal "ICON";
		_markerobjareaee7 setMarkerTypeLocal "Vehicle";
		_markerobjareaee7 setMarkerColorLocal "ColorRed";
		_markerobjareaee7 setMarkerTextLocal "Nuclear Blast Zone";		
	
		[nukepos7] call createdevastation; 
	
		
	};
	
	if(nuke8detonated) then {
		areaee8 = createMarkerLocal ["areaee8", position nukepos8];
		"areaee8" setMarkerShapeLocal "ELLIPSE";
		"areaee8" setMarkerSizeLocal [1000, 1000];
		"areaee8" setMarkerColorLocal "ColorRed";

		_markerobjareaee8 = createMarkerLocal ["natext8", position nukepos8];
		_markerobjareaee8 setMarkerShapeLocal "ICON";
		_markerobjareaee8 setMarkerTypeLocal "Vehicle";
		_markerobjareaee8 setMarkerColorLocal "ColorRed";
		_markerobjareaee8 setMarkerTextLocal "Nuclear Blast Zone";	
		[nukepos8] call createdevastation; 
	
		
	};
	
	if(nuke9detonated) then {
		areaee9 = createMarkerLocal ["areaee9", position nukepos9];
		"areaee9" setMarkerShapeLocal "ELLIPSE";
		"areaee9" setMarkerSizeLocal [1000, 1000];
		"areaee9" setMarkerColorLocal "ColorRed";

		_markerobjareaee9 = createMarkerLocal ["natext9", position nukepos9];
		_markerobjareaee9 setMarkerShapeLocal "ICON";
		_markerobjareaee9 setMarkerTypeLocal "Vehicle";
		_markerobjareaee9 setMarkerColorLocal "ColorRed";
		_markerobjareaee9 setMarkerTextLocal "Nuclear Blast Zone";		
		[nukepos9] call createdevastation; 
	
		
	};	

};
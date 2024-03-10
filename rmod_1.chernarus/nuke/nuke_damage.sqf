//////////////////////////////////////////////////////////////
// MADE BY MOERDERHOSCHI
// ARMED-ASSAULT.DE
// 06.11.2013
//////////////////////////////////////////////////////////////


if (mdh_nuke_destruction_zone > 0) then
{
	if((player distance (getpos nukepos)) <= 1000) then {
			r_player_blood = -1000;
			player setVariable["USEC_BloodQty",r_player_blood,true];
			player setVariable["medForceUpdate",true];
	};
	
	//{_x setdamage 1;} forEach (nearestObjects [(getpos nukepos), [], mdh_nuke_destruction_zone]); <--default 
	
	//but lets keep certain crates and weaponholders
	//Do _EP1 crates subclass from Arma2 cousins?
	//_array = (nearestObjects [(getpos nukepos), [], mdh_nuke_destruction_zone]) - (nearestObjects [(getpos nukepos), ["USBasicAmmunitionBox","RUBasicAmmunitionBox","LocalBasicAmmunitionBox","GuerillaCacheBox","AmmoBoxSmall"], mdh_nuke_destruction_zone]);
	//AMMOBOXSMALL keeps players inventory after death
	_array = (nearestObjects [(getpos nukepos), [], mdh_nuke_destruction_zone]) - (nearestObjects [(getpos nukepos), ["AmmoBoxSmall"], mdh_nuke_destruction_zone]);
	
	{_x setdamage 1;} forEach _array;

	
};
/*
//_array = (nearestObjects [nukepos,[], 100]) - ((getPos nukepos) nearObjects 500);
//{DeleteCollection _x} forEach _array;

		//hide trees closer to blast
		_array =(nearestObjects [nukepos, [], 500]) - (nearestObjects [nukepos, ["All"], 500]);
		{
		_x setPosATL [getPosATL _x select 0, getPosATL _x select 1, (getPosATL _x select 2)-100];
		hideObject _x;
		DeleteCollection _x;
		deleteVehicle _x;
		} forEach _array;
*/
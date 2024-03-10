//[unit, selectionName, damage, source, projectile]
//will only run when local to the created object
//record any key hits to the required selection
private["_zed","_killer","_kills","_array","_type"];

_array = 		_this select 0;
_zed = 			_array select 0;
_killer = 		_array select 1;
_type = 		_this select 1;
//award 5 zombie kills for a mutant kill
if (local _zed) then {

	_kills = _killer getVariable[_type,0];
	//if(_zed isKindOf "uac_bloodsucker") then {
		//_killer setVariable[_type,(_kills + 5),true];
	//} else {
		//regular ns_bloodsucker
		_killer setVariable[_type,(_kills + 5),true];
	//};
	dz_bloodsucker_count = dz_bloodsucker_count - 1;
	publicVariable "dz_bloodsucker_count";
	
};
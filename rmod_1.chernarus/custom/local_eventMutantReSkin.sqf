//[unit, selectionName, damage, source, projectile]
//will only run when local to the created object
//record any key hits to the required selection
private["_zed","_anim","_array","_skin"];

_array = 		_this select 0;
_zed = 			_array select 0;
_anim = 		_array select 1;
_skin = 		_this select 1;

if (isServer&&isMultiplayer) then {


//waitUntil {!isNil ("dayz_Totalzedscheck")};
//diag_log (typeOf _zed);

//if (typeOf _zed == "ns_bloodsucker") then {
	//diag_log (_skin);
//};


//if (isNil "_zed") then {
//	//diag_log ("_zed is undefined");
//};

[nil, nil, rSETOBJECTTEXTURE, _zed, 0, _skin] call RE;

//diag_log ("\nst\ns_mutants\blood\act_krovosos_2.paa"); //_skin;
//diag_log ("MutantReSkin start non_local 1 Called.");
/*if (local _zed) then {
	diag_log ("MutantReSkin local 1 Called.");
	if (typeOf _zed == "ns_bloodsucker") then {
		_zed setObjectTextureGlobal [0, "\nst\ns_mutants\blood\act_krovosos_2.paa"];
		diag_log ("MutantReSkin local 2 Called.");
	};
};*/
//diag_log ("MutantReSkin start non_local 2 Called.");

};
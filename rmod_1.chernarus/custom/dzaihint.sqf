private["_txt","_rnoise"];
_radiotxt = 			_this select 0;

if (!isDedicated) then {

systemChat format["%1",_radiotxt];

/*
	if((player hasWeapon "ItemRadio")) then {
		cutText ["Your radio is picking up a transmission...","PLAIN DOWN"];
		uisleep 3;
		_rnoise = ["radio3"] call BIS_fnc_selectRandom;
		playSound _rnoise;
		cutText [format["[RADIO] (Unknown): %1",_radiotxt], "PLAIN DOWN"];
		//_rnoise = ["radio1","radio2","radio3"] call BIS_fnc_selectRandom;
		//playSound _rnoise;
		
	}else{
		//titleText ["MISSION START - NO RADIO", "PLAIN"];
	};
*/
};
//diag_log format["GHK debug: '%1'",(player hasWeapon "ItemRadio")];
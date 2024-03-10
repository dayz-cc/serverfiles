private["_txt","_rnoise","_new"];
_radiotxt = 			_this select 0;

if (!isDedicated) then {

	if((player hasWeapon "ItemRadio")) then {
		cutText ["Your radio is picking up a transmission...","PLAIN DOWN"];
		uisleep 3;
		_rnoise = ["radio3"] call BIS_fnc_selectRandom;
		if(dz_play_radio_static) then {
			playSound _rnoise;
		};
		cutText [format["[RADIO] (Unknown): %1",_radiotxt], "PLAIN DOWN"];
		//_rnoise = ["radio1","radio2","radio3"] call BIS_fnc_selectRandom;
		//playSound _rnoise;
		 _new=[_radiotxt,"\n"," "] call KRON_Replace;
		systemChat (format["[RADIO] (Unknown): %1",_new]);
	}else{
		//titleText ["MISSION START - NO RADIO", "PLAIN"];
	};

};
//diag_log format["GHK debug: '%1'",(player hasWeapon "ItemRadio")];
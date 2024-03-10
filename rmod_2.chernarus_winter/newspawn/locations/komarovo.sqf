private ["_incombat","_timeout","_ebayrandomspawn"];

_timeout = player getVariable["combattimeout", 0];
_inCombat = if (_timeout >= diag_tickTime) then { true } else { false };

if (_inCombat) then {
	titleText ["You can't select a drop point while in combat.", "PLAIN DOWN", 3];
	sleep 5;
	titleFadeOut 1;
} else {
	titleText ["Dropping at selected location...", "PLAIN DOWN", 3];
	_ebayrandomspawn = [[3608.21,2151.49,1000.0], [3666.51,2642.1,1000.0], [3523.99,2415.42,1000.0], [3468.39,2547.6,1000.0], [3824.01,2589.4,1000.0]] call BIS_fnc_selectRandom;
	player setVariable["ghkcanteleport",true];
	player setPosATL _ebayrandomspawn;
	showCommandingMenu '';
	sleep 2;
		titleText ["Use your Scroll Wheel to open the chute!", "PLAIN DOWN", 3];
	systemChat ('Use your Scroll Wheel to open the chute!');
	sleep 2;
	titleFadeOut 1;
	//execVM "newspawn\classes_execute.sqf";
};
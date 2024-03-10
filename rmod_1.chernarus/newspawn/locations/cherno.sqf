private ["_incombat","_timeout","_ebayrandomspawn"];

_timeout = player getVariable["combattimeout", 0];
_inCombat = if (_timeout >= diag_tickTime) then { true } else { false };

if (_inCombat) then {
	titleText ["You can't select a drop point while in combat.", "PLAIN DOWN", 3];
	sleep 5;
	titleFadeOut 1;
} else {
	titleText ["Dropping at selected location...", "PLAIN DOWN", 3];
	_ebayrandomspawn = [[6686.8,2290.11,1000.0], [7235.6,2233.5,1000.0], [6288.59,2574.14,1000.0], [6827.66,3168.46,1000.0], [6960.53,2550.45,1000.0]] call BIS_fnc_selectRandom;
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